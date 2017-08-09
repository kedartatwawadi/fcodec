%% Read the video input
% filename = 'vid2_lossless.mkv';
% vidObj = VideoReader(filename);
% while hasFrame(vidObj)
%     frame = readFrame(vidObj);
% end
% whos frame
dirObj = dir('raw_images');
num_images = size(dirObj,1);
for id=3:1:num_images
    filename = dirObj(id).name;
    filepath = strcat('raw_images/',filename);
    dest_name = strcat('demosic_images/demosaic_',filename);
    
    % Preprocessing the file, as the red component has really low color values
    red_calibration_val = 2.0
    I = imread(filepath);
    [w h] = size(I);
    for y = 2:2:w
        for x = 1:2:h
            I(y,x) = I(y,x)*red_calibration_val;
        end
    end
    J = demosaic(I,'gbrg');
    imwrite(J,dest_name);
end
exit
