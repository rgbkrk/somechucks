// Initialize instruments
SinOsc kick => dac;
Noise snare => LPF filter => dac;
SinOsc hi_hat => dac;

// Set instrument parameters
440 => kick.freq;
3000 => filter.freq;
10000 => hi_hat.freq;

// Set gain levels
0.5 => kick.gain;
0.3 => filter.gain;
0.1 => hi_hat.gain;

// Set beat durations
1::second => dur beat;
(beat / 2) => dur half_beat;
(beat / 4) => dur quarter_beat;
(beat / 8) => dur eighth_beat;

while(true) {
    // Kick
    1 => kick.gain;
    half_beat => now;
    0 => kick.gain;
    half_beat => now;

    // Snare
    1 => filter.gain;
    quarter_beat => now;
    0 => filter.gain;
    quarter_beat => now;

    // Hi-hat
    1 => hi_hat.gain;
    eighth_beat => now;
    0 => hi_hat.gain;
    eighth_beat => now;
}

