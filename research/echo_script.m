%Script for waiting for user input then generating the echo
Fs = 44100;

%Input depth map example
d_map = zeros(50,50);
%21x21
[width, length1] = size(d_map);

d_map(:,1:floor(width/2)) = 5;
d_map(:,floor(width/2):end) = 2;

%This will be the size of the image we actually care about (can hear
%from).Can also be though of as the degree that our beam has from the
%center of the face. 
window_size = 6;

midx = floor(width/2);
midy = floor(length1/2);

%Generating the circular mask.
cx = midx;cy = midy; ix = width ; iy = length1 ;r = window_size;
[x,y] = meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
c_mask = double(((x.^2+y.^2)<=r^2));


display('Enter one movement with WASD then press ENTER.')
display('Press ENTER again to produce the echos.')

while(1)
   result = input('Use "W-A-S-D" keys to move the center of the head up, left, down, and right respectively.','s')
    
    %Move the window of view left, right, up, or down. 
    switch result
        case {'W' 'w'}
            %move up
            c_mask = shiftmatrix(c_mask,1,[0,-1],0);
            imagesc(c_mask);
            continue;
        case {'S' 's'}
            %move down
            c_mask = shiftmatrix(c_mask,1,[0,1],0);
            imagesc(c_mask);
            continue;
        case {'A' 'a'}
            %move left
            c_mask = shiftmatrix(c_mask,1,[-1,0],0);
            imagesc(c_mask);
            continue;
        case {'D' 'd'}
            %move right 
            c_mask = shiftmatrix(c_mask,1,[1,0],0);
            imagesc(c_mask);
            continue;
    end 
    
    
    %Element wise multiplication to 0 out the masked elements in the depth
    %map
    masked_scene = c_mask .* d_map;
    imagesc(masked_scene);
    
    
    
    display('got here')
    pause;
    %For me the disparity between the 2 can only be heard when the difference
    %in distances is greater than 2 meters. 

    echos = echoGen(d1, d2);
    audiowrite('test.wav',echos',Fs);

    test = wavread('test.wav');
    player = audioplayer(test,Fs);
    k = waitforbuttonpress;
    if(k)
        play(player);
        %I have to pause for the player to continue playing before the next
        %computation
        pause(.5);
    else
        display('.');
    end
end