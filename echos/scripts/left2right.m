%Simulates an object moving from the left to the right of the head. 
total_echos = [];
for(theta = -90:15:90)
    [r,l] = angleToBinaural(theta, 10, .15);
    echos = echoGen(r,l,0,1);
    total_echos = [total_echos zeros(2,.5*44100) echos];
end