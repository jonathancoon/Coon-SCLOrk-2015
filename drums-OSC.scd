// OSC

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