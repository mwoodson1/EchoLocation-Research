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

%Need to change this and figure out how to get intensity and scaling with a
%non sinusoidal signal
[tone, f, A] = generateTone('F', .25, Fs);
%tone = wgn(1,Fs*.09,0);
%A = .5;
tone = tone';

%I give two seconds in between reference signals
emptyTime = zeros(1,Fs*2);

noEcho = [tone emptyTime];

%The intensity of the source 
I = A^2;
<<<<<<< HEAD

delayed_echo1 = delay(noEcho,(floor((d1*2)/snd_spd)));
delayed_echo2 = delay(noEcho,(floor((d2*2)/snd_spd)));

out_echosE1 =  spect_chng(delayed_echo1 ,sqrt(I/(4*pi*(d1^2))));
out_echosE2 =  spect_chang(delayed_echo2 ,sqrt(I/(4*pi*(d2^2))));
=======
%the new A will be sqrt(I/(4*pi*d^2))
%The echo will occur floor(d*2/c) secs later
out_echosE1 = myEcho(noEcho, (floor((d1*2)/snd_spd))*Fs, sqrt(I/(4*pi*(d1^2))));
out_echosE2 = myEcho(noEcho, (floor((d1*2)/snd_spd))*Fs, sqrt(I/(4*pi*(d2^2))));
>>>>>>> origin/master

%Remember to document padcat and give license to use
out_echos = padcat(out_echosE1,out_echosE2);

end

