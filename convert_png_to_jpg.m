
files = dir('C:\Users\kamis\Desktop\bioidimages\');
files = files(3:end);

%%

for p = 1:numel(files)
    img=imread('C:\Users\kamis\Desktop\bioidimages\' + string(files(p).name));
    imwrite(img, 'C:\Users\kamis\Desktop\BioID_jpg\' +  string(files(p).name(1:end-4)) + '.jpg','jpg');
    
end