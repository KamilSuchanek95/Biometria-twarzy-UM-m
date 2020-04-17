function [CAM, err] = turnOnCam()
%turnOnCam turn on camera and return camera handle
%   -
try
    CAM = webcam(1);    % object of camera (first from $webcamlist)
    preview(CAM);       % preview of camera
    err = 0;
catch err
    CAM = 0; disp(err);
end

