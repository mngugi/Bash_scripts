#!/usr/bin/env bash
set -euo pipefail

# setup_ai_conda.sh
# Unified AI/ML/Gen-AI environment setup with Conda (GPU support)
# Includes: Data Science libs, ML toolkits, PyTorch/JAX/Flax/Pyro, StyleGAN, NeRF, DALL·E, Imagen, GLM

ENV_NAME="${ENV_NAME:-ai_full_env}"
PYTHON_VERSION="${PYTHON_VERSION:-3.10}"

echo "=========================================="
echo "🚀 AI/ML/Gen-AI Full Environment Installer"
echo "Using Conda environment: ${ENV_NAME}"
echo "Python version: ${PYTHON_VERSION}"
echo "=========================================="

# --- Install Miniconda if not installed ---
if ! command -v conda &> /dev/null; then
  echo "Installing Miniconda..."
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
  bash miniconda.sh -b -p $HOME/miniconda
  eval "$($HOME/miniconda/bin/conda shell.bash hook)"
  conda init bash
else
  echo "✅ Conda is already installed."
fi

# --- Create environment ---
echo "Creating Conda environment ${ENV_NAME}..."
conda create -y -n "${ENV_NAME}" python=${PYTHON_VERSION}
eval "$(conda shell.bash hook)"
conda activate "${ENV_NAME}"

# --- Detect NVIDIA GPU ---
if command -v nvidia-smi &>/dev/null; then
  echo "✅ NVIDIA GPU detected."
  GPU_FLAG="gpu"
else
  echo "⚠️ No NVIDIA GPU detected. Installing CPU versions."
  GPU_FLAG="cpu"
fi

# --- Conda channels ---
conda config --add channels conda-forge
conda config --add channels nvidia
conda config --add channels pytorch

# --- Core Data Science Libraries ---
echo "Installing core Data Science packages..."
conda install -y numpy pandas scipy scikit-learn matplotlib seaborn \
                 jupyterlab notebook statsmodels

# --- PyTorch (GPU or CPU) ---
echo "Installing PyTorch..."
if [ "$GPU_FLAG" == "gpu" ]; then
  conda install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
else
  conda install -y pytorch torchvision torchaudio cpuonly -c pytorch
fi

# --- ML Libraries ---
echo "Installing ML toolkits..."
pip install lightgbm catboost gym

# --- Hugging Face + Diffusers ---
pip install transformers tokenizers datasets diffusers accelerate safetensors

# --- JAX + Flax ---
if [ "$GPU_FLAG" == "gpu" ]; then
  pip install --upgrade "jax[cuda11_local]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html
else
  pip install --upgrade jax jaxlib
fi
pip install flax optax

# --- Pyro (Probabilistic Programming) ---
pip install pyro-ppl

# --- GAN / NeRF / Image-Gen ---
echo "Installing GAN/NeRF libraries..."
pip install git+https://github.com/rosinality/stylegan2-pytorch.git@master
pip install nerfstudio
pip install git+https://github.com/lucidrains/DALLE-pytorch.git@main
pip install git+https://github.com/lucidrains/imagen-pytorch.git@main
pip install dalle-mini || echo "⚠️ dalle-mini pip package may be deprecated, use Hugging Face models."

# --- GLM Models ---
echo "Installing GLM repo..."
git clone https://github.com/THUDM/GLM.git || true
cd GLM && pip install -r requirements.txt && python setup.py install && cd ..

# --- Extras ---
pip install wandb mlflow bitsandbytes opencv-python tqdm sentencepiece \
            matplotlib seaborn scikit-learn pillow jupyter

echo "=========================================="
echo "✅ Installation complete!"
echo "Activate environment with: conda activate ${ENV_NAME}"
echo "CUDA available? Run: python -c 'import torch; print(torch.cuda.is_available())'"
echo "=========================================="
