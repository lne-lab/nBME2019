TITLE Sodium current from Oozer

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
	(S)  = (siemens)
}

NEURON{
	SUFFIX sc
	USEION k READ ek WRITE ik
	RANGE gs, g, i
}

PARAMETER{
	gs = 0.001 (S/cm2)
}

ASSIGNED{
	v	(mV)
	ek (mV)
	ik (mA/cm2)
	i (mA/cm2)
	g (S/cm2)
}

STATE {
	s
}

BREAKPOINT{
	SOLVE states METHOD cnexp
	g = gs * s
	i = g * (v-ek)
	ik = i
}

INITIAL{
	s = alphas(v)/(alphas(v)+betas(v))
}

DERIVATIVE states{
	s' = (1-s)*alphas(v) - s*(betas(v))
}

FUNCTION alphas(Vm (mV))
{
	LOCAL x
	UNITSOFF
	x = (Vm-11.5)/7.1
	if(fabs(x) < 1e-6)
	{
		alphas = 0.0032*7.1
	}
	else
	{
		alphas = 0.0032*(Vm-11.5)/(1-exp(-x))
	}
	UNITSON
}

FUNCTION betas(Vm (mV)){
	LOCAL x
	UNITSOFF
	x = -(Vm+76.1)/12.2
	if(fabs(x) < 1e-6)
	{
		betas = 0.0019*12.2
	}
	else
	{
		betas = 0.0019*-(Vm+76.1)/(1-exp(-x))
	}
	UNITSON
}
