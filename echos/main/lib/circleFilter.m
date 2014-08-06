function [ d2 ] = circleFilter(d, r, x)
%circleFilter: Filters an image with a circular mask centered in the middle
%of the image with a radius of r degrees.
% 
%   r - degrees of vision
%   x - degrees per pixel
[len, width] = size(d);
r = round(r/x);

cx=floor(width/2);cy=floor(len/2);ix=width;iy=len;
[x,y] = meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
cmask = double(((x.^2+y.^2)<=r^2));
d2 = cmask.*d;

end

