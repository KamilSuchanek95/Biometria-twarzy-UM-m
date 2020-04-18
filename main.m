clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% Get a picture from webcam
% my_image = Get_snapshot();
%% create face detector
face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
%% ROI for recognition
%ROI = detect_face(my_image, face_detector);
%% create model
tr = create_training_data_set;
%%
Mdl = fitcecoc(cell2mat(...
[tr.kamil.X;tr.michal.X;tr.edyta.X;tr.kolegaAsi.X]),...
[tr.kamil.Y;tr.michal.Y;tr.edyta.Y;tr.kolegaAsi.Y]);

%% testing

subjects = {'kamil','michal','edyta','kolegaAsi'}
for name = subjects
    load('C:\Users\kamis\Desktop\test_images\test_image_' + string(name{1}) + '.mat');
    disp('test ' + string(name{1}) + ':        ')
    ROI = detect_face(img, face_detector);
    label = predict(Mdl,extractHOGFeatures(ROI));
    disp(string(label{1}) + '')
    disp('=====')
end
%%
load('C:\Users\kamis\Desktop\test_images\test_image_edyta.mat');
disp('test edyta:        ')
ROI = detect_face(img, face_detector);
label = predict(Mdl,extractHOGFeatures(ROI));
disp(string(label{1}) + '')

