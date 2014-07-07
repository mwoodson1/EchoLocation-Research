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

delayed_echo1 = delay(noEcho,(floor((d1*2)/snd_spd)));
delayed_echo2 = delay(noEcho,(floor((d2*2)/snd_spd)));

out_echosE1 =  spect_chng(delayed_echo1 ,sqrt(I/(4*pi*(d1^2))));
out_echosE2 =  spect_chang(delayed_echo2 ,sqrt(I/(4*pi*(d2^2))));

%Remember to document padcat and give credit
out_echos = padcat(out_echosE1,out_echosE2);

end

