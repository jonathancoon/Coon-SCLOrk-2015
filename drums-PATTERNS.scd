// PATTERNS

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
).play;
);

~padArray[36] = Pbind(
			\instrument, "playBuf",
			\bufnum, ~bufferArray[36],
			\rate, ~rateArray[36], // attack of note should be at correct rate based on x axis
			\amp, 1,
			\dur, Pseq([1, 2, 1], inf),
			//\tempo, Pfunc({ ~tempo }),
			//\legato, 0.3
		).play.stop;

/*
~padArray[37] = Pbind(
			\instrument, "playBuf",
			\bufnum, ~bufferArray[index],
			\rate, ~rateArray[index], // attack of note should be at correct rate based on x axis
			\amp, vel/127,
			\dur, Pseq([1, 2, 1], inf),
			//\tempo, Pfunc({ ~tempo }),
			//\legato, 0.3
		).play.stop;

~padArray[38] = Pbind(
			\instrument, "playBuf",
			\bufnum, ~bufferArray[index],
			\rate, ~rateArray[index], // attack of note should be at correct rate based on x axis
			\amp, vel/127,
			\dur, Pseq([1, 2, 1], inf),
			//\tempo, Pfunc({ ~tempo }),
			//\legato, 0.3
		).play.stop;

~padArray[38] = Pbind(
			\instrument, "playBuf",
			\bufnum, ~bufferArray[index],
			\rate, ~rateArray[index], // attack of note should be at correct rate based on x axis
			\amp, vel/127,
			\dur, Pseq([1, 2, 1], inf),
			//\tempo, Pfunc({ ~tempo }),
			//\legato, 0.3
		).play.stop;
*/