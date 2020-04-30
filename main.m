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
v = max(cell2mat(score.score)')';
var(v(find(cell2mat(score.success) == 0)))
var(v(find(cell2mat(score.success) == 1)))
%% Create figure
figure1 = figure;
%%
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create multiple lines using matrix input to bar
bar1 = bar(categorical(stats.label),...
[cell2mat(stats.sen)*100]);

box(axes1,'on');
%%
bar(cell2mat(stats.TP) + cell2mat(stats.FN));
%%
ylabel('sensitivity [%] / number of training images [n]')
%%
legend('sensivityty','number of images')
%%
title('Statement of sensitivity to the number of learning images')
%%
grid on
grid minor