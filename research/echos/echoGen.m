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
[tone, A] = generateTone();
tone = tone';

noEcho = tone;

%The intensity of the source 
I = A^2;

%Give the time difference to the signal
delayed_echo1 = delay(noEcho,((d1*2)/snd_spd), 44100);
delayed_echo2 = delay(noEcho,((d2*2)/snd_spd), 44100);

%This is the delay needed after reference signal to make adding of the
%signals to work.
emptyT1 = zeros(1,floor(((d1*2)/snd_spd)*Fs));
emptyT2 = zeros(1,floor(((d2*2)/snd_spd)*Fs));

plot(noEcho);
% figure(2);
% plot(delayed_echo1);
% axis([0 44100*.25 -1 2]);

%Give the spectrum change
out_echosE1 =  spect_chng(delayed_echo1 ,sqrt(I/(4*pi*(d1^2))));
out_echosE2 =  spect_chng(delayed_echo2 ,sqrt(I/(4*pi*(d2^2))));

%[noEcho emptyT1] +
%[noEcho emptyT2] +

out_echosE1 =  delayed_echo1;%out_echosE1;
out_echosE2 =  delayed_echo2;%out_echosE2;

figure;
plot(out_echosE1);
figure;
plot(out_echosE2);
pause;

%Remember to document padcat and give license to use
out_echos = padcat(out_echosE1,out_echosE2);

end

