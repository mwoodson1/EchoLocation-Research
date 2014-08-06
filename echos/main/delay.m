function [ out ] = delay( src, T, Fs )
%delay Delays an input signal by the given time.
%   src - The source signal
%   T   - The amount of time(in seconds) to delay the signal by
%   Fs  - The sampling frequency of src                                    

zeroo = zeros(1,floor(T*Fs));
echo = [zeroo src];

out = echo;

end

