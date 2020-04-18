clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% Get a picture from webcam
my_image = Get_snapshot();
% create face detector
face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
%% ROI for recognition
ROI = detect_face(my_image, face_detector);
%%
Mdl = fitcecoc(cell2mat([tr.kamil.X;tr.michal.X]), [tr.kamil.Y;tr.michal.Y]);


%%
load('C:\Users\kamis\Desktop\test_image_michal.mat');
load('C:\Users\kamis\Desktop\test_image_kamil.mat');
disp('test Kamil:        ')
ROI = detect_face(my_image, face_detector);
label = predict(Mdl,extractHOGFeatures(ROI));
disp(string(label{1}) + '')
disp('=====')
disp('test Michal:        ')
ROI = detect_face(test_michal, face_detector);
label = predict(Mdl,extractHOGFeatures(ROI));
disp(string(label{1}) + '')


%%

tr = create_training_data_set;
%%
Mdl = fitcecoc(cell2mat(...
    [tr.kamil.X;tr.michal.X;tr.edyta.X]),...
    [tr.kamil.Y;tr.michal.Y;tr.edyta.Y]);

