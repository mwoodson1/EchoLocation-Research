function [ out ] = delay( src, T, Fs )
%delay Delays an input signal by the given time.
%   Simple multiplication by sampling frequency and delay by that many
%   samples. 
zeroo = zeros(1,floor(T*Fs));
echo = [zeroo src];

out = echo;

end

