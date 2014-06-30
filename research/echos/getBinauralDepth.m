function [L, R] = getBinauralDepth(d_map, w)
%getBinauralDepth Generates a depth map for left and right ears.
%   We assume that the depth map given is with respect to the center of the
%   head so we generate the depth maps l and r for the left and right ears
%   respectively with law of cosines.
%
%   Using the Microsoft Kinect we have 57 degrees of horizontal vision and
%   43 degrees of vertical vision.
deg_horz = 57;
deg_vert = 43;

[len, width] = size(d_map);

%Splitting the degrees in the horizontal plane
vec1 = [-(deg_horz/2):ceil(deg_horz/width):(deg_horz/2)];

%The left and right ear vectors. 
l = zeros(size(vec1));
r = zeros(size(vec1));

for i=1:length(vec1)
    %If the pixel is to the left of the y axis
    if(vec1(i) < 0)
        thetaR = 90 - vec1(i);
        thetaL = 90 + vec1(i);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %%The bug is here
        d = vec1(i);
        %Law of Cosines
        r(i) = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cos(thetaR));
        l(i) = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cos(thetaL));
    else
    if(vec1(i) > 0)
        thetaR = 90 - vec1(i);
        thetaL = 90 + vec1(i);
        d = vec1(i);
        %Law of Cosines
        r(i) = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cos(thetaR));
        l(i) = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cos(thetaL));
    else
        r(i) = vec1(i);
        l(i) = vec1(i);
    end
    end
end
        
%This contains the degrees from the center of the camera for every pixel in
%the image with respect to the origin x = 0
R = repmat(r,len,1);
L = repmat(l,len,1);

assert(size(R,1) == len);
assert(size(R,2) == width);
assert(size(L,1) == len);
assert(size(L,2) == width);
end

