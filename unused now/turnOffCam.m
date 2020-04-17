function [] = turnOffCam(CAM)
%turnOnCam turn on camera and return camera handle
%   -
try
    closePreview(CAM);  % close preview of camera
    CAM = 0;            % clear CAM reference (this turn off led of webcam)       
    err = 0;
catch err
    disp(err);
end
