LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(LOCAL_PATH)/../src/main.cpp
LOCAL_MODULE := test


COMMAND := -static -s -Oz -g0 \
  -ffinite-loops -funroll-loops -fvectorize -ftree-vectorize\
  -fno-stack-protector -fno-exceptions -fno-rtti \
  -ffat-lto-objects -flto -funified-lto -fwhole-program-vtables  -fvirtual-function-elimination \
  -falign-loops -faligned-allocation -fcommon -fdata-sections -fdiscard-value-names -ffunction-sections -finline-functions -fjump-tables -fmerge-all-constants -fomit-frame-pointer -fshort-enums -fsized-deallocation

LOCAL_CFLAGS := $(COMMAND) $(OPT)
LOCAL_CPPFLAGS := $(COMMAND) $(OPT) -std=c++20
LOCAL_LDFLAGS := $(COMMAND)

include $(BUILD_EXECUTABLE)