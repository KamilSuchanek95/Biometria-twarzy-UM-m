function [ROI, err] = detect_face(img, face_detector)
%detect_face(face_detector, img) detect it and ignore more than one.
%   -face_detector: detector object
%   -img: snapshot with face
try
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
    elseif size(bbox,1)<1
        bbox_single = NaN;
    end
    err = 0;
catch err
    % disp(err);
    bbox_single = NaN;
end

if ~isnan(bbox_single)
    ROI = Cut_the_ROI(img, bbox_single);
    ROI = imresize(ROI,[256 256]);
else
    disp('no faces detected');
    ROI = NaN;
end
end

