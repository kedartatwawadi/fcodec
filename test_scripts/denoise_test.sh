#!/bin/bash


for vid in *.mp4
do
    for var in 8 16 20 24 30
    do
        echo "$vid: Using CRF Value: " $var
        ffmpeg -i $vid -c:v libx265 -vf "yadif,hqdn3d=1.5:1.5:6:6" -x265-params crf=$var "../denoise_test_videos/crf"$var"_"$vid
    done
done
