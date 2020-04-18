clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% Get a picture from webcam

my_image = Get_snapshot();

%% example detectors
face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
upper_detector = vision.CascadeObjectDetector('ClassificationModel','UpperBody');
xml_face_detector = vision.CascadeObjectDetector('haarcascade_frontalface_default.xml');

%%
bbox = detect_face(face_detector, my_image);

% bede to wyswietlal aby bylo wiadomo czy twarz podlega rozpoznawaniu czy tez nie.
IFace = insertObjectAnnotation(my_image,'rectangle',bbox,'twarz');   
figure
imshow(IFace)
title('Detected face');

%% przeniesione do create_training_data_set.m
% ROI = Cut_the_ROI(my_image, bbox);
% [features, visualization] = extractHOGFeatures(ROI);

%%
tr = create_training_data_set;
%%
Md1 = fitcecoc(cell2mat([tr.kamil.X;tr.michal.X]), [tr.kamil.Y;tr.michal.Y]);






