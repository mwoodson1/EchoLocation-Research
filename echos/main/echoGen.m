function [ out_echos ] = echoGen( d1 , d2, g, ref )
%echoGen Generates a reference tone and echos to two ears.
%   d1 = distance to right ear in meters
%   d2 = distance to left ear in meters
%   g  = percent gain on echo
%   r  = binary flag to enable the reference signal or not
% Assumptions: 
%  - an inverse square loss in amplitude with respect to distance
%  - highest frequency human ears can hear is 20KHz so Fs = 44100
%  - medium of travel is dry air so speed of sound = 343 m/s
Fs = 44100;
snd_spd = 343; 

[noEcho, A] = generateTone();

%The intensity of the source 
I = A^2;

%Give the time difference to the signal
delayed_echo1 = delay(noEcho,((d1*2)/snd_spd), 44100);
delayed_echo2 = delay(noEcho,((d2*2)/snd_spd), 44100);

%Give the spectrum change
out_echosE1 =  spect_chng(delayed_echo1 ,sqrt(I/(4*pi*(d1^2))));
out_echosE2 =  spect_chng(delayed_echo2 ,sqrt(I/(4*pi*(d2^2))));

%This is the delay needed after reference signal to make adding of the
%signals to work.
emptyT1 = zeros(1,floor(((d1*2)/snd_spd)*Fs));
emptyT2 = zeros(1,floor(((d2*2)/snd_spd)*Fs));

if(ref)
    out_echosE1 =  [noEcho emptyT1] + out_echosE1 + out_echosE1*g;
    out_echosE2 =  [noEcho emptyT2] + out_echosE2 + out_echosE2*g;
else
    out_echosE1 =  out_echosE1 + out_echosE1*g;
    out_echosE2 =  out_echosE2 + out_echosE2*g;
end

%License of use for padcat in lib folder
out_echos = padcat(out_echosE1,out_echosE2);
out_echos = out_echos(:,1:length(out_echos(1,:))-200);

end

