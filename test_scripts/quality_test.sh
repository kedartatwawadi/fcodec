#!/bin/bash


for vid in *.mp4
do
    for var in 8 16 20 24 30
    do
        echo "$vid: Using CRF Value: " $var
        ffmpeg -v quiet -stats -i $vid -c:v libx265 -x265-params crf=$var "../quality_test_videos/crf"$var"_"$vid
    done
done
