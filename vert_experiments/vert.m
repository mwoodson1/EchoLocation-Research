%3ms sweeps from 2-20KHz
Fs = 44100;

%1 ms = .001 s
T = .003;
t = 0:(1/Fs):T;

y1 = [];
for(f=20:-.5:2)
   ff = f*1000; 
   a = .5;
   y = a*sin(2*pi*f*t);
   
   y1 = [y1 y];
end


sound(y1,Fs);
pause;

%Want a notch filter at ~ 7.5Khz
wo = 9000/(Fs/2); bw = wo/50;
[b,a] = iirnotch(wo,bw,-10);

y = filter(b,a,y1);

sound(y,Fs);

