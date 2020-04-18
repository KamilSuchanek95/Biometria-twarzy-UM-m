clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% Get a picture from webcam
my_image = Get_snapshot();
% create face detector
face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
% ROI for recognition
ROI = detect_face(my_image, face_detector);


if ~isnan(ROI)
    command1 = input('train / recognize', 's');
    if command1 == "train"
        %%
        tr = create_training_data_set;
        %%
        Mdl = fitcecoc(cell2mat([tr.kamil.X;tr.michal.X]), [tr.kamil.Y;tr.michal.Y]);
    
    elseif command1 == "recognize"
        ...
            ...
            ...
    end

end



