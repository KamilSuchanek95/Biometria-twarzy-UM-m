clear; close all; clc;
%% Add functions to path.
addpath('functions');
%% Get a picture from webcam
% my_image = Get_snapshot();
%% create face detector
face_detector = vision.CascadeObjectDetector('ClassificationModel','FrontalFaceLBP');
%% ROI for recognition
%ROI = detect_face(my_image, face_detector);
%% create training data
%subjects = {'kolegaAsi','michal','edyta','basia','bartek', 'kamil'};
% tr = create_training_data_with_frames_from_imageLabeler(subjects);
%tr = load('training_data\training_data_19-Apr-2020_kam-mic-ed-kol-bas-bar.mat')
TR = create_training_data_set('training_images', face_detector);
%% 
% clc;
% train_data = {}; train_label = {};
% for name = subjects
%     train_data  = [train_data; tr.(string(name)).X];
%     train_label = [train_label; tr.(string(name)).Y];
% end
%% train model
Mdl = fitcecoc(cell2mat(TR.X), TR.Y);
%% test model
clc;
% path = 'C:\Users\kamis\Desktop\biometria_twarzy\test_images\';
path_test = 'test_images/'
test_images(Mdl, face_detector, path_test)
%% new output: szkolenie tylko dla s0-17
% test test1_bartek.jpg, detected as => s10
% =====
% test test1_basia.jpg, detected as => s0
% =====
% test test1_edyta.JPG, detected as => s9
% =====
% test test1_kamil.jpg, detected as => s0
% =====
% test test1_kolegaAsi.jpg, detected as => s0
% =====
% test test1_michal.jpg, detected as => s10
% =====
% test test1_nieznany1.jpg, detected as => s0
% =====
% test test1_nieznany2.jpg, detected as => s0
% =====
% test test1_nieznany3.jpeg, detected as => s0
% =====
% test test1_s0.jpg, detected as => s0
% =====
% test test1_s1.jpg, detected as => s1
% =====
% test test1_s10.jpg, detected as => s10
% =====
% test test1_s17.jpg, detected as => s17
% =====
% test test1_s2.jpg, detected as => s2
% =====
% test test1_s4.jpg, detected as => s4
% =====
% test test1_s5.jpg, detected as => s0
% =====
% test test1_s9.jpg, detected as => s9
% =====
% test test2_s0.jpg, detected as => s0
% =====
% test test2_s1.jpg, detected as => s1
% =====
% test test2_s10.jpg, detected as => s10
% =====
% test test2_s17.jpg, detected as => s17
% =====
% test test2_s2.jpg, detected as => s2
% =====
% test test2_s4.jpg, detected as => s4
% =====
% test test2_s8.jpg, detected as => s8
% =====
% test test2_s9.jpg, detected as => s9
% =====



%% example output: 
% tutaj chyba popelnilem blad poprzez nieprawidlowe uzycie petli for, tzn jak w pythonie, for t=vect.
% przez co wyniki sa okropne
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