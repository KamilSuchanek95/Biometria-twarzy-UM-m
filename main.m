clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% Get a picture from webcam
% my_image = Get_snapshot();
%% create face detector
face_detector = vision.CascadeObjectDetector('ClassificationModel','FrontalFaceLBP');
%% ROI for recognition
% ROI = detect_face(my_image, face_detector);
%% create training data
TR = create_training_data_set('training_images', face_detector);
%% train model
Mdl = fitcecoc(cell2mat(TR.X), TR.Y);
%% test model
path_test = 'test_images/';
[score, stats] = test_images(Mdl, face_detector, path_test);

%% 




