function [scores, stats, labels] = test_images(Mdl, face_detector, path_of_test_images)
%test_images test model
%input:
%   Mdl: trained model
%   face_detector: trained object model of vision.CascaseClassifierObject
%   path_of_test_images: path with test images
%return:
%   scores: struct of scores and success
%         .success = {0 1 0} % 0 - failure, 1 - correct recognition
%         .score = {score score score} % score from predict matlab function
%   stats: struct of statistics
%        .TP = {TP for s0, ... for s1, ...}
%        .FN = {numel(images) - TP - cort for s0, ... for s1, ...}
%        .label = {"s0", "s1", ...}
%        .sen = {sensitivity % for s0, ...}
%        .miss = {miss rate % for s0, ...}
    labels = {};
    % init output
    stats.TP = {}; stats.FN = {}; stats.sen = {}; stats.miss = {}; stats.label = {};
    scores.success = {}; scores.score = {};
    % protection against entering paths to images without slash
    if(path_of_test_images(end) ~= "/") path_of_test_images(end+1) = "/"; end % add "/"
    % read the folders of subjects to recognize
    test_folders = dir(path_of_test_images); 
    test_folders = test_folders(3:end); % without ".", ".." system file
    
    for n_of_folder = 1:numel(test_folders) % loop for folders s1 s2...
        test_images = dir(path_of_test_images + string(test_folders(n_of_folder).name)); % read each image from the folder
        test_images = test_images(3:end); % without ".", ".." system file
        cort = 0; % correction for no face detected, this reduces the pool of images in the statistics if no face is detected
        TP = 0; % true positive value, add 1 for each correct recognition
        disp('=============================================================');
        disp("test image folder:  " + string(test_folders(n_of_folder).name));
        for n_of_image = 1:numel(test_images) % loop for test images...
            img_name = string(test_images(n_of_image).name); % image name, string(cell{1})
            img = imread(path_of_test_images + string(test_folders(n_of_folder).name) + "/" + img_name); % read image
            ROI = detect_face(img, face_detector, 0); % detect face and return ROI or NaN
            if isnan(ROI) % if no face detected...
                fprintf('image: %s, failure! (no face) <=====\n', test_folders(n_of_folder).name + "/" + img_name); % print where
                cort = cort + 1; % correction of the number of tested images
                continue % skip to the next iteration of the loop of images
            end
            if ~ismatrix(ROI) ROI = rgb2gray(ROI); end % if image is RGB, change it to grayscale
            
            % predicted label and scores (max(score) points to predicted label)
            [label, score] = predict(Mdl, extractHOGFeatures(ROI)); 
            labels{end + 1, 1} = char(label);
            % if predicted label is correct then...
            if numel(strfind(string(test_folders(n_of_folder).name) + " ",string(label) + " ")) > 0
                TP = TP + 1;  % increase true positive value
                scores.success{end + 1, 1} = 1;
                scores.score{end + 1, 1} = score;
            else % if it incorrect label...
                scores.success{end + 1, 1} = 0;
                scores.score{end + 1, 1} = score;
                % disp where is this image and, as who was recognized, with what probability
                disp('incorrect classification as ' + string(label) + ' on image: ' + string(img_name) + " score: " + string(max(score)))
            end
        end
        % calculate the statistics
        stats.sen{end + 1, 1} = TP/(numel(test_images)-cort);
        stats.miss{end + 1, 1} = (numel(test_images)-TP-cort)/(numel(test_images)-cort);
        stats.FN{end + 1, 1} = numel(test_images)-TP-cort;
        stats.TP{end + 1, 1} = TP; 
        stats.label{end + 1, 1} = test_folders(n_of_folder).name;
        % disp TP FN sensitivity and miss rate values.
        disp(string(stats.label{end, 1}) + " TP = " + TP + " FN = " + string(stats.FN{end, 1}) +...
            " sensitivity = " + string(stats.sen{end, 1}) + " miss rate = " + string(stats.miss{end, 1}))
    end
end