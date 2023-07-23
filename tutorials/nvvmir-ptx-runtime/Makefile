
all: 
	llc -mcpu=sm_50 ./vector-add.ll -o kernel.ptx
	clang++ vector-add.cpp -o sample -O2 -g -I/usr/local/cuda/include -lcuda
	ptxas -arch=sm_50 kernel.ptx -o kernel.cubin
	

clean:
	rm kernel.ptx sample kernel.cubin
