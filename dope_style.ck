// Load samples
"685116__logicogonist__kick-hard-core-1.wav" => string kickSample;
"685117__logicogonist__snare-hard-core-1.wav" => string snareSample;

// Initialize instruments
SndBuf kick => dac;
SndBuf snare => dac;
Noise hi_hat => LPF hi_hat_filter => dac;
SinOsc bass => dac;

// Load samples into buffers
kick.read(kickSample);
snare.read(snareSample);

// Set hi-hat and bass parameters
1000 => hi_hat_filter.freq;
0.2 => hi_hat_filter.gain;
50 => bass.freq;
0.3 => bass.gain;

// Set beat durations
1::second => dur beat;
(beat / 2) => dur half_beat;
(beat / 4) => dur quarter_beat;
(beat / 8) => dur eighth_beat;

while(true) {
    // Kick
    0 => kick.pos;
    1 => kick.gain;
    half_beat => now;
    0 => kick.gain;
    half_beat => now;

    // Snare
    0 => snare.pos;
    1 => snare.gain;
    quarter_beat => now;
    0 => snare.gain;
    quarter_beat => now;

    // Hi-hat
    1 => hi_hat_filter.gain;
    eighth_beat => now;
    0 => hi_hat_filter.gain;
    eighth_beat => now;

    // Bass
    if (Math.random2(0, 1) == 0) {
        Std.mtof(Math.random2(40, 43)) => bass.freq;
    } else {
        Std.mtof(Math.random2(45, 47)) => bass.freq;
    }
    1 => bass.gain;
    quarter_beat => now;
    0 => bass.gain;
    quarter_beat => now;
}

