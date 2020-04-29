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
score = test_images(Mdl, face_detector, path_test);

% test image folder:  s0
% incorrect classification as s3 on image: t0 (14).jpg score: -0.025135
% incorrect classification as s3 on image: t0 (16).jpg score: -0.028317
% incorrect classification as s4 on image: t0 (17).jpg score: -0.035323
% incorrect classification as s3 on image: t0 (20).jpg score: -0.036287
% incorrect classification as s1 on image: t0 (7).jpg score: -0.036239
% s0 TP = 30 FN = 5 sensitivity = 0.85714 miss rate = 0.14286
% test image folder:  s1
% incorrect classification as s6 on image: t1 (20).jpg score: -0.019707
% s1 TP = 28 FN = 1 sensitivity = 0.96552 miss rate = 0.034483
% test image folder:  s10
% s10 TP = 49 FN = 0 sensitivity = 1 miss rate = 0
% test image folder:  s11
% s11 TP = 16 FN = 0 sensitivity = 1 miss rate = 0
% test image folder:  s12
% s12 TP = 40 FN = 0 sensitivity = 1 miss rate = 0
% test image folder:  s13
% incorrect classification as s3 on image: t13 (11).jpg score: -0.023824
% incorrect classification as s3 on image: t13 (12).jpg score: -0.024599
% incorrect classification as s14 on image: t13 (3).JPG score: -0.029662
% incorrect classification as s14 on image: t13 (9).jpg score: -0.026375
% s13 TP = 11 FN = 4 sensitivity = 0.73333 miss rate = 0.26667
% test image folder:  s14
% incorrect classification as s3 on image: t14 (1).jpg score: -0.034188
% incorrect classification as s3 on image: t14 (10).jpg score: -0.024008
% incorrect classification as s3 on image: t14 (14).jpg score: -0.029426
% s14 TP = 15 FN = 3 sensitivity = 0.83333 miss rate = 0.16667
% test image folder:  s17
% s17 TP = 23 FN = 0 sensitivity = 1 miss rate = 0
% test image folder:  s2
% incorrect classification as s14 on image: t2 (24).jpg score: -0.036681
% s2 TP = 24 FN = 1 sensitivity = 0.96 miss rate = 0.04
% test image folder:  s3
% incorrect classification as s6 on image: t3 (1).jpg score: -0.010518
% incorrect classification as s14 on image: t3 (14).jpg score: -0.019697
% incorrect classification as s14 on image: t3 (15).jpg score: -0.013991
% incorrect classification as s6 on image: t3 (16).jpg score: -0.014534
% incorrect classification as s6 on image: t3 (18).jpg score: -0.014866
% incorrect classification as s6 on image: t3 (25).jpg score: -0.014313
% incorrect classification as s6 on image: t3 (6).jpg score: -0.018008
% s3 TP = 21 FN = 7 sensitivity = 0.75 miss rate = 0.25
% test image folder:  s4
% s4 TP = 49 FN = 0 sensitivity = 1 miss rate = 0
% test image folder:  s5
% incorrect classification as s14 on image: t5 (1).jpg score: -0.038299
% incorrect classification as s3 on image: t5 (2).jpg score: -0.015983
% incorrect classification as s6 on image: t5 (4).jpg score: -0.038695
% s5 TP = 16 FN = 3 sensitivity = 0.84211 miss rate = 0.15789
% test image folder:  s6
% s6 TP = 26 FN = 0 sensitivity = 1 miss rate = 0
% test image folder:  s7
% incorrect classification as s14 on image: t7 (2).jpg score: -0.031688
% incorrect classification as s6 on image: t7 (4).jpg score: -0.028132
% incorrect classification as s6 on image: t7 (6).jpg score: -0.021971
% incorrect classification as s6 on image: t7 (7).jpg score: -0.025232
% incorrect classification as s6 on image: t7 (9).jpg score: -0.032877
% s7 TP = 6 FN = 5 sensitivity = 0.54545 miss rate = 0.45455
% test image folder:  s8
% s8 TP = 29 FN = 0 sensitivity = 1 miss rate = 0
% test image folder:  s9
% incorrect classification as s6 on image: t9 (13).jpg score: -0.021887
% incorrect classification as s3 on image: t9 (20).jpg score: -0.042516
% s9 TP = 32 FN = 2 sensitivity = 0.94118 miss rate = 0.058824