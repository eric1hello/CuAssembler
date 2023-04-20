
/* Copyright (c) . All rights reserved. */

#include <stdio.h>
#include <cuda_runtime.h>

__global__ void matrixAdd(const int *data_a, int lda, int k , int *data_o) {

int tid = threadIdx.x;
int bid = blockIdx.x;
int bdm = blockDim.x;

const int *data_a_ptr = data_a + bid*bdm +tid;

int *data_o_ptr = data_o + bid * bdm +tid;

for (int i = 0; i<k; i++) {
  int tmp = *data_a_ptr;
  data_a_ptr += lda;
  *data_o_ptr = tmp +1;
  data_o_ptr += lda;
  }
}

int main(void) {
  cudaError_t err = cudaSuccess;

  int numElements = 32;
  size_t size = numElements * sizeof(int);

  int *h_data1_in  = (int *)malloc(size);
  int *h_data2_in  = (int *)malloc(size);

  for (int i = 0; i < numElements; ++i) {
    h_data1_in[i] = i;
    h_data2_in[i] = numElements - i;
  }

  int *d_data1_in = NULL;
  err = cudaMalloc((void **)&d_data1_in, size);
  
  int *d_data2_in = NULL;
  err = cudaMalloc((void **)&d_data2_in, size);

  printf("Copy input data from the host memory to the CUDA device\n");
  err = cudaMemcpy(d_data1_in,  h_data1_in, size, cudaMemcpyHostToDevice);
  err = cudaMemcpy(d_data2_in,  h_data2_in, size, cudaMemcpyHostToDevice);

  int threadsPerBlock = 32;
  int blocksPerGrid = (numElements + threadsPerBlock - 1) / threadsPerBlock;
  printf("CUDA kernel launch with %d blocks of %d threads\n", blocksPerGrid,
         threadsPerBlock);
  matrixAdd<<<blocksPerGrid, threadsPerBlock>>>(d_data1_in,10,2, d_data2_in);
  err = cudaGetLastError();

  if (err != cudaSuccess) {
    fprintf(stderr, "Failed to launch vectorAdd kernel (error code %s)!\n",
            cudaGetErrorString(err));
    exit(EXIT_FAILURE);
  }
  


  err = cudaFree(d_data1_in);
  err = cudaFree(d_data2_in);

  free(h_data1_in);
  free(h_data2_in);

  printf("Done\n");
  return 0;
}

