// MIDI

if(MIDIClient.sources.size==0,
	{ MIDIIn.connectAll },
	{ "MIDI already connected".postln }
);
~quneoChannel = 11;
~bank = 36;

MIDIdef.noteOn(
	key: \noteOn,
	func: {arg vel, note;
		var index = note;
		/*padArray[index] = Synth("playBuf", [
		\bufnum, bufferArray[index],
		\rate, rateArray[index], // attack of note should be at correct rate based on x axis
		\amp, vel/127,
		\loop, loopSwitch
		]);*/
		//~drums[index].reset.play (quant: 1/4);

		~padArray[index].reset.play (quant: 1/4);


		case
		{ note >= 84 } { ~bank = 84 }
		{ note >= 68 } { ~bank = 68 }
		{ note >= 52 } { ~bank = 52 }
		{ note >= 36 } { ~bank = 36 };

		["noteON", index, "BANK", ~bank].postln;
	},
	noteNum: (36..99),
	chan: ~quneoChannel);

MIDIdef.noteOff(
	key: \noteOff,
	func: {arg vel, note;
		var index = note;
		~padArray[index].stop;

		/* release; // release node
		~padArray[55] = nil;
		//~previousXvalues[55] = nil;
		~rateArray[55] = nil;
		*/
		["noteOFF", index].postln;
	},
	noteNum: (36..99),
	chan: ~quneoChannel);

"Sampling QuNeo".postln;