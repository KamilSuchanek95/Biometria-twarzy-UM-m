%% script for creating training data .mat 
clc; clear; close all;
%% add functions to path
addpath('functions');

%% mean of size
% kamil = load('Labeler - faces\kamil.mat');
% sum3 = 0; sum4 = 0; len = height(kamil.gTruth.LabelData);
% for i = 1:len
%     bbox = table2array(kamil.gTruth.LabelData(i,kamil.gTruth.LabelDefinitions.Name{1}));
%     sum3 = sum3 + bbox{1}(3);
%     sum4 = sum4 + bbox{1}(4);
% end
% mean3=sum3/len;
% mean4=sum4/len;
%% mean of size
% michal = load('Labeler - faces\michal.mat');
% sum3 = 0; sum4 = 0; len = height(michal.gTruth.LabelData);
% for i = 1:len
%     bbox = table2array(michal.gTruth.LabelData(i,michal.gTruth.LabelDefinitions.Name{1}));
%     sum3 = sum3 + bbox{1}(3);
%     sum4 = sum4 + bbox{1}(4);
% end
% mean3=sum3/len;
% mean4=sum4/len;
% => 256x256

%% KAMIL DATASET
kamil = load('Labeler - faces\kamil.mat');
training_data.kamil = {};
src = kamil.gTruth.DataSource.Source;
for i = 1:length(src) % for all images
    image = imread(src{i});% read image
    % get a bbox [x y h w]
    bbox = table2array(kamil.gTruth.LabelData(i,kamil.gTruth.LabelDefinitions.Name{1}));
    ROI = Cut_the_ROI(image, bbox{1});
    training_data.kamil{end+1, 1} = extractHOGFeatures(ROI);
end

%% MICHAL DATASET
michal = load('Labeler - faces\michal.mat');
training_data.michal = {};
src = michal.gTruth.DataSource.Source;
for i = 1:length(src)
    image = imread(src{i});
    bbox = table2array(michal.gTruth.LabelData(i,michal.gTruth.LabelDefinitions.Name{1}));
    
    ROI = Cut_the_ROI(image, bbox{1});
    training_data.michal{end+1, 1} = extractHOGFeatures(ROI);
end

%% save to file
inp = input('enter any annotations:\n (or press ENTER)  ', 's');
save('training_data\training_data_' + string(date) + '_' + inp +'.mat', 'training_data');

%% clear
clear ROI training_data bbox inp c image kamil michal i src