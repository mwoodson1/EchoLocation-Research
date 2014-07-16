function [ r, l ] = angleToBinaural( theta, d, w)
%angleToBinaural Gives left and right ear depths.
%   Left and right ear distances are calculated from the angle from the
%   normal and the distance to said object.
if(d < 0)
    thetaR = 90 - theta;
    thetaL = 90 + theta;
elseif(d > 0)
    thetaR = 90 - theta;
    thetaL = 90 + theta;
else
    thetaR = 90;
    thetaL = 90;
end

r = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cosd(thetaR));
l = sqrt((w/2)^2 + d^2 + 2*d*(w/2)*cosd(thetaL));

end

