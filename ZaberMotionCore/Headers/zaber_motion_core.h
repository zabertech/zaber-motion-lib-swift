#pragma once

#include <stdint.h>

typedef uint8_t GoUint8;
typedef int32_t GoInt32;
typedef int64_t GoInt64;

extern GoInt32 zml_call(void* request, GoInt64 tag, void* callback, GoUint8 async);
extern void zml_setEventHandler(int64_t tag, void* callback);
