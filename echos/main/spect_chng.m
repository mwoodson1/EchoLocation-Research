function [ out ] = spect_chng( src, A_scale )
%spect_chng Changes the spectrum of a given source signal.
%   src     - The source signal
%   A_scale - How much to scale the amplitude of the signal by.
%
%   As of now only an amplitude scaling is taken into consideration but
%   later the spectrum will change depending on the size of the object
%   detected and other factors. 
out = src*A_scale;

end

