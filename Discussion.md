# Colored Video Compression
The current set of experiments were on video compression of the colored videos. The colored videos were obtained by demosaicing of the raw videos provided earlier. 
20 videos were demosaiced and then used for experimentation. We performed similar set of experiments, including trying out various quality values, different denoising filters etc.

## Demosaicing
There were some issues as discussed earlier. I am employing a hacky way right now to obtain the colored videos from the raw videos, as ffmpeg does not support an inbuilt demosaic filter. Currently using a matlab script to run image-by-image to convert the raw frames into colored ones. Also, need to adjust the gain factors by trial-and-error to get the color more realistic. This should afect the color to some extent, but the compression results, I think should not matter much. 

Some examples of the demosaiced frames are below. Clearly, there seems to be lot of saturation in the frames (which might be a result of low-quality demosaicing). Which can be improved. On another note, better cameras, more fine-tuned for autonomous driving with non-Bayer arrangement can be possibly used.

1. Raw Frame

![raw frame](images/image34.png)

2. Demosaiced frames

![frame1](images/demosaic_image42.png)
![frame2](images/demosaic_image335.png)
![frame3](images/demosaic_image462.png)

The results are summarised below:
## Experiments
### CRF experiment
We tried out different CRF values [0 8 16 20 24 30] for the 20 videos. Here, 0 corresponds to lossless, while 24 corresponds to slightly worse than human indistinguishable (for typical videos).

![CRF chart](https://docs.google.com/spreadsheets/d/1ApCN0lHEm9iqc4ftGyucQbUI8iKzediZ777BcaHSqHU/pubchart?oid=1801174671&format=image)

**Detailed numbers (all in MB)**

| CRF0 | CRF8 | CRF16 | CRF20 | CRF24 | CRF30 | Filename |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|716|35|7.2|3.4|1.8|0.8|20140320_184w250_krk_krk_shift1_002.tavi|
|724|37|8.6|4.2|2.2|0.95|20140320_184w250_krk_krk_shift1_003.tavi|
|741|37|8.6|4.2|2.3|0.95|20140320_184w250_krk_krk_shift1_004.tavi|
|743|43|12|6.1|3.2|1.3|20140320_184w250_krk_krk_shift1_005.tavi|
|734|42|12|5.9|3.1|1.3|20140320_184w250_krk_krk_shift1_006.tavi|
|731|48|15|7.7|4.1|1.7|20140320_184w250_krk_krk_shift1_007.tavi|
|733|49|15|8|4.2|1.8|20140320_184w250_krk_krk_shift1_008.tavi|
|704|49|15|7.9|4.2|1.7|20140320_184w250_krk_krk_shift1_009.tavi|
|724|49|15|7.9|4.2|1.7|20140320_184w250_krk_krk_shift1_010.tavi|
|702|49|15|7.9|4.2|1.7|20140320_184w250_krk_krk_shift1_011.tavi|
|715|48|15|7.9|4.2|1.7|20140320_184w250_krk_krk_shift1_012.tavi|
|732|50|16|8.7|4.7|1.9|20140320_184w250_krk_krk_shift1_013.tavi|
|710|50|16|8.7|4.7|1.9|20140320_184w250_krk_krk_shift1_014.tavi|	

#### Denoise Experiment
We tested with a few filters (most of them state-of-the-art). Which include hqdn3d, and its various variants based on spatial and temporal settings.
Also planning to test out the new NLMeans denoiser. However, which exact denoiser to use can be decided after consultation with the computer vision team. 

1. Hqdn3d with conservative settings 

![denoise](https://docs.google.com/spreadsheets/d/1ApCN0lHEm9iqc4ftGyucQbUI8iKzediZ777BcaHSqHU/pubchart?oid=289480964&format=image)

As we observe, the difference becomes less pronounced as the CRF level increases. This is expected, considering lossy versions would try to remove unwanted noise first. But, CRF levels should not be direclty compared here, as they are relative to lossless version which would for sure be much better for the denoised video.

#### Optical Flow experiments
We conducted similar experiments as with the raw videos for impact on low-level algorithms. We expect the demosaiced videos to have much less impact.

#### Higher-Level algorithm impact
We plan to conduct more experiments on this. But, overall higher level algorithms seem to be less impacted by compression artefacts. 


### Experiment with the cityscape dataset demoVideo

Link: [cityscape datasets](https://www.cityscapes-dataset.com/downloads/)

The sample results for the stuttgart_00 video samples are as follows:

- Original size with frames stored as individual png: 1.3GB
- 284M	crf4_x264_hqdn3d_stuttgart_00.mp4
- 455M	crf4_x264_stuttgart_00.mp4
- 277M	crf4_x265_stuttgart_00.mp4
- 148M	crf8_x265_stuttgart_00.mp4
