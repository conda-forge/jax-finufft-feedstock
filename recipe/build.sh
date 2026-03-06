set -eux

if [[ "${cuda_compiler_version:-None}" != "None" ]]; then
    export SKBUILD_CMAKE_DEFINE="JAX_FINUFFT_USE_CUDA=ON;CMAKE_CUDA_ARCHITECTURES=all-major;FINUFFT_ARCH_FLAGS="
else
    # Turn off "-march=native"
    export SKBUILD_CMAKE_DEFINE="FINUFFT_ARCH_FLAGS="
fi

${PYTHON} -m pip install . -vv
