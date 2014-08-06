function [ out ] = myEcho( x, d, a )
%myEcho Generates an echo of a given signal which a phase shift
%       and scaled amplitude. 
%   x - the original signal
%   d - how much later to play the signal
%   a - scaling of the original amplitude

echo = x*a;
zeroo = zeros(1,d);
%Starts d secs after beggining
first = [zeroo echo];

%The original signal
second = [x zeroo];
out = first + second;
end

