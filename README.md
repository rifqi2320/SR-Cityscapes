# main.ipynb - Project Overview

This notebook demonstrates a workflow for semantic segmentation and image enhancement using two main repositories:

- **DeepLabV3+**: For semantic segmentation of images, particularly on the Cityscapes dataset.
- **Real-ESRGAN**: For enhancing the resolution and quality of images.

## General Flow
1. **Dataset Preparation**: Scripts are provided to download and prepare the Cityscapes dataset for training and evaluation.
2. **Segmentation**: The DeepLabV3+ model is used to perform semantic segmentation on the images.
3. **Image Enhancement**: Real-ESRGAN is used to enhance the segmented images for better visual quality.

## Scripts
- `scripts/download_cityscapes.sh`: Downloads and extracts the Cityscapes dataset.

This notebook ties together these steps, providing a streamlined process from data preparation to segmentation and enhancement.
