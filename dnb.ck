// our time step
0.06::second => dur T;
0.12::second => dur T2;

// the kick
SndBuf kick => dac;
// the snare
SndBuf snare => dac;
// the bass
SndBuf bass => dac;

// load the samples
"685116__logicogonist__kick-hard-core-1.wav" => kick.read;
"685117__logicogonist__snare-hard-core-1.wav" => snare.read;
"634847__collinb1000__bd2.wav" => bass.read;

// infinite time loop
while(true)
{
    // kick + bass
    1 => kick.pos;
    1 => bass.pos;
    T => now;
    
    // kick
    1 => kick.pos;
    T => now;
    
    // snare
    1 => snare.pos;
    T2 => now;
    
    // kick
    1 => kick.pos;
    T => now;
}
