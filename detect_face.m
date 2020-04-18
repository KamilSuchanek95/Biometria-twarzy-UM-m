function [bbox_single] = detect_face(face_detector, img)
%detect_face detect it and ignore more than one.
%   ---
bbox = face_detector(img);
% zwraca [x y wysokosc szerokosc] gdzie wys=szer, a x,y to lewy gorny rog.
if size(bbox, 1) > 1
    max_size = max(bbox(:,4));
    for i = 1:size(bbox, 1)
        if bbox(i,4) == max_size
            bbox_single = bbox(i, :);
            break;
        end
    end
end
end

