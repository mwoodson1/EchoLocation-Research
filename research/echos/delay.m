function [ out ] = delay( src, T, Fs )
%delay Delays an input signal by the given time.
%   Detailed explanation goes here
floor(T*Fs)
zeroo = zeros(1,floor(T*Fs));
%Starts d secs after beggining
echo = [zeroo src];

org = [src zeroo];            %This is left in case we want to include the source signal later
out = echo;% + org;

end

