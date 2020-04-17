function [img] = Get_snapshot()
%Get_snapshot
%   -

try
    CAM = webcam(1);    % object of camera (first from $webcamlist)
    preview(CAM);       % preview of camera
    err = 0;
catch err
    CAM = 0; disp(err);
end

while 1 % input('This image is OK?') ~= 'OK'
   img = snapshot(CAM);
   fig = figure('Name', 'Check the snapshot from webcam:');
   imshow(img);
   answer = input('Does this image look good?\n  (yes/no)   ', 's');
   if answer == "yes"
       close(fig)
       break
   end 
   close(fig)
end

try
    closePreview(CAM);  % close preview of camera
    CAM = 0;            % clear CAM reference (this turn off led of webcam)       
    err = 0;
catch err
    disp(err);
end

