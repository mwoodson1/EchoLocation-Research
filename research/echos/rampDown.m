function [ y ] = rampDown( x, ramp )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x1 = x(1,:);
x2 = x(2,:);

width = length(x1);
filler = ones(1,width - length(ramp));
x1 = x1 .* [filler ramp];
x2 = x2 .* [filler ramp];

y = [x1; x2];

end

