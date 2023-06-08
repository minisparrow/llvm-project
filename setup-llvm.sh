mkdir -p ./build && cd ./build
cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo\
               -DLLVM_TARGETS_TO_BUILD="RISCV;X86" \
               -DLLVM_ENABLE_PROJECTS="clang;mlir" \
               -DLLVM_BUILD_LLVM_DYLIB=ON \
               -DCMAKE_C_COMPILER_LAUNCHER=ccache \
               -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
               -DLLVM_USE_LINKER=gold \
               -DLLVM_BUILD_EXAMPLES=ON \
               ../llvm
ninja -j10  


