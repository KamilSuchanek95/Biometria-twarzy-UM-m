function [ROI] = Cut_the_ROI(bbox, img)
%Cut_the_ROI return ROI from image (face)
%   ---
ROI = img(bbox(2):bbox(2)+bbox(4),bbox(1):bbox(1)+bbox(3));
end

