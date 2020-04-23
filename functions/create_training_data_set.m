function [TR] = create_training_data_set(path_images, face_detector)
%create_training_data_set(path_images)
%   path_images: path with folders s0, s2... with training images
%   return struct of data for training SVM. (TR) TR.X TR.Y
TR.X = {}; TR.Y = {};
d = dir(path_images); d = d(3:end);
for name = 1:numel(d)
    dd = dir(path_images + "/" + d.name{name}); dd = dd(3:end);
    for i = 1:numel(dd)
        img = imread(path_images + "/" + d.name{name} + "/" + dd(i).name);
        ROI = detect_face(img, face_detector);
        if ~isnan(ROI)
            TR.X = [TR.X ; extractHOGFeatures(ROI)];
            TR.Y = [TR.Y ; string(d.name{name})];
        else
            continue
        end
    end
end