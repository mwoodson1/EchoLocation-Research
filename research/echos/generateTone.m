function [ output, freq, A ] = generateTone( f, T, Fs )
%generateTone: Given a note, time, and sampling rate
%this function will produce a tone at that note for
%the specified time.

%Load the data into variables
A = load('amplitudes.mat');
amps = A.amplitudes;
octaves = A.octave;

%Case on the note given
switch f
    case 'E' 
        freq = octaves(1);
        A = amps(1);
    case 'F'
        freq = octaves(2);
        A = amps(2);
    case 'G'
        freq = octaves(4);
        A = amps(4);
    case 'A'
        freq = octaves(6);
        A = amps(6);
    case 'B' 
        freq = octaves(8);
        A = amps(8);
    case 'C'
        freq = octaves(9);
        A = amps(9);
    case 'D'
        freq = octaves(11);
        A = amps(11);
end

%Set the time step and produce output
Ts = 1/Fs;
t= (0:Ts:T)';
output = A*sin(2*pi*freq*t);

end

