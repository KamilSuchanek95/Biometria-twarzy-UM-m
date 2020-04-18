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
IFace = insertObjectAnnotation(img,'rectangle',bbox,'twarz');   
figure
imshow(IFace)
title('Detected face');
%% test face detection
% path = 'C:\Users\kamis\Desktop\biometria_twarzy\training_images\s3';
% images = dir(path);
% images = images(3:end);
% list_images = {};
% for i = 1:31 list_images{end+1} = images(i).name; end
% for image = list_images
%     img = imread(string(path) + '\' + string(image));
%     bbox = xml_face_detector(img);
%     IFace = insertObjectAnnotation(img,'rectangle',bbox,'Wykryty Ryj');   
%     figure
%     imshow(IFace)
%     title('Detected face');
%     pause(1/2);
%     close
% end

clear; close all; clc;
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

%% 
ROI = Cut_the_ROI(my_image, bbox);

[features, visualization] = extractHOGFeatures(ROI);



%%
% kamil = load('C:\Users\kamis\Desktop\Biometria-twarzy-UM-m\Labeler - faces\kamil.mat');
% training_data.kamil = {};
% for i = 1:length(kamil.gTruth.DataSource.Source)
%     image = imread(kamil.gTruth.DataSource.Source{i});
%     c = table2array(kamil.gTruth.LabelData(1,'face'));
%     ROI = Cut_the_ROI(image, c{1});
%     training_data.kamil{1,end+1} = extractHOGFeatures(ROI);
% end
    
clear; close all; clc;
%%
% [CAM , err] = turnOnCam();
%%
% while 1 % input('This image is OK?') ~= 'OK'
%    img = snapshot(CAM);
%    fig = figure('Name', 'Check the snapshot from webcam:');
%    imshow(img);
%    if input('Does this image look good?') == 'yes'
%        close fig
%        break
%    end 
% end

%%
%turnOffCam(CAM);
%%
image = Get_snapshot();


