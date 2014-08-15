%Making sample depth maps
%Multiply by 1000 as the first function takes millimeters as an input
%instead of meters
a = 1000 * 1 * ones(10);
b = 1000 * 10 * ones(10);

imagesc(a,[0,10000]);
title('1 Meter Away Wall');
colormap('gray');
figure;
imagesc(b,[0,10000]);
title('10 Meter Away Wall');
colormap('gray');

%The last 0 can be changed to a 1 to include the reference signal in the
%sound vectors. 
echos1 = makeEchos( a, .15, 15, 0, 0 );
echos10 = makeEchos( b, .15, 15, 0, 0 );

%You can play the files with sound(echos1,44100) and sound(echos10,44100)

%Note that the only function that will not be called in the main directory
%is the angleToBinaural file. This is supplemental code and you can see how
%it is run by taking a look at the left2right.m file in the scripts folder.