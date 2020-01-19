#!/bin/sh

IMAGE_SVG_BASE64="data:image/svg+xml;base64,$(base64 -w 0 images/gnome.svg)"

echo $IMAGE_SVG_BASE64 > gnome.txt