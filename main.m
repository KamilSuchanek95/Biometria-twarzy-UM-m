clear; close all; clc;
%% Get a picture from webcam

my_image = Get_snapshot();

%% example detectors
face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
upper_detector = vision.CascadeObjectDetector('ClassificationModel','UpperBody');
xml_face_detector = vision.CascadeObjectDetector('haarcascade_frontalface_default.xml');

%%
bbox = detect_face(face_detector, my_image);

% bede to wyswietlal aby bylo wiadomo czy twarz podlega rozpoznawaniu czy
% tez nie.
IFace = insertObjectAnnotation(my_image,'rectangle',bbox,'twarz');   
figure
imshow(IFace)
title('Detected face');

%% 

