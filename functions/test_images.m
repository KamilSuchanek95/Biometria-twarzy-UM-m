function [scores] = test_images(Mdl, face_detector, path_of_test_images)
%test_images test model
%   Mdl: trained model
%   face_detector: trained object model of vision.CascaseClassifierObject
%   subjects: cell list of subjects names np: {'kamil','edyta','michal'}
%   path_of_test_images: path with test images
    scores = {};
    if(path_of_test_images(end) ~= "/") path_of_test_images(end+1) = "/"; end % add "/"
    
    test_folders = dir(path_of_test_images); 
    test_folders = test_folders(3:end);
    
    cort = 0; % correction for no face detected
    
    for n_of_folder = 1:numel(test_folders) % loop for folders s1 s2...
        test_images = dir(path_of_test_images + string(test_folders(n_of_folder).name)); 
        test_images = test_images(3:end);
        TP = 0;
        disp('=============================================================');
        disp("test image folder:  " + string(test_folders(n_of_folder).name));
        for n_of_image = 1:numel(test_images) % loop for test images...
            img_name = test_images(n_of_image).name;
            img = imread(path_of_test_images + string(test_folders(n_of_folder).name) + "/" + string(img_name));
            ROI = detect_face(img, face_detector, 0);
            if isnan(ROI) 
                fprintf('image: %s, failure! (no face) <=====\n', test_folders(n_of_folder).name + "/" + img_name);
                cort = cort + 1;
                continue
            end
            if ~ismatrix(ROI) ROI = rgb2gray(ROI); end
            [label, score] = predict(Mdl, extractHOGFeatures(ROI));
            
            scores{n_of_image,n_of_folder} = score;
            
            if numel(strfind(string(test_folders(n_of_folder).name) + " ",string(label) + " ")) > 0
                TP = TP + 1; 
            else
                disp('incorrect classification as ' + string(label) + ' on image: ' + string(img_name) + " score: " + string(max(score)))
            end
            % disp('test ' + string(img_name) + ', detected as => ' + string(label) + 'with score: ' + string(max(score)))
            % disp('=====')
        end
        disp(string(test_folders(n_of_folder).name) + " TP = " + TP + ...
            " FN = " + string(numel(test_images)-TP-cort) + " sensitivity = " + string(TP/(numel(test_images)-cort)) + ...
            " miss rate = " + string((numel(test_images)-TP-cort)/(numel(test_images)-cort)))
        cort = 0;
    end
end