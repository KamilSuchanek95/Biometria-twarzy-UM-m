clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% create face detector
face_detector = vision.CascadeObjectDetector('ClassificationModel','FrontalFaceLBP');
%% create training data
TR = create_training_data_set('training_images', face_detector);
%% train model
Mdl = fitcecoc(cell2mat(TR.X), TR.Y);
%% test model
path_test = 'test_images/';
[score, stats] = test_images(Mdl, face_detector, path_test);


%% Get a picture from webcam
% my_image = Get_snapshot();
%% recognize my_image
% ROI = detect_face(my_image, face_detector, 1);
%% druga czesc sekcji recognize my_image
% label = predict(Mdl, extractHOGFeatures(ROI));
