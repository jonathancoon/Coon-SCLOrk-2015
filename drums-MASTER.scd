// MASTER FILE

// Path to samples folder
~folderPath = "/Users/jdcoon/Music/SuperCollider/samples/Drums/KICKS/";



s.waitForBoot({

	var maxRate, minRate, loopSwitch, previousXvalues, lastTime = 0, count = 0, bank = 36;

	/*if(MIDIClient.sources.size==0,
	{ MIDIIn.connectAll },
	{ "MIDI already connected".postln }
	);
	quneoChannel = 11;*/

	// Initialize stuff
	~padArray = Array.newClear(127);
	~bufferArray = Array.newClear(127);
	~rateArray = Array.fill(127, 1);
	Buffer.freeAll;

	// First read buffers (starting at index 36 of array, to match midi note numbers and make it easy to remember).

	(~folderPath ++ "/*.wav").pathMatch.do({ arg i, c; ~bufferArray[c+36] = Buffer.read(s, i) });

	// Wait until all buffers are read
	s.sync;

	// Now add the SynthDef (note that it will need to know numChannels of buffers)
	"drums-SYNTH.scd".loadRelative;

	// Load Patterns
	"drums-PATTERNS.scd".loadRelative;

	// MIDI from QuNeo
	"drums-MIDI.scd".loadRelative;

	// OSC
	"drums-OSC.scd".loadRelative;


}); // end of block
