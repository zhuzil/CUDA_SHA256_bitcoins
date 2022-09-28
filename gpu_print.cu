// #pragma GCC optimize(2)

#include <cuda_runtime.h>
#include <device_launch_parameters.h>
#include <iostream>

void helloFromCPU()
{
    printf("Hello World from CPU!\n");
}

__global__ void helloFromGPU()
{
    printf("Hello World from GPU!\n");
}

__global__ void gpu_print(int N){
    int idx = threadIdx.x + blockIdx.x*blockDim.x;
    if(idx<N){
        printf("%d\n",idx);
    }
}
int main() {
    // helloFromGPU <<<1, 2>>> ();
    // // cudaDeviceSynchronize();//同步函数，阻塞接下来串行执行的cpu任务
    // helloFromCPU();

    gpu_print<<<6,4>>>(24);

    
    cudaDeviceReset();
    return 0;
}
