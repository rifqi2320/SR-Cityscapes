# Repository Structure

- `main.ipynb`: Main Jupyter notebook demonstrating the workflow for segmentation and image enhancement.
- `README.md`: Project overview and instructions.
- `datasets/`: Contains the Cityscapes dataset and related files.
  - `cityscapes/`: Downloaded Cityscapes data, including images and annotations.
- `deeplabv3plus/`: Code for semantic segmentation using DeepLabV3+.
- `Real-ESRGAN/`: Code for image enhancement using Real-ESRGAN.
- `results/`: Stores output metrics and results from experiments.
- `scripts/`: Utility scripts, such as `download_cityscapes.sh` for dataset downloading.

This structure organizes the code, data, and results for a workflow involving semantic segmentation and image enhancement. The main external repositories (`deeplabv3plus` and `Real-ESRGAN`) are included as folders for direct use.

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
