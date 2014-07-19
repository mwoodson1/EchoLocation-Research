function [ snd, A ] = generateTone( )
%generateTone: 
 [r_click, Fs] = audioread('ref_click.mp3');
 r_click = r_click(:,1);
 
 %There is an anomoly towards the end of the signal so I cut it between
 %those samples to get rid of it.
 snd = r_click(2321:5163,:);
 
 A = max(snd);

% snd = [ones(1,44100*.001) zeros(1,44100*.015)];
% snd = snd';
% A = 1;

end

