function [ S ] = makeEchos( d_map, w, r )
%makeEchos Primary function for construct of binaural echos
%   Given a depth map this function produces a sound vector for binaural
%   listening.
%
%   d_map - depth map
%   w     - width of the head
%   r     - degrees of vision from center

Fs = 441000;                %Sampling rate
horz_deg = 57;              %Degrees the kinect can see horizontally
vert_deg = 43;              %Degrees the kinect can see vertically
[len, width] = size(d_map);

d_map2 = circleFilter(d_map,r,(horz_deg/width));

%The d_map is with respect to 1 point which we consider to be the middle of
%the head so we need to calculate the depth map for the left and right ears
%respectively.
[l, r] = getBinauralDepth(d_map2, w);

S = [];

for i=1:len
    for j=1:width
        d_l = l(i,j);
        d_r = r(i,j);
        
        echos = echoGen(d_l, d_r);
        S = echos;
        
%         if(i == 1 && j == 1)
%             S = echos;
%         else
%             v1 = echos(1,:);
%             v2 = echos(2,:);
%             s1 = S(1,:);
%             s2 = S(2,:);
%             S(1,:) = addFill(v1,s1);
%             S(2,:) = addFill(v2,s2);
%         end
    end
end
tmp = S(1,:);
S(1,:) = S(2,:);
S(2,:) = tmp;
%S = S./(len*width);