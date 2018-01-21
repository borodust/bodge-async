#include "bodge_async.h"
#ifndef __CLAW_API
#  if defined(_WIN32)
#    define __CLAW_API __declspec(dllexport)
#  elif defined(__GNUC__)
#    define __CLAW_API __attribute__((visibility("default")))
#  else
#    define __CLAW_API
#  endif
#endif
#if defined(__cplusplus)
extern "C" {
#endif

__CLAW_API void __claw_uv_buf_init(uv_buf_t* arg2, char* arg0, unsigned int arg1) {
  uv_buf_t result = uv_buf_init(arg0, arg1);
  (*arg2) = result;
}
#if defined(__cplusplus)
}
#endif
