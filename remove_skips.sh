#!/bin/bash -e

# Define the stages
stages=("stage0" "stage1" "stage2" "stage3" "stage4")
image_stages=("stage2" "stage4")

# Loop through each stage and create a SKIP file
for stage in "${stages[@]}"; do
    rm "$stage/SKIP"
done

# Loop through each image stage and create a SKIP_IMAGES file
for stage in "${image_stages[@]}"; do
    rm "$stage/SKIP_IMAGES"
done

