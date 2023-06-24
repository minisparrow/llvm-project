
all: 
	llc -mcpu=sm_50 ./cuda-vector-add.ll -o kernel.ptx
	clang++ cuda-vector-add.cpp -o sample -O2 -g -I/usr/local/cuda/include -lcuda

clean:
	rm kernel.ptx sample
