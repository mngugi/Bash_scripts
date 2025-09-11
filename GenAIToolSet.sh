#!/usr/bin/env bash
set -euo pipefail

# setup_genai.sh
# Creates a Python venv and installs a broad Gen-AI toolset:
# - PyTorch + torchvision
# - pyro-ppl
# - JAX + jaxlib (CPU/GPU autodetect)
# - flax
# - transformers, diffusers, accelerate
# - stylegan (community implementations)
# - nerf tools (nerfstudio)
# - GLM client / example (open-source GLM-like models)
# - DALL·E/Imagen-friendly packages (dalle-mini, imagen-pytorch, lucidrains repos)
# - extras: datasets, tokenizers, wandb, accelerate, bitsandbytes (optional)
#
# NOTE: Proprietary products (DALL·E-2, Imagen by Google) do not have a single pip install; this script installs
# open-source tooling and community re-implementations / clients so you can experiment locally or with API keys.

VENV_DIR="${VENV_DIR:-./venv_genai}"
PYTHON="${PYTHON:-python3}"

echo "=== Gen-AI toolset installer ==="
echo "Python executable: ${PYTHON}"
echo "Virtualenv dir: ${VENV_DIR}"
echo

# Basic system packages (Debian/Ubuntu)
echo "Installing system packages (sudo may be required)..."
sudo apt update
sudo apt install -y build-essential git curl wget pkg-config cmake unzip \
    libopenblas-dev libblas-dev liblapack-dev llvm \
    libglib2.0-0 libsm6 libxrender1 libxext6 ffmpeg

# Optional: CUDA / NVIDIA driver detection
if command -v nvidia-smi >/dev/null 2>&1; then
  echo "NVIDIA GPU detected (nvidia-smi present). Please ensure appropriate CUDA toolkit and drivers are installed."
else
  echo "No NVIDIA GPU detected (nvidia-smi missing). Script will install CPU versions of some libs where applicable."
fi

# Create venv
echo "Creating virtualenv..."
$PYTHON -m venv "$VENV_DIR"
# activate
source "${VENV_DIR}/bin/activate"

pip install --upgrade pip setuptools wheel

# Install core python ML libs first (choose proper torch wheel depending on GPU availability)
echo
echo "Installing core ML libraries..."

# Attempt to detect CUDA availability in environment for selecting torch/jax wheels.
# This chooses CPU wheels by default to be safe; GPU users should follow PyTorch/JAX official instructions for CUDA matching.
if command -v nvidia-smi >/dev/null 2>&1; then
  # We'll install the latest stable CPU/GPU compatible wheels from pip where possible.
  echo "Installing PyTorch (GPU preferred) via pip -- if you want a specific CUDA version, replace this step with official instructions."
  pip install --upgrade "torch" torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 || pip install --upgrade torch torchvision torchaudio
else
  echo "Installing CPU-only PyTorch."
  pip install --upgrade "torch" torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cpu || pip install --upgrade torch torchvision torchaudio
fi

# Probabilistic programming: Pyro
pip install --upgrade pyro-ppl

# Transformers, tokenizers, diffusers, accelerate (Hugging Face stack)
pip install --upgrade transformers tokenizers datasets diffusers accelerate safetensors

# Logging, monitoring, and utilities
pip install --upgrade wandb mlflow typing_extensions requests tqdm sentencepiece

# JAX + jaxlib
# WARNING: jaxlib wheel must match your CUDA / Python / platform. This script installs CPU jaxlib by default if no GPU is detected.
if command -v nvidia-smi >/dev/null 2>&1; then
  echo "Installing jax[tpu]? Attempting GPU-capable jax and jaxlib (may need manual adjustment for CUDA versions)."
  # Attempt a best-effort install: if it fails, instruct user to follow official jax installation guide.
  pip install --upgrade "jax[cuda]>=0.4.14" -f https://storage.googleapis.com/jax-releases/jax_releases.html || {
    echo "Automatic jax GPU install failed; installing CPU jax instead."
    pip install --upgrade jax jaxlib
  }
else
  echo "Installing CPU JAX."
  pip install --upgrade jax jaxlib
fi

# Flax (Neural network library for JAX)
pip install --upgrade flax optax

# Bitsandbytes (optional; only useful with GPU and for 8-bit optimizers)
pip install --upgrade bitsandbytes || echo "bitsandbytes install failed; ensure CUDA & compilers are present if you want GPU+8bit support."

# Stable Diffusion / image-gen helpers (diffusers already installed)
pip install --upgrade "transformers[sentencepiece]" pillow accelerate

# DALL·E / Imagen related (community implementations)
# - dalle-mini (now "dalle-mini" or "dalle-mini" community) - high level
# - dalle_pytorch from lucidrains
pip install --upgrade dalle-mini || echo "dalle-mini pip install failed (may be unavailable); try using Hugging Face transformers/diffusers"
pip install --upgrade git+https://github.com/lucidrains/DALLE-pytorch.git@main --no-deps || echo "dalle-pytorch install failed; continue"

# Imagen reimplementations (community): imagen-pytorch
pip install --upgrade git+https://github.com/lucidrains/imagen-pytorch.git@main || echo "imagen-pytorch failed to install; it's a community project."

# StyleGAN (community implementations)
pip install --upgrade git+https://github.com/rosinality/stylegan2-pytorch.git@master || pip install --upgrade stylegan2_pytorch || echo "stylegan2 install fallback failed."

# NeRF tooling: nerfstudio (a full framework) and tiny-cuda-nn (if GPU)
pip install --upgrade nerfstudio || echo "nerfstudio install failed; consider installing from https://nerf.studio docs."

# GLM / large language model tooling:
# There are several "GLM" projects (e.g., Chinese GLM models, etc.). We'll install general LLM tooling and an example GLM client if community packages exist.
pip install --upgrade accelerate transformers auto-gptq safetensors
# If you want a specific GLM repo (like Tsinghua/THUDM's GLM) you may need to clone and install from source:
# Example (uncomment if desired):
# git clone https://github.com/THUDM/GLM.git && cd GLM && pip install -r requirements.txt && python setup.py install && cd -

# Optional / helpful community tools
pip install --upgrade jupyterlab notebook matplotlib seaborn scikit-learn opencv-python

# Cleanup / show installed summary
echo
echo "=== Install completed (inside venv: ${VENV_DIR}) ==="
echo "Activate with: source ${VENV_DIR}/bin/activate"
echo "Key packages installed (pip list | grep -E ...):"
pip list | sed -n '1,200p' | grep -E "torch|jax|flax|pyro|transformers|diffusers|nerfstudio|dalle|imagen|stylegan|bitsandbytes" || true

echo
echo "Notes / next steps:"
echo " - For optimal GPU performance you should install PyTorch and jaxlib matching your CUDA version using each project's official instructions."
echo " - DALL·E-2 and Google Imagen are proprietary; use Hugging Face Diffusers, dalle-mini, or cloud APIs for latest models."
echo " - If you want to enable CUDA-accelerated tiny-cuda-nn / nerf features you may need to install NVIDIA CUDA toolkit and compile some packages from source."
echo " - To add other tools (OpenAI CLI, official Imagen API if available, or model weights), say which ones and I'll add them to the script."

echo
echo "Happy building! 🚀"
