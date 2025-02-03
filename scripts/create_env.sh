conda create --name splat-slam python=3.10
conda activate splat-slam

conda install -y conda-forge::cudatoolkit-dev=11.7.0
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia

python -m pip install -e thirdparty/lietorch/
python -m pip install -e thirdparty/diff-gaussian-rasterization-w-pose/  
# If getting nvcc fatal   : Unsupported gpu architecture 'compute_89', may need to set export TORCH_CUDA_ARCH_LIST=8.7
python -m pip install -e thirdparty/simple-knn/
python -m pip install -e thirdparty/evaluate_3d_reconstruction_lib/

python -c "import torch; import lietorch; import simple_knn; import diff_gaussian_rasterization; print(torch.cuda.is_available())"

python -m pip install -e .
python -m pip install -r requirements.txt
python -m pip install pytorch-lightning==1.9 --no-deps

conda install "numpy<2.0"

evo_config set plot_backend Agg
