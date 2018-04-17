// start here:
(
s.boot;
)

// then here:
(
MIDIClient.init;
MIDIIn.connectAll;
)

// def all the synthings:
(
SynthDef.new(\DigiFluteOsc, {
	arg note_offset = 0, vibrato = 76.339, phase = 0, mul = 1, add = 0;
	var note, note_freq, vibrato_osc;

	note_freq = 27.5 * (2 ** (note_offset / 12.0));
	vibrato_osc = SinOsc.ar(vibrato, mul: 0.05, add: 0.95);

	Out.ar(0, SinOsc.ar(note_freq * vibrato_osc, phase: phase, mul: mul * vibrato_osc, add: add));

}).add;
)

// for the eizbalz:
(
s.scope;
)

// voice 1:
(
var set_note_offset_callback, set_volume_callback, set_vibrato_callback;

~voice_1 = Synth.new(\DigiFluteOsc, ["note_offset", 31, "mul", 0.3]);

set_note_offset_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 12, 139);
	~voice_1.set("note_offset", new_val)
};

set_vibrato_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 1, 300);
	~voice_1.set("vibrato", new_val)
};

set_volume_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 0, 1.0);
	~voice_1.set("mul", new_val)
};

MIDIdef.cc("set_voice_1_note", set_note_offset_callback, 2, 0);
MIDIdef.cc("set_voice_1_vibrato", set_vibrato_callback, 5, 0);
MIDIdef.cc("set_voice_1_volume", set_volume_callback, 82, 0);
)

// voice 2:
(
var set_note_offset_callback, set_volume_callback, set_vibrato_callback;

~voice_2 = Synth.new(\DigiFluteOsc, ["note_offset", 35, "mul", 0.3]);

set_note_offset_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 12, 139);
	~voice_2.set("note_offset", new_val)
};

set_vibrato_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 1, 300);
	~voice_2.set("vibrato", new_val)
};

set_volume_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 0, 1.0);
	~voice_2.set("mul", new_val)
};

MIDIdef.cc("set_voice_1_note", set_note_offset_callback, 3, 0);
MIDIdef.cc("set_voice_1_vibrato", set_vibrato_callback, 6, 0);
MIDIdef.cc("set_voice_1_volume", set_volume_callback, 83, 0);
)

// voice 3:
(
var set_note_offset_callback, set_volume_callback, set_vibrato_callback;

~voice_3 = Synth.new(\DigiFluteOsc, ["note_offset", 38, "mul", 0.3]);

set_note_offset_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 12, 139);
	~voice_3.set("note_offset", new_val)
};

set_vibrato_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 1, 300);
	~voice_3.set("vibrato", new_val)
};

set_volume_callback = {
	arg val, num, chan, source;
	var new_val = val.linlin(0, 127, 0, 1.0);
	~voice_3.set("mul", new_val)
};

MIDIdef.cc("set_voice_1_note", set_note_offset_callback, 4, 0);
MIDIdef.cc("set_voice_1_vibrato", set_vibrato_callback, 7, 0);
MIDIdef.cc("set_voice_1_volume", set_volume_callback, 84, 0);
)

// for debugging:
(
MIDIClient.init;
MIDIIn.connectAll;

MIDIFunc.trace(bool: false);
)

// goodbye:
(
MIDIClient.disposeClient;
~m_synth.free;
s.quit;
)