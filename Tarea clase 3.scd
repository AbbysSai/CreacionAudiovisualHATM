// prendemos supercollider
s.boot;

// SynthDef

(
SynthDef(\misinte,{|frec=440, amp=0.5|
	var sen, env;
	sen=SinOsc.ar(frec, 0, amp);
	env=EnvGen.kr(Env.new([0,1,0],[0.1,0.1]),doneAction:2);
	Out.ar(0, sen*env)
}).add
);

// envolvente
Env.new([0,1,0.5,0.5,0],[0.1,0.1,0.1,0.5]).plot;
// Pdef o definicón de patrón
(
~sec1=Pdef(\sec,
	Pbind(\instrument, \misinte,
		\dur, Pseq([0.50, 0.75, 0.200], inf),
		\frec, Pseq([400,200,500],inf),
		\amp, 1
	)
);
)

// Se declaro variable universal
~sec1.play;
~sec1.stop;