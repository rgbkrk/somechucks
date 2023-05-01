// Declare some constants for the tempo and notes
0 => int tempo;
200.0 => float baseFreq;
0.1 => float noteLength;

// Define the melody
[0, 7, 0, 7, 0, 5, 7, 9, 0, 7, 0, 7, 0, 5, 7, 9] @=> int melody[];

// Define a function to play a note
fun void playNote(int note) {
    if (note != 0) {
        baseFreq * Math.pow(2, note / 12.0) => float freq;
        SinOsc squareWave => dac;
        .5 => squareWave.gain;
        freq => squareWave.freq;
        noteLength::second => now;
        squareWave =< dac;
    } else {
        noteLength::second => now;
    }
}

// Play the melody
while (true) {
    for (0 => int i; i < melody.cap(); i++) {
        playNote(melody[i]);
    }
}
