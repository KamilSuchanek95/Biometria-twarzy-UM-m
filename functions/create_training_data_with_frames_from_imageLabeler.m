function [training_data] = create_training_data_set(subjects)
%create_training_data_set
%   This work only with imageLabeler objects. (only my computer!)
%   example: subjects = {'kolegaAsi','michal','edyta'};
%   return struct of data for training SVM.
for name = subjects
    o= load('Labeler - faces\' + string(name{1}) + '.mat');
    training_data.(string(name{1})).X = {};
    src = o.gTruth.DataSource;%.Source;
    for i = 1:length(src)
        image = imread(src{i});
        bbox = table2array(o.gTruth.LabelData(i,o.gTruth.LabelDefinitions.Name{1}));
        ROI = Cut_the_ROI(image, bbox{1});
        ROI = imresize(ROI,[256 256]);
        training_data.(string(name{1})).X{end+1, 1} = extractHOGFeatures(ROI);
    end
    training_data.(string(name{1})).Y = {};
    for i=1:length(training_data.(string(name{1})).X) training_data.(string(name{1})).Y{i,1} = name{1}; end
end

%% save to file
inp = input('enter any annotations:\n (or press ENTER)  ', 's');
save('training_data\training_data_' + string(date) + '_' + inp +'.mat', 'training_data');

%% unused code
%% clear
% clear ROI training_data bbox inp c image kamil michal i src
%% script for creating training data .mat 
% clc; clear; close all;
%% add functions to path
% addpath('functions');

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
% kamil = load('Labeler - faces\kamil.mat');
% training_data.kamil.X = {};
% src = kamil.gTruth.DataSource.Source;
% for i = 1:length(src) % for all images
%     image = imread(src{i});% read image
%     % get a bbox [x y h w]
%     bbox = table2array(kamil.gTruth.LabelData(i,kamil.gTruth.LabelDefinitions.Name{1}));
%     ROI = Cut_the_ROI(image, bbox{1}); % cut the ROI
%     ROI = imresize(ROI,[256 256]); % resize (SVM must have feature vectors of the same length)
%     training_data.kamil.X{end+1, 1} = extractHOGFeatures(ROI);
% end
% training_data.kamil.Y = {};
% for i=1:length(training_data.kamil.X) training_data.kamil.Y{i,1} ='Kamil'; end
% 
% %% MICHAL DATASET
% michal = load('Labeler - faces\michal.mat');
% training_data.michal.X = {};
% src = michal.gTruth.DataSource.Source;
% for i = 1:length(src)
%     image = imread(src{i});
%     bbox = table2array(michal.gTruth.LabelData(i,michal.gTruth.LabelDefinitions.Name{1}));
%     
%     ROI = Cut_the_ROI(image, bbox{1});
%     ROI = imresize(ROI,[256 256]);
%     training_data.michal.X{end+1, 1} = extractHOGFeatures(ROI);
% end
% training_data.michal.Y = {};
% for i=1:length(training_data.michal.X) training_data.michal.Y{i,1} ='Michal'; end
% 
% %% EDYTA DATASET
% edyta = load('Labeler - faces\edyta.mat');
% training_data.edyta.X = {};
% src = edyta.gTruth.DataSource.Source;
% for i = 1:length(src)
%     image = imread(src{i});
%     bbox = table2array(edyta.gTruth.LabelData(i,edyta.gTruth.LabelDefinitions.Name{1}));
%     
%     ROI = Cut_the_ROI(image, bbox{1});
%     ROI = imresize(ROI,[256 256]);
%     training_data.edyta.X{end+1, 1} = extractHOGFeatures(ROI);
% end
% training_data.edyta.Y = {};
% for i=1:length(training_data.edyta.X) training_data.edyta.Y{i,1} ='Edyta'; end