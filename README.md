# fcodec
New video compression scheme. 

Some install/usage instructions have been added below. I will keep on updating the document to make it easier, and as the project progresses.
## Discussion (8 sept)
As discussed during the previous meeting:

1. We want a compressor for colored video & raw-unbayered video (video which has not yet been demosaiced from the Bayer filter). The current compressor should work fine for the colored video directly, as ffmpeg adjusts the number of channels accordingly.
- To make it work, I have removed the grid filter (which was supposed to correct for demosaicing, as of now).
- I have retained the denoiser, as that is still important and gives a slight improvement of ~20-30%.

2. For demosaicing, right now working with matlab executables. But, as our plan to work on demosaicing is still uncertain, will wait until the next discussion.

3. Broad experiments: 


## Install
Fcodec can simply be installed as follows:
```bash
#install ffmpeg and its libraries. 
./install.sh`
```
If custom ffmpeg install is required, follow the steps below.

Fcodec depends upon ffmpeg. Some custom filters have been implemented in FFmpeg. 
 - Use the guide/install to download the dependencies of FFmpeg: [FFmpeg Compilation Guide](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu)
 - As of now, we only need x264, x265 libraries. So no need to install other external libraries
 - Download the custom FFmpeg implementation from: [FFmpeg download](https://github.com/kedartatwawadi/FFmpeg) (Use git clone <link>)
 - Proceed as per the installation guide to install the library. [FFmpeg Compilation Guide](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu)
 - Download the fcodec by cloning: [fcodec github](https://github.com/kedartatwawadi/fcodec)

## Usage

```bash
#USAGE
usage: fcodec.sh [-hgd] [-q crf] [INPUT] [OUTPUT] 
Performs video compression of the INPUT and stores it in the path OUTPUT
    -h      display this help and exit
    -g      Removes the grid present in the video
    -d      Performs Denoising of the video prior to compression
    -q      Set the quality (crf) value for compression
```

## TODO
1. Perform compression without demosaicing at the source
2. Tryout VP9
