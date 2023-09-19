#
# Copyright (C) 2023 Dhina17 <dhinalogu@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#
#


# Generate images for different size 
# (hdpi, mdpi, xhdpi, xxhdpi) from xxxhdpi images
#
# I used it to generate images for android recovery.
# bootable/recovery/res-*dpi/images/
# 
# Note: Conversion is done based on my xxxhdpi images type and sizes.
#       So have to modify this script accordingly 
#

set -e

# Recreate directories
rm -rf res-xxxhdpi/images
rm -rf res-xxhdpi/images
rm -rf res-xhdpi/images
rm -rf res-hdpi/images
rm -rf res-mdpi/images

mkdir -p res-xxxhdpi/images
mkdir -p res-xxhdpi/images
mkdir -p res-xhdpi/images
mkdir -p res-hdpi/images
mkdir -p res-mdpi/images

# Original images in xxxhdpi
FILES="res-xxxhdpi-original/images/*.png"
for f in $FILES
do
  echo "Processing $f file..."
  name=$(basename $f)
  new_path="res-xxxhdpi/images/"
  new_file="${new_path}${name}"
  # Copy to new path
  cp $f $new_path
  # Convert images
  if [[ "$f" == *"progress"* ]] || [[ "$f" == *"icon_error"* ]] || [[ "$f" == *"stage"* ]]; then
    echo "error/progress/stage images found. So skip and just copy"
    if [[ "$f" == *"progress"* ]] || [[ "$f" == *"icon_error"* ]]; then
      echo "Progress/error icon image found. Convert it to PNG24"
      convert $new_file PNG24:$new_file
    fi

    cp $new_file res-xxhdpi/images/$name
    cp $new_file res-xhdpi/images/$name
    cp $new_file res-hdpi/images/$name
    cp $new_file res-mdpi/images/$name
  elif [[ "$f" == *"logo_image"* ]] || [[ "$f" == *"fastbootd"* ]]; then
    # convert $new_file -resize 75% res-xxhdpi/images/$name
    # convert $new_file -resize 66% res-xhdpi/images/$name
    # convert $new_file -resize 50% res-hdpi/images/$name
    # convert $new_file -resize 33% res-mdpi/images/$name
    # To PNG24
    convert $new_file PNG24:$new_file
    convert $new_file -resize 768x480 res-xxhdpi/images/$name
    convert $new_file -resize 512x320 res-xhdpi/images/$name
    convert $new_file -resize 384x240 res-hdpi/images/$name
    convert $new_file -resize 256x160 res-mdpi/images/$name
  elif [[ "$f" == *"ic_back"* ]]; then
    convert $new_file -resize 120x120 res-xxhdpi/images/$name
    convert $new_file -resize 80x80 res-xhdpi/images/$name
    convert $new_file -resize 52x52 res-hdpi/images/$name
    convert $new_file -resize 34x34 res-mdpi/images/$name
  elif [[ "$f" == *"loop"* ]]; then
    convert $new_file -resize 600x600 res-xxhdpi/images/$name
    convert $new_file -resize 400x400 res-xhdpi/images/$name
    convert $new_file -resize 300x300 res-hdpi/images/$name
    convert $new_file -resize 200x200 res-mdpi/images/$name
  elif [[ "$f" == *"font_menu"* ]]; then
    # convert $new_file -resize 3456x128 $new_file
    convert $new_file -resize 2592x96 res-xxhdpi/images/$name
    convert $new_file -resize 1728x64 res-xhdpi/images/$name
    convert $new_file -resize 1152x43 res-hdpi/images/$name
    convert $new_file -resize 768x28 res-mdpi/images/$name
  elif [[ "$f" == *"erasing_text"* ]]; then
    # convert $new_file -resize 703x10089 $new_file
    convert $new_file -resize 525x7600 res-xxhdpi/images/$name
    convert $new_file -resize 351x5111 res-xhdpi/images/$name
    convert $new_file -resize 266x3932 res-hdpi/images/$name
    convert $new_file -resize 173x2622 res-mdpi/images/$name
  elif [[ "$f" == *"error_text"* ]]; then
    # convert $new_file -resize 659x10089 $new_file
    convert $new_file -resize 492x7600 res-xxhdpi/images/$name
    convert $new_file -resize 330x5111 res-xhdpi/images/$name
    convert $new_file -resize 249x3932 res-hdpi/images/$name
    convert $new_file -resize 163x2622 res-mdpi/images/$name
  elif [[ "$f" == *"installing_security_text"* ]]; then
    # convert $new_file -resize 1200x10881 $new_file
    convert $new_file -resize 900x8188 res-xxhdpi/images/$name
    convert $new_file -resize 480x6398 res-xhdpi/images/$name
    convert $new_file -resize 480x4004 res-hdpi/images/$name
    convert $new_file -resize 420x2622 res-mdpi/images/$name
  elif [[ "$f" == *"installing_text"* ]]; then
    # convert $new_file -resize 1200x10353 $new_file
    convert $new_file -resize 900x7796 res-xxhdpi/images/$name
    convert $new_file -resize 480x6002 res-xhdpi/images/$name
    convert $new_file -resize 480x3956 res-hdpi/images/$name
    convert $new_file -resize 375x2622 res-mdpi/images/$name
  elif [[ "$f" == *"no_command_text"* ]]; then
    # convert $new_file -resize 780x10089 $new_file
    convert $new_file -resize 586x7600 res-xxhdpi/images/$name
    convert $new_file -resize 390x5111 res-xhdpi/images/$name
    convert $new_file -resize 292x3932 res-hdpi/images/$name
    convert $new_file -resize 196x2622 res-mdpi/images/$name
  fi
done
