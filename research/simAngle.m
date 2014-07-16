d = 3;
w = .15;
[r, l] = angleToBinaural(45,d,w);
sameAngle = echoGen(r,l);

sameDist1 = echoGen(1,1);
sameDist10 = echoGen(10,10);
sameDist25 = echoGen(25,25);
sameDist100 = echoGen(100,100);