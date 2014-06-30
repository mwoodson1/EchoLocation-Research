function [ d2 ] = circleFilter(d, r, x)
%circleFilter Summary of this function goes here
%   Detailed explanation goes here
%   r - degrees of vision
%   x - degrees per pixel
[len, width] = size(d);
r = round(r/x);

cx=floor(width/2);cy=floor(len/2);ix=width;iy=len;
[x,y] = meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
cmask =((x.^2+y.^2)<=r^2);
%imagesc(d2)
d2 = cmask.*d;
imagesc(d2);

end

