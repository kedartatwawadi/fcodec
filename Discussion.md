## Colored Video Compression
The current set of experiments were on video compression of the colored videos. The colored videos were obtained by demosaicing of the raw videos provided earlier. 
20 videos were demosaiced and then used for experimentation. We performed similar set of experiments, including trying out various quality values, different denoising filters etc.

The results are summarised below:
### Experiments
#### CRF experiment
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

#### Optical Flow experiments
We conducted similar experiments as with the raw videos for impact on low-level algorithms. We expect the demosaiced videos to have much less impact.

#### Higher-Level algorithm impact
We plan to conduct more experiments on this. But, overall higher level algorithms seem to be less impacted by compression artefacts. 
