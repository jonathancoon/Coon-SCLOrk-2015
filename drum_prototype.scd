(
SynthDef("glitch", { arg freq = 440, modfreq = 5, amp = 0.5, attack = 0.01, release = 0.1, pos = 0, gate = 1;
	var carrier, modulator, env;
	modulator = Blip.ar(modfreq).range(-1, 1);
	carrier = Pulse.ar(freq: freq, mul: modulator);
	env = Env.asr(
		attackTime: attack,
		sustainLevel: amp,
		releaseTime: release).kr(doneAction: 2, gate: gate);
	carrier = carrier + env;

	Out.ar(0, Pan2.ar(Limiter.ar(carrier, 0.2), pos))
}).add;
)
~conductorTempo = 160/60; // sent to other machine via OSC
~laptop2 = NetAddr("127.0.0.1", 57120);
(
OSCdef(
	key: \tempo,
	func: {arg msg; ~laptop2.sendMsg("/tempo", 160/60)},
	path: '/tempo')
)
~laptop2.sendMsg("/tempo", ~conductorTempo);

(
OSCdef(
	key: \tempo,
	func: {arg msg;
		var tempo = msg[1];

		~tempo = tempo;
		~beep.play;
		// ~melodies[note].reset.play (quant: 1/4);
		// ~harmonies[note].reset.play (quant: 1/4);

	},
	path: '/tempo');
)


// Path to samples folder
~folderPath = "/Users/jdcoon/Music/SuperCollider/samples/Drums/KICKS/";






(
~beep = Pbind(
	\instrument, "glitch",
	\freq, 0.001,//Pn([0.001], 1),
	\modfreq, 5,
	\amp, 0.2,
	\attack, 0.02,
	\release, 0.01,
	\pos, 0,
	\dur, 1/4,
	//\tempo, Pfunc({ ~tempo }),
	//\legato, 0.5
).play;
)

(
~beep = Pbind(
	\instrument, "glitch",
	\freq, Pwrand([0.001, rrand(100, 1000)], [0.9, 0.1], inf),//Pn([0.001], 1),
	\modfreq, Prand([(1,2..10)]),
	\amp, 0.2,
	\attack, 0.02,
	\release, 1,
	\pos, 0,
	\dur, 1,
	\tempo, Pfunc({ ~tempo }),
	\legato, 0.25
).play;
)

(
~beep = Pbind(
	\instrument, "glitch",
	\freq, Pwrand([0.001, Pwhite(100, 1000, 1)], [0.9, 0.1], inf),//Pn([0.001], 1),
	\modfreq, Pwrand([7, Pwhite(1.0, 15.0, 1)], [0.5, 0.5], inf),
	\amp, 0.2,
	\attack, 1,
	\release, 0.25,
	\pos, 0,
	\dur, 1,
	\tempo, Pfunc({ ~tempo }),
	\legato, 0.25
).play.stop;
)
