#!/bin/sh
#!/bin/bash

## Write Help Message
# Usage: ${0##*/} [-hgd] [-q crf] [INPUT] [OUTPUT] 
show_help() {
cat << EOF
Usage: ${0##*/} [-hd] [-q crf] [INPUT] [OUTPUT] 

Performs video compression of the INPUT and stores it in the path OUTPUT

    -h          display this help and exit
    -d          Performs Denoising of the video prior to compression
    -q		Set the quality (crf) value for compression
EOF
}
#    -g		Removes the grid present in the video

## Initialise Parameters
crf=16
grid_remove=false
denoise=true

## GetOpt reads optional parameters
while getopts "q:hgd" opt; do
	case $opt in
    	h)
      		show_help
		    exit 0
      		;;
    	g)
      		echo "-g : Grid Remove" >&2
      		grid_remove=true
      		;;
    	d)
      		echo "-d : Perform Denoising" >&2
      		denoise=true
      		;;
	    q) 
		    echo "-q : CRF Quality value is $OPTARG" >&2
		    crf=$OPTARG
 		    ;;
    	\?)
      		echo "Invalid option: -$OPTARG" >&2
      		exit 1
      		;;
	    :)
		    echo "Option -$OPTARG requires an argument" >&2
		    exit 1
  	    	;;
	esac
done

## Read the input & output file names
shift $(($OPTIND - 1))
if [ "$#" -ne 2 ]; then
    echo "Need to provide both the input and output file names"
    exit 1
fi
INPUT=$1
OUTPUT=$2
echo "$INPUT"

# default deinterlace option
OPTIONS="yadif"

## Remove Grid
# if $grid_remove; then
#     OPTIONS="$OPTIONS,convselective=0 1 0 1 0 1 0 1 0:0 1 0 1 0 1 0 1 0:0 1 0 1 0 1 0 1 0:0 1 0 1 0 1 0 1 0:1/4:1/4:1/4:1/4:0:0:0:0:0:1:2:2"
#     echo "Grid removed"
# fi

# Denoise the video if required
if $denoise; then
	OPTIONS="$OPTIONS,hqdn3d=1.5:1.5:6:6"
fi


#main command
ffmpeg -i $INPUT -vf "$OPTIONS" -preset veryslow -c:v libx264 -x264-params crf=$crf $OUTPUT
