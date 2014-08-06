function [ snd, A ] = generateTone( )
%generateTone: Generates the reference click and returns the maximum
%amplitude of said click.
 [r_click, Fs] = audioread('ref_click.mp3');
 r_click = r_click(:,1);
 
 %There is an anomoly towards the end of the signal and a lot of null data 
 %towards the beggining so I cut it between those samples to get rid of it.
 snd = r_click(2321:5163,:);
 snd = snd';
 
 A = max(snd);

end

