function [ S ] = makeEchos( d_map, w, r, g, ref )
%makeEchos Primary function for construct of binaural echos
%   Given a depth map this function produces a sound matrix for left and
%   right ear channels.
%
%   d_map - depth map
%   w     - width of the head
%   r     - degrees of vision from center
%   g     - percent gain on echo (float between 0 and 1)
%   ref   - binary flag signaling to include the reference signal

%Data is given in millimeters but calculations depend on meters
d_map = double(d_map) ./ 1000;

Fs = 44100;                 %Sampling rate
horz_deg = 57;              %Degrees the kinect can see horizontally
vert_deg = 43;              %Degrees the kinect can see vertically
[len, width] = size(d_map);

%Masking the depth map to only consider a small circular window in the
%middle of the image. 
d_map2 = circleFilter(d_map,r,(horz_deg/width));
figure;
imagesc(d_map2);
colormap('gray');

%The d_map is with respect to 1 point which we consider to be the middle of
%the head so we need to calculate the depth map for the left and right ears
%respectively.
[l, r] = getBinauralDepth(d_map2, w);

%Set 0 elements to infinity so we don't use this when finding the minimum
d_map2(d_map2 == 0) = inf;

%There may be a problem below with finding the minimum distance as if we
%have a flat wall we will consider the minimum to be the top left pixel
%when in fact it will be the middle of the image that is the smallest
%distance to both ears. 
%Find the minimum depth in the filtered region we have
[m,I] = min(d_map2);
[m2,I2] = min(m);

%Get the left and right depths
l_d = l(I(I2),I2);
r_d = r(I(I2),I2);

%Generate the echo for the minimum distance.

echo = echoGen(l_d,r_d,g,ref);
S = echo;
