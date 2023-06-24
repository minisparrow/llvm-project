mkdir -p ./build && cd ./build
cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo \
            -DLLVM_TARGETS_TO_BUILD="RISCV;X86;NVPTX" \
            -DMLIR_ENABLE_CUDA_RUNNER=ON \
            -DCMAKE_CUDA_COMPILER:PATH=/usr/local/cuda/bin/nvcc \
            -DLLVM_ENABLE_PROJECTS="clang;mlir" \
            -DLLVM_INSTALL_UTILS=ON \
            -DCMAKE_C_COMPILER_LAUNCHER=ccache \
            -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
            -DLLVM_USE_LINKER=gold \
            -DLLVM_INCLUDE_EXAMPLES=ON \
            -DLLVM_BUILD_EXAMPLES=ON \
            -DLLVM_INSTALL_UTILS=ON \
            -DMLIR_INCLUDE_INTEGRATION_TESTS=ON \
            ../llvm
ninja -j10
