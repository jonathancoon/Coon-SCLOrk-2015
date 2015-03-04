// SYNTHDEFS

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

SynthDef("playBuf", {arg bufnum = 0, rate, amp = 0.5, gate = 1, loop = 0;
	var snd, env;
	env = EnvGen.ar(Env.asr(0.001, 1, 1), gate: gate, doneAction: 2);
	snd = PlayBuf.ar(
		numChannels: ~bufferArray[36].numChannels, // assuming all samples are same num of channels...
		bufnum: bufnum,
		rate: Lag.kr(rate),
		loop: loop);
	snd = snd * env * amp;
	Out.ar(0, snd);
}).add;