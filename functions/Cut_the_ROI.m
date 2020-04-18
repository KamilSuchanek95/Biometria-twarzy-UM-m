function [ROI] = Cut_the_ROI(img, bbox)
%Cut_the_ROI(img, bbox) return ROI from image (face)
%   -img: snapshot with face
%   -bbox: bbox returns from face_detector() object vision
ROI = img(bbox(2):bbox(2)+bbox(3),bbox(1):bbox(1)+bbox(4));
end

