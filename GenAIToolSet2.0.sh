#!/usr/bin/env bash
set -euo pipefail

# setup_genai_cuda.sh
# Gen-AI Environment Installer with CUDA 11.8 GPU support
# Includes PyTorch (CUDA 11.8), JAX (CUDA), Flax, Pyro, StyleGAN, NeRF, DALL·E, Imagen, and more.

VENV_DIR="${VENV_DIR:-./venv_genai_cuda}"
PYTHON="${PYTHON:-python3}"

echo "=========================================="
echo "   🚀 Gen-AI CUDA 11.8 Toolset Installer  "
echo "Authoe: Peter Mwangi Ngugi "
echo "=========================================="
echo "Python executable: ${PYTHON}"
echo "Virtualenv dir: ${VENV_DIR}"
echo

# --- System Packages ---
echo "Installing system dependencies..."
sudo apt update
sudo apt install -y build-essential git curl wget pkg-config cmake unzip \
    libopenblas-dev libblas-dev liblapack-dev llvm \
    libglib2.0-0 libsm6 libxrender1 libxext6 ffmpeg \
    python3-dev python3-venv

# --- NVIDIA Drivers and CUDA Toolkit ---
echo "Installing NVIDIA driver and CUDA toolkit 11.8..."
sudo apt install -y nvidia-driver-535
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /"
sudo apt update
sudo apt install -y cuda-11-8

echo "CUDA installation complete. Please reboot if drivers were updated."

# --- Python Virtual Environment ---
echo "Creating virtual environment..."
$PYTHON -m venv "$VENV_DIR"
source "${VENV_DIR}/bin/activate"
pip install --upgrade pip setuptools wheel

# --- PyTorch with CUDA 11.8 ---
echo "Installing PyTorch (CUDA 11.8)..."
pip install torch==2.2.0+cu118 torchvision==0.17.0+cu118 torchaudio==2.2.0+cu118 \
  --extra-index-url https://download.pytorch.org/whl/cu118

# --- JAX + CUDA ---
echo "Installing JAX (CUDA)..."
pip install --upgrade "jax[cuda11_local]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

# --- Core Libraries ---
pip install pyro-ppl flax optax
pip install transformers tokenizers datasets diffusers accelerate safetensors
pip install bitsandbytes wandb mlflow typing_extensions requests tqdm sentencepiece
pip install pillow opencv-python matplotlib seaborn scikit-learn jupyterlab notebook

# --- GAN / NeRF / Image Gen Libraries ---
echo "Installing StyleGAN, NeRF, and image generation libraries..."
pip install git+https://github.com/rosinality/stylegan2-pytorch.git@master
pip install nerfstudio
pip install git+https://github.com/lucidrains/DALLE-pytorch.git@main
pip install git+https://github.com/lucidrains/imagen-pytorch.git@main

# --- DALL·E mini ---
pip install dalle-mini || echo "⚠️ dalle-mini pip package not available, use Hugging Face."

# --- GLM (THUDM repo) ---
echo "Installing GLM (optional model code from THUDM)..."
git clone https://github.com/THUDM/GLM.git || true
cd GLM && pip install -r requirements.txt && python setup.py install && cd ..

# --- Summary ---
echo "=========================================="
echo "✅ Installation complete!"
echo "Activate with: source ${VENV_DIR}/bin/activate"
echo "CUDA 11.8 environment is ready for PyTorch, JAX, GANs, NeRF, and Gen-AI tools."
echo "=========================================="
