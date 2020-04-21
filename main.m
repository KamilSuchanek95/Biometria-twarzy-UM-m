clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% Get a picture from webcam
% my_image = Get_snapshot();
%% create face detector
face_detector = vision.CascadeObjectDetector;%('ClassificationModel','FrontalFaceLBP');
%% ROI for recognition
%ROI = detect_face(my_image, face_detector);
%% create training data
subjects = {'kolegaAsi','michal','edyta','basia','bartek', 'kamil'};

% tr = create_training_data_with_frames_from_imageLabeler(subjects);
tr = load('training_data\training_data_19-Apr-2020_kam-mic-ed-kol-bas-bar.mat')
%% 
clc;
train_data = {}; train_label = {};
for name = subjects
    train_data  = [train_data; tr.(string(name)).X];
    train_label = [train_label; tr.(string(name)).Y];
end
%% train model
Mdl = fitcecoc(cell2mat(train_data), train_label);
%% test model
clc;
path = 'C:\Users\kamis\Desktop\biometria_twarzy\test_images\';
test_images(Mdl, face_detector, path)

%% example output:
% test test1_bartek.jpg, detected as => kamil
% =====
% test test1_basia.jpg, detected as => basia
% =====
% test test1_edyta.JPG, detected as => basia
% =====
% test test1_kamil.jpg, detected as => basia
% =====
% test test1_kolegaAsi.jpg, detected as => basia
% =====
% test test1_michal.jpg, detected as => michal
% =====
% test test1_nieznany1.jpg, detected as => basia
% =====
% test test1_nieznany2.jpg, detected as => basia
% =====
% test test1_nieznany3.jpeg, detected as => kamil
% =====