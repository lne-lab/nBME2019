TITLE Sodium current from Oozer

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
	(S)  = (siemens)
}

NEURON{
	SUFFIX ac
	USEION k READ ek WRITE ik
	RANGE ga, g, i
}

PARAMETER{
	ga = 0.25 (S/cm2)
}

ASSIGNED{
	v	(mV)
	ek (mV)
	ik (mA/cm2)
	i (mA/cm2)
	g (S/cm2)
}

STATE {
	a b
}

BREAKPOINT{
	SOLVE states METHOD cnexp
	g = ga * a^3 * b
	i = g * (v-ek)
	ik = i
}

INITIAL{
	a = alphaa(v)/(alphaa(v)+betaa(v))
	b = alphab(v)/(alphab(v)+betab(v))
}

DERIVATIVE states{
	a' = (1-a)*alphaa(v) - a*(betaa(v))
	b' = (1-b)*alphab(v) - b*(betab(v))
}

FUNCTION alphaa(Vm (mV))
{
	LOCAL x
	UNITSOFF
	x = (Vm+90)/10
	if(fabs(x) < 1e-6)
	{
		alphaa = 0.015*10
	}
	else
	{
		alphaa = 0.015*(Vm+90)/(1-exp(-x))
	}
	UNITSON
}

FUNCTION betaa(Vm (mV)){
	UNITSOFF
	betaa = 0.25*exp(-(30+Vm)/10)
	UNITSON
}

FUNCTION alphab(Vm (mV)){
	UNITSOFF
	alphab = 0.04*exp(-(65+Vm)/20)
	UNITSON
}

FUNCTION betab(Vm (mV)){
	UNITSOFF
	betab = 0.6/(1+exp(-(35+Vm)/10))
	UNITSON
}