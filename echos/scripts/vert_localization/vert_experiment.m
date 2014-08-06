%Tests to determine which method is best for vertical localization.
%Testing with white noise is done as vertical localization is said
%to be done best with this(Jack Hebrank & D. Wright.
noise = wgn(1,44100*1,0);
noise = noise*.1;
audiowrite('noise_ref.wav',noise,44100);

f_cutoff = 4.5;
lpFilteredNoise1 = lpf(noise,f_cutoff,f_cutoff+1.5);
audiowrite('lowPass4_5K.wav',lpFilteredNoise1,44100);

f_cutoff = 6.5;
lpFilteredNoise2 = lpf(noise,f_cutoff,f_cutoff+1.5);
audiowrite('lowPass6_5K.wav',lpFilteredNoise2,44100);

f_cutoff = 8.0;
lpFilteredNoise3 = lpf(noise,f_cutoff,f_cutoff+1.5);
audiowrite('lowPass8_0K.wav',lpFilteredNoise3,44100);

f_cutoff = 10.3;
lpFilteredNoise4 = lpf(noise,f_cutoff,f_cutoff+1.5);
audiowrite('lowPass10_3K.wav',lpFilteredNoise4,44100);

f_pass = 10.0;
hpFilteredNoise1 = hpf(noise,f_pass-1,f_pass);
audiowrite('highPass10_0K.wav',hpFilteredNoise1,44100);

%The best method the paper describes is a 1/4 octave peak at 7-9kHz
%and a 10kHz low pass filter. Below is that implementation
peak = peakFilter(noise);
peakFiltered = lpf(peak,10,11.5);

L = length(noise);
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(noise,NFFT)/L;
f = 44100/2*linspace(0,1,NFFT/2+1);

% Plot single-sided amplitude spectrum.
plot(f,2*abs(Y(1:NFFT/2+1))) 
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')




