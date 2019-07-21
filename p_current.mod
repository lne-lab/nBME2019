TITLE Sodium current from Oozer

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
	(S)  = (siemens)
}

NEURON{
	SUFFIX pc
	USEION na READ ena WRITE ina
	RANGE gp, g, i
}

PARAMETER{
	gp = 0.012 (S/cm2)
}

ASSIGNED{
	v	(mV)
	ena (mV)
	ina (mA/cm2)
	i (mA/cm2)
	g (S/cm2)
}

STATE {
	p
}

BREAKPOINT{
	SOLVE states METHOD cnexp
	g = gp * p^3
	i = g * (v-ena)
	ina = i
}

INITIAL{
	p = alphap(v)/(alphap(v)+betap(v))
}

DERIVATIVE states{
	p' = (1-p)*alphap(v) - p*(betap(v))
}

FUNCTION alphap(Vm (mV))
{
	LOCAL x
	UNITSOFF
	x = (Vm+19)/10.2
	if(fabs(x) < 1e-6)
	{
		alphap = 0.0151*10.2
	}
	else
	{
		alphap = 0.0151*(Vm+19)/(1-exp(-x))
	}
	UNITSON
}

FUNCTION betap(Vm (mV)){
	LOCAL x
	UNITSOFF
	x = -(Vm+26)/10
	if(fabs(x) < 1e-6)
	{
		betap = 0.000379*10
	}
	else
	{
		betap = 0.000379*-(Vm+26)/(1-exp(-x))
	}
	UNITSON
}
