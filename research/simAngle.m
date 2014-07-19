d = 3;
w = .15;
[r, l] = angleToBinaural(60,d,w);
ramp = [1:-.01:0];
angle45 = echoGen(r,l);
angle45 = rampDown(angle45,ramp);

sameDist1 = echoGen(1,1);
sameDist10 = echoGen(10,10);
sameDist25 = echoGen(25,25);
sameDist100 = echoGen(100,100);
testLR = echoGen(5,3.4);