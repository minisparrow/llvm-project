all: 
	clang++ --cuda-gpu-arch=sm_50  vector_add.cu -emit-llvm -S -O2 
	llvm-dis vector_add-cuda-nvptx64-nvidia-cuda-sm_50.bc -o a.ll
	llc -mcpu=sm_50 a.ll -o kernel.ptx
	clang++ cuda-vector-add.cpp -d -o sample -O2 -g -I/usr/local/cuda/include -lcuda

clean:
	rm kernel.ptx sample *.bc
