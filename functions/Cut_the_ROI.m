function [ROI] = Cut_the_ROI(img, bbox)
%Cut_the_ROI return ROI from image (face)
%   ---
ROI = img(bbox(2):bbox(2)+bbox(3),bbox(1):bbox(1)+bbox(4));
end

