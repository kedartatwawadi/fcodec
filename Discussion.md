## Colored Video Compression
The current set of experiments were on video compression of the colored videos. The colored videos were obtained by demosaicing of the raw videos provided earlier. 
20 videos were demosaiced and then used for experimentation. We performed similar set of experiments, including trying out various quality values, different denoising filters etc.

The results are summarised below:
### Experiments
#### CRF experiment
We tried out different CRF values [0 8 16 20 24 30] for the 20 videos. Here, 0 corresponds to lossless, while 24 corresponds to slightly worse than human indistinguishable (for typical videos).

![CRF chart](https://docs.google.com/spreadsheets/d/1ApCN0lHEm9iqc4ftGyucQbUI8iKzediZ777BcaHSqHU/pubchart?oid=1801174671&format=image)

Detailed numbers (all in MB)
![Numbers](https://docs.google.com/spreadsheets/d/1ApCN0lHEm9iqc4ftGyucQbUI8iKzediZ777BcaHSqHU/pubhtml?gid=1001837840&single=true)

#### Denoise Experiment
We tested with a few filters (most of them state-of-the-art). Which include hqdn3d, and its various variants based on spatial and temporal settings.
Also planning to test out the new NLMeans denoiser. However, which exact denoiser to use can be decided after consultation with the computer vision team. 

#### Optical Flow experiments
We conducted similar experiments as with the raw videos for impact on low-level algorithms. We expect the demosaiced videos to have much less impact.

#### Higher-Level algorithm impact
We plan to conduct more experiments on this. But, overall higher level algorithms seem to be less impacted by compression artefacts. 
