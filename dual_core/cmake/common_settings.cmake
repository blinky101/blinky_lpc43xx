#------------------------------------------------------------------------------
# CPM init
#------------------------------------------------------------------------------
#
# Required variables:
#
# TOPLEVEL_SRC_DIR
# TOPLEVEL_BIN_DIR

set(CMAKE_SOURCE_DIR ${TOPLEVEL_SRC_DIR})
include(${CMAKE_SOURCE_DIR}/cmake/CPM_setup.cmake)


#------------------------------------------------------------------------------
# Detect Board Specific Settings
#------------------------------------------------------------------------------

# default settings
set(OPTIMIZE 0)
set(BLACKMAGIC_DEV /dev/ttyBmpGdb)
set(POWER_TARGET "no")

# Include custom settings
# (if this file does not exist, copy it manually from config.cmake.example)
include(${CMAKE_SOURCE_DIR}/config.cmake)

message(STATUS "Config OPTIMIZE: ${OPTIMIZE}")
message(STATUS "Config BLACKMAGIC_DEV: ${BLACKMAGIC_DEV}")
message(STATUS "Config POWER_TARGET: ${POWER_TARGET}")


#------------------------------------------------------------------------------
# Common Config
#------------------------------------------------------------------------------

set(FLASH_CFG               lpc4337_swd)


# system libraries to link, separated by ';'
set(SYSTEM_LIBRARIES m c gcc)

# compile flags
set(C_FLAGS_WARN "-Wall -Wextra -Wno-unused-parameter                   \
    -Wshadow -Wpointer-arith -Winit-self -Wstrict-overflow=4            \
    -Werror=implicit-function-declaration")

set(C_FLAGS "${C_FLAGS_WARN} -O${OPTIMIZE} -g3 -c -fmessage-length=80   \
    -fno-builtin -ffunction-sections -fdata-sections -std=gnu11 -mthumb \
    -fdiagnostics-color=auto")

# linker flags
set(L_FLAGS "${TARGET_L_FLAGS} -fmessage-length=80 -nostdlib -specs=nano.specs \
    -mthumb -Wl,--gc-sections")

# use POSIX standard 2008
add_definitions("-D_GNU_SOURCE")

set(C_FLAGS_PLATFORM    "-DMCU_PLATFORM_${MCU_PLATFORM}")
set(ALL_C_FLAGS "${TARGET_C_FLAGS} ${C_FLAGS} ${C_FLAGS_WARN} ${C_FLAGS_PLATFORM}")
message(STATUS "C flags: '${ALL_C_FLAGS}")
message(STATUS "L flags: '${L_FLAGS}")

#------------------------------------------------------------------------------
# Common Variables & definitions
#------------------------------------------------------------------------------

set(ELF_PATH            "${CMAKE_CURRENT_BINARY_DIR}/${EXE_NAME}")
set(EXE_PATH            "${ELF_PATH}.bin")
set(FLASH_FILE          ${TOPLEVEL_BIN_DIR}/flash.cfg)

add_definitions("${TARGET_C_FLAGS} ${C_FLAGS} ${C_FLAGS_WARN} ${C_FLAGS_PLATFORM}")

#------------------------------------------------------------------------------
# Common CPM Modules
#------------------------------------------------------------------------------

CPM_AddModule("mcu_debug"
    GIT_REPOSITORY "https://github.com/JitterCompany/mcu_debug.git"
    GIT_TAG "2.1")

