%Simulates an object moving from the left to the right of the head. 

%Initializing an empty vector
total_echos = [];

%Going from -90 degrees to 90 degrees in increments of 15. The angle in
%question is the angle between the normal of the camera and the object in
%question.
%                 \  | <-----normal to camera
%                  \ |
%   head/camera ---> 0
for(theta = -90:15:90)
    [r,l] = angleToBinaural(theta, 10, .15);
    echos = echoGen(r,l,0,1);
    %Concatenating the sound vectors to give one sound file of an echo
    %going from the left ear to right ear, simulating an object moving from
    %the left to the right. 
    total_echos = [total_echos zeros(2,.5*44100) echos];
end