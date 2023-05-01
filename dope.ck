// create our drum sounds
HHClose hh => dac;
Snare snare => dac;
Kick kick => dac;

// set our tempo
TempoClock tClock;
120::T @=> tClock.tempo; // set tempo to 120 bpm

// define our beat patterns
int hhPattern[16] = [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0]; // closed hi-hat on eighth notes
int snarePattern[16] = [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0]; // snare on 2nd and 4th beat
int kickPattern[16] = [1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0]; // kick drum with a basic rock pattern

// infinite loop to keep the beat going
while( true ) {
    // step through each beat
    for( 0 => int beat; beat < 16; beat++ ) {
        // play the hh, snare, and kick if their patterns say to
        if( hhPattern[beat] ) hh.noteOn( 1 );
        if( snarePattern[beat] ) snare.noteOn( 1 );
        if( kickPattern[beat] ) kick.noteOn( 1 );

        // advance the clock one sixteenth note
        1::sixteenthNote => now;
    }
}

