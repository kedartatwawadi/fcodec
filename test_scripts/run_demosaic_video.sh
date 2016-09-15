#!/bin/sh
rm -r raw_images
rm -r demosic images
mkdir raw_images
mkdir demosic_images
  
for vid in *.tavi
do
  	echo $vid
    ffmpeg -i $vid raw_images/image%d.png
    matlab -nodisplay -r "run demosaic_video.m"
    ffmpeg -framerate 10 -i demosic_images/demosaic_image%d.png -c:v libx265  -crf 0 -pix_fmt yuv444p output_videos/$vid.mp4 
done

exit

