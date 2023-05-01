// our time step
0.5::second => dur T;

// the kick
SinOsc kick => dac;
// the snare
Noise snare => Envelope env => dac;
// the bass
SinOsc bass => dac;

// set initial frequencies
60 => kick.freq;
30 => bass.freq;

// set initial gain
0.8 => kick.gain;
0.6 => bass.gain;

// set envelope parameters
0.8 => env.target;
10::ms => env.duration;

// infinite time loop
while(true)
{
    // kick + bass
    1 => kick.gain;
    1 => bass.gain;
    T => now;
    
    // lower volume of bass
    0 => bass.gain;
    T => now;
    
    // snare
    env.keyOn();
    T => now;
    
    // lower volumes of kick
    0 => kick.gain;
    T => now;
    
    // turn off envelope
    env.keyOff();
}
