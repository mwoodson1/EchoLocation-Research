function [ C ] = makeLabels( max_v, scl )
%makeLabels Summary of this function goes here
%   Detailed explanation goes here
len = ceil(max_v/scl);
for i=1:len
    C{i} = int2str(2*(i-1));
end

end

