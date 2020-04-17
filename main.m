clear; close all; clc;
%% Get a picture from webcam

CAM = webcam(1);    % object of camera (first from $webcamlist)
%fig = figure();
preview(CAM);       % preview of camera
img = snapshot(CAM);
closePreview(CAM);
clear CAM;
%%
%imshow(img);

%%

face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
upper_detector = vision.CascadeObjectDetector('ClassificationModel','UpperBody');
%%
xml_face_detector = vision.CascadeObjectDetector('haarcascade_frontalface_default.xml');
%%
bbox = upper_detector(img);
%%
IFace = insertObjectAnnotation(img,'rectangle',bbox,'Wykryty Ryj');   
figure
imshow(IFace)
title('Detected face');
%% test face detection
path = 'C:\Users\kamis\Desktop\biometria_twarzy\training_images\s3';
images = dir(path);
images = images(3:end);
list_images = {};
for i = 1:31 list_images{end+1} = images(i).name; end
for image = list_images
    img = imread(string(path) + '\' + string(image));
    bbox = xml_face_detector(img);
    IFace = insertObjectAnnotation(img,'rectangle',bbox,'Wykryty Ryj');   
    figure
    imshow(IFace)
    title('Detected face');
    pause(1/2);
    close
end

