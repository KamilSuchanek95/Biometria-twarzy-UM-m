function [TR] = create_training_data_set(path_images, face_detector)
%create_training_data_set(path_images)
%   path_images: path with folders s0, s2... with training images
%   return struct of data for training SVM. (TR) TR.X TR.Y
%%
clc
TR.X = {}; TR.Y = {};
d = dir(path_images); d = d(3:end);
number = 0;
for s = 1:numel(d) % loop for s0, s1...
    dd = dir(path_images + "/" + d(s).name); dd = dd(3:end);
    for i = 1:numel(dd) % loop for images...
        img = imread(path_images + "/" + d(s).name + "/" + dd(i).name);
        ROI = detect_face(img, face_detector, 0); %, d(name).name + "/" + dd(i).name);
        if ~isnan(ROI) % fprintf('image: %s, SUCCESS!\n', d(s).name + "/" + dd(i).name);
        else fprintf('image: %s, failure! <=====\n', d(s).name + "/" + dd(i).name); end
        if ~isnan(ROI)
            number = number + 1;
            TR.X = [TR.X ; extractHOGFeatures(ROI)];
            TR.Y = [TR.Y ; string(d(s).name)];
        else % Roi = NaN-=w
            continue
        end
    end
    percent = 100 * (number/numel(dd));
    fprintf('the percentage of images used from %s is:%.2f%%  (or %i out of %i)\n', d(s).name, percent,number,numel(dd));
    number = 0;
end
%%
end

%% example output on Command Window:
% image: s0/BioID_0175.jpg, failure! <=====
% image: s0/BioID_0176.jpg, failure! <=====
% image: s0/BioID_0177.jpg, failure! <=====
% image: s0/BioID_0178.jpg, failure! <=====
% image: s0/BioID_0179.jpg, failure! <=====
% image: s0/BioID_0375.jpg, failure! <=====
% image: s0/BioID_0376.jpg, failure! <=====
% image: s0/BioID_0564.jpg, failure! <=====
% image: s0/BioID_1082.jpg, failure! <=====
% image: s0/BioID_1083.jpg, failure! <=====
% image: s0/BioID_1442.jpg, failure! <=====
% image: s0/BioID_1443.jpg, failure! <=====
% image: s0/BioID_1445.jpg, failure! <=====
% image: s0/BioID_1446.jpg, failure! <=====
% image: s0/BioID_1447.jpg, failure! <=====
% image: s0/BioID_1448.jpg, failure! <=====
% image: s0/BioID_1449.jpg, failure! <=====
% image: s0/BioID_1450.jpg, failure! <=====
% image: s0/BioID_1473.jpg, failure! <=====
% image: s0/BioID_1474.jpg, failure! <=====
% image: s0/BioID_1475.jpg, failure! <=====
% image: s0/BioID_1476.jpg, failure! <=====
% image: s0/BioID_1477.jpg, failure! <=====
% image: s0/BioID_1478.jpg, failure! <=====
% image: s0/BioID_1481.jpg, failure! <=====
% image: s0/BioID_1482.jpg, failure! <=====
% image: s0/BioID_1483.jpg, failure! <=====
% image: s0/BioID_1484.jpg, failure! <=====
% image: s0/BioID_1485.jpg, failure! <=====
% image: s0/BioID_1490.jpg, failure! <=====
% the percentage of images used from s0 is:74.58%  (or 88 out of 118)
% image: s1/BioID_0947.jpg, failure! <=====
% the percentage of images used from s1 is:98.21%  (or 55 out of 56)
% the percentage of images used from s10 is:100.00%  (or 116 out of 116)
% the percentage of images used from s17 is:100.00%  (or 44 out of 44)
% image: s2/BioID_0054.jpg, failure! <=====
% image: s2/BioID_0059.jpg, failure! <=====
% image: s2/BioID_0061.jpg, failure! <=====
% image: s2/BioID_0072.jpg, failure! <=====
% the percentage of images used from s2 is:92.73%  (or 51 out of 55)
% the percentage of images used from s4 is:100.00%  (or 96 out of 96)
% image: s5/BioID_0977.jpg, failure! <=====
% image: s5/BioID_0988.jpg, failure! <=====
% image: s5/BioID_1001.jpg, failure! <=====
% image: s5/BioID_1010.jpg, failure! <=====
% image: s5/BioID_1011.jpg, failure! <=====
% image: s5/BioID_1013.jpg, failure! <=====
% the percentage of images used from s5 is:89.66%  (or 52 out of 58)
% the percentage of images used from s8 is:100.00%  (or 59 out of 59)
% image: s9/BioID_1069.jpg, failure! <=====
% the percentage of images used from s9 is:98.55%  (or 68 out of 69)