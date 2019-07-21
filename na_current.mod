TITLE Sodium current from Oozer

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
	(S)  = (siemens)
}

NEURON{
	SUFFIX nac
	USEION na READ ena WRITE ina
	RANGE gna, g, i
}

PARAMETER{
	gna = 0.75 (S/cm2)
}

ASSIGNED{
	v	(mV)
	ena (mV)
	ina (mA/cm2)
	i (mA/cm2)
	g (S/cm2)
}

STATE {
	m h
}

BREAKPOINT{
	SOLVE states METHOD cnexp
	g = gna * m^3 * h 
	i = g * (v-ena)
	ina = i
}

INITIAL{
	m = alpham(v)/(alpham(v)+betam(v))
	h = alphah(v)/(alphah(v)+betah(v))
}

DERIVATIVE states{
	m' = (1-m)*alpham(v) - m*(betam(v))
	h' = (1-h)*alphah(v) - h*(betah(v))
}

FUNCTION alpham(Vm (mV))
{
	LOCAL x
	UNITSOFF
	x = (Vm+37)/10
	if(fabs(x) < 1e-6)
	{
		alpham = 0.45*10
	}
	else
	{
		alpham = 0.45*(Vm+37)/(1-exp(-x))
	}
	UNITSON
}

FUNCTION betam(Vm (mV)){
	UNITSOFF
	betam = 15*exp(-(62+Vm)/18)
	UNITSON
}

FUNCTION alphah(Vm (mV)){
	UNITSOFF
	alphah = 0.16*exp(-(67+Vm)/20)
	UNITSON
}

FUNCTION betah(Vm (mV)){
	UNITSOFF
	betah = 2.4/(1+exp(-(37+Vm)/10))
	UNITSON
}