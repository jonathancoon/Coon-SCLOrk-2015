// CONDUCTOR

f.value(60);

f = {arg bpm = 60; ~laptop2.sendMsg("/tempo", bpm/60); ~laptop3.sendMsg("/tempo", bpm/60)};
//~conductorTempo = 60/60; // sent to other machine via OSC
~laptop2 = NetAddr("127.0.0.1", 57120);
~laptop3 = NetAddr("172.16.66.193", 57120);
~laptop4 = NetAddr("129.210.101.33", 57120);


// Event help file for pbind keys


~tempo = 60;

(
Pbind(
	\type, \test,
	\osc, Pfunc({ ~laptop3.sendMsg("/tempo", 1); ~laptop4.sendMsg("/tempo", 1) }),
	\tempo, Pfunc({ ~tempo/60 })
).trace.play;
)
