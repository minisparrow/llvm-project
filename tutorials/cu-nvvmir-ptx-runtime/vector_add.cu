
__global__ void vectorAdd(__global__ float *a, __global__ float *b, __global__ float *c) {

  // Get index of current thread
  int i = threadIdx.x;

  // Make sure we do not go out of bounds
  if (i < 16) {
     c[i] = a[i] + b[i];
  }

}
