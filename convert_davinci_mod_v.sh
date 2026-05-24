#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Please provide at least one argument."
  echo "Input must be an mp4 file."
  echo "Output will have the .mov extension."
  exit 1
fi

# Using "$@" preserves arguments with spaces
for arg in "$@"; do
  echo "Processing: $arg"
  ffmpeg -i "${arg}" -c:v prores_ks -profile:v 2 -c:a copy "${arg}.conv_v.mov"

done

#ffmpeg -i input.mp4 -c:v prores_ks -profile:v 2 -c:a pcm_s16le -ar 44100 -ac 2 output.mov
