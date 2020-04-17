clear; close all; clc;
%%
% [CAM , err] = turnOnCam();
%%
% while 1 % input('This image is OK?') ~= 'OK'
%    img = snapshot(CAM);
%    fig = figure('Name', 'Check the snapshot from webcam:');
%    imshow(img);
%    if input('Does this image look good?') == 'yes'
%        close fig
%        break
%    end 
% end

%%
%turnOffCam(CAM);
%%
image = Get_snapshot();

