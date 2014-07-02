function [ out_echos ] = echoGen( d1 , d2)
%echoGen Generates a reference tone and echos to two ears.
%   d1 = distance to ear 1 in meters
%   d2 = distance to ear 2 in meters
% Assumptions: 
%  - an inverse square loss in amplitude with respect to distance
%  - highest frequency human ears can hear is 20KHz so Fs = 44100
%  - medium of travel is dry air so speed of sound = 343 ms
Fs = 44100;
snd_spd = 343; 

[noEcho, A] = generateTone();
noEcho = noEcho';

%The intensity of the source 
I = A^2;
out_echosE1 = myEcho(noEcho, (floor((d1*2)/snd_spd))*Fs, sqrt(I/(4*pi*(d1^2))));
out_echosE2 = myEcho(noEcho, (floor((d1*2)/snd_spd))*Fs, sqrt(I/(4*pi*(d2^2))));

%Remember to document padcat and give credit
out_echos = padcat(out_echosE1,out_echosE2);

end

