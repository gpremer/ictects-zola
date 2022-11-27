#!/usr/bin/env bash

# Converts all png images lossily to webp with a fixed quality
# This doesn't mean that webp should be used for all images.
# Only for the photo-like ones.

quality=50

set -euo pipefail

[ -x "$(command -v convert)" ] || (
    echo "ImageMagick is not installed"
    exit 1
)
[ -x "$(command -v cwebp)" ] || (
    echo "libwebp is not installed"
    exit 1
)

echo "Converting png images to webp for a faster loading site"

# Assuming all resources are under static/images, which is in the same directory as this script
img_path=${0%/*}/static/images

for img in $(find ${img_path} -name \*.png); do
    webp="${img%.*}.webp"
    echo converting $img to $webp
    convert $img -quality $quality $webp
done
