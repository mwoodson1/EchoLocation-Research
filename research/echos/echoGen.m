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
maxV = length(noEcho);
title('Reference Signal (No Echo)');
axis([0 maxV -1 1]);
set(gca,'XTick',[0:floor(.005*Fs):maxV]);
cellArr = makeLabels(maxV,floor(.005*Fs));
set(gca,'XTickLabel',cellArr);
xlabel('Milliseconds');
ylabel('Amplitude');
pause;

%Give the spectrum change
out_echosE1 =  spect_chng(delayed_echo1 ,sqrt(I/(4*pi*(d1^2))));
out_echosE2 =  spect_chng(delayed_echo2 ,sqrt(I/(4*pi*(d2^2))));

%[noEcho emptyT1] +
%[noEcho emptyT2] +

out_echosE1 =  [noEcho emptyT1] + out_echosE1;
out_echosE2 =  [noEcho emptyT2] + out_echosE2;

figure;
plot(out_echosE1);
maxV = length(noEcho);
title('Left Ear Echos, 25m Target Including Reference');
axis([0 maxV -1 1]);
set(gca,'XTick',[0:floor(.005*Fs):maxV]);
cellArr = makeLabels(maxV,floor(.005*Fs));
set(gca,'XTickLabel',cellArr);
xlabel('Milliseconds');
ylabel('Amplitude');
pause;

figure;
plot(out_echosE2);
maxV = length(noEcho);
title('Rgiht Ear Echos, 25m Target Including Reference');
axis([0 maxV -1 1]);
set(gca,'XTick',[0:floor(.005*Fs):maxV]);
cellArr = makeLabels(maxV,floor(.005*Fs));
set(gca,'XTickLabel',cellArr);
xlabel('Milliseconds');
ylabel('Amplitude');
pause;

plot(addFill(noEcho,-out_echosE2));
maxV = length(noEcho);
title('Rgiht Ear Echos, 1m Target Including Reference');
axis([0 maxV -1 1]);
set(gca,'XTick',[0:floor(.005*Fs):maxV]);
cellArr = makeLabels(maxV,floor(.005*Fs));
set(gca,'XTickLabel',cellArr);
xlabel('Milliseconds');
ylabel('Amplitude');
pause;

%Remember to document padcat and give license to use
out_echos = padcat(out_echosE1,out_echosE2);

end

