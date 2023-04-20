#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-function"
#pragma GCC diagnostic ignored "-Wcast-qual"
#define __NV_CUBIN_HANDLE_STORAGE__ static
#if !defined(__CUDA_INCLUDE_COMPILER_INTERNAL_HEADERS__)
#define __CUDA_INCLUDE_COMPILER_INTERNAL_HEADERS__
#endif
#include "crt/host_runtime.h"
#include "test_war.fatbin.c"
extern void __device_stub__Z9matrixAddPKiiiPi(const int *, int, int, int *);
static void __nv_cudaEntityRegisterCallback(void **);
static void __sti____cudaRegisterAll(void) __attribute__((__constructor__));
void __device_stub__Z9matrixAddPKiiiPi(const int *__par0, int __par1, int __par2, int *__par3){__cudaLaunchPrologue(4);__cudaSetupArgSimple(__par0, 0UL);__cudaSetupArgSimple(__par1, 8UL);__cudaSetupArgSimple(__par2, 12UL);__cudaSetupArgSimple(__par3, 16UL);__cudaLaunch(((char *)((void ( *)(const int *, int, int, int *))matrixAdd)));}
# 7 "test_war.cu"
void matrixAdd( const int *__cuda_0,int __cuda_1,int __cuda_2,int *__cuda_3)
# 7 "test_war.cu"
{__device_stub__Z9matrixAddPKiiiPi( __cuda_0,__cuda_1,__cuda_2,__cuda_3);
# 23 "test_war.cu"
}
# 1 "hnvcc_keep_dir/test_war.cudafe1.stub.c"
static void __nv_cudaEntityRegisterCallback( void **__T3) {  __nv_dummy_param_ref(__T3); __nv_save_fatbinhandle_for_managed_rt(__T3); __cudaRegisterEntry(__T3, ((void ( *)(const int *, int, int, int *))matrixAdd), _Z9matrixAddPKiiiPi, (-1)); }
static void __sti____cudaRegisterAll(void) {  __cudaRegisterBinary(__nv_cudaEntityRegisterCallback);  }

#pragma GCC diagnostic pop
