function [] = test_images(Mdl, face_detector, path_of_test_images)
%test_images test model
%   Mdl: trained model
%   face_detector: trained object model of vision.CascaseClassifierObject
%   subjects: cell list of subjects names np: {'kamil','edyta','michal'}
%   path_of_test_images: path with test images
    test_images = dir(path_of_test_images); 
    test_images = test_images(3:end);
    names = {};
    for i=1:numel(test_images) names{end+1,1} = test_images(i).name; end
    for i = 1:numel(test_images)
        n = test_images(i).name;
        img = imread(path_of_test_images + string(n));
        ROI = detect_face(img, face_detector);
        label = predict(Mdl, extractHOGFeatures(ROI));
        disp('test ' + string(n) + ', detected as => ' + string(label))
        disp('=====')
    end
end