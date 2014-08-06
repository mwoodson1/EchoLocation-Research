function [ r, l ] = angleToBinaural( theta, d, w)
%angleToBinaural Gives left and right ear depths.
%   theta - The input angle in degrees from the center of vision
%   d     - The distance from the center to the object in question
%   w     - Width of the head in meters.
%   
%   Left and right ear distances are calculated from the angle from the
%   normal and the distance to said object.
if(theta ~= 0)
    thetaR = 90 - theta;
    thetaL = 90 + theta;
%If the object is directly ahead then the angle between the line drawn by d
%and the line from the center to the ear is 90 degrees. 
else
    thetaR = 90;
    thetaL = 90;
end

%Calculating the left and right ear distances via Law of Cosines
r = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cosd(thetaR));
l = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cosd(thetaL));

end

