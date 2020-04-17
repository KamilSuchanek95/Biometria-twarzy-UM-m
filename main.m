clear; close all; clc;
%% Get a picture from webcam

my_image = Get_snapshot();

% example detectors
face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
upper_detector = vision.CascadeObjectDetector('ClassificationModel','UpperBody');
xml_face_detector = vision.CascadeObjectDetector('haarcascade_frontalface_default.xml');

%%

bbox = face_detector(my_image);
% zwraca [x y wysokosc szerokosc] gdzie wys=szer, a x,y to lewy gorny rog.
if size(bbox, 1) > 1
    max_size = max(bbox(:,4));
    for i = 1:size(bbox, 1)
        if bbox(i,4) == max_size
            bbox = bbox(i, :);
            break;
        end
    end
end

IFace = insertObjectAnnotation(my_image,'rectangle',bbox,'twarz');   
figure
imshow(IFace)
title('Detected face');

%% 
