function [ snd, A ] = generateTone( )
%generateTone: 
[r_click, Fs] = audioread('ref_click.mp3');
snd = r_click(2321:5163,:);
A = max(snd);

% snd = ones(1,44100*.1);
% A = 1;

end

