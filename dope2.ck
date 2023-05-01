// create our drum sounds
Kick kick => dac;
Snare snare => dac;
HiHat hh => dac;

// our time step (sixteenth notes at 120bpm)
22050::samp => dur T;
T*4 => dur beat;

// keep time
0 => int beatCounter;

// our infinite time loop
while( true ) {
    // on the first beat, play the kick
    if( beatCounter % 16 == 0 || beatCounter % 16 == 8 ) {
        kick.noteOn( 0.5 );
    }

    // on the second and fourth beats, play the snare
    if( beatCounter % 16 == 4 || beatCounter % 16 == 12 ) {
        snare.noteOn( 0.5 );
    }

    // play the hi-hat on eighth notes
    if( beatCounter % 2 == 0 ) {
        hh.noteOn( 0.3 );
    }

    // wait for the next beat
    beat => now;

    // increment the beat counter
    beatCounter++;
}

