TITLE Leak Current From Ooker
: Passive leak current

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
}

NEURON{
	SUFFIX leak
	NONSPECIFIC_CURRENT i
	RANGE i,e,g
}

PARAMETER{
	g = 0.01 (siemens/cm2)
	e = -72.133802969161930 (mV)
}

ASSIGNED{
	v	(mV)
	i 	(mA/cm2)
}

BREAKPOINT { i = g*(v-e)}