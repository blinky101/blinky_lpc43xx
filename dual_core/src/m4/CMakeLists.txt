cmake_minimum_required(VERSION 3.5.0 FATAL_ERROR)

set(CMAKE_TOOLCHAIN_FILE
    ${TOPLEVEL_SRC_DIR}/cmake/toolchain-gcc-arm-embedded.cmake)
project(m4)

#------------------------------------------------------------------------------
# Target Specifig Build Settings
#------------------------------------------------------------------------------

# target specific
set(EXE_NAME                m4)
set(FLASH_ADDR              0x1A000000)
set(DEBUG_BREAKPOINT_LIMIT  6)
set(DEBUG_WATCHPOINT_LIMIT  4)

set(MCU_PLATFORM            43xx_m4)

add_definitions(-D__FPU_PRESENT)
set(FLOAT_FLAGS         "-mfloat-abi=hard -mfpu=fpv4-sp-d16")

set(TARGET_C_FLAGS      "-DCORE_M4 -mcpu=cortex-m4 -DARM_MATH_CM4 ${FLOAT_FLAGS}")
set(TARGET_L_FLAGS      "-mcpu=cortex-m4 ${FLOAT_FLAGS}")


#------------------------------------------------------------------------------
# Common Settings & CPM Modules
#------------------------------------------------------------------------------

include(${TOPLEVEL_SRC_DIR}/cmake/common_settings.cmake)


#------------------------------------------------------------------------------
# Target Specific CPM Modules
#------------------------------------------------------------------------------

CPM_AddModule("startup_lpc43xx_m4"
    GIT_REPOSITORY "https://github.com/JitterCompany/startup_lpc43xx_m4.git"
    GIT_TAG "1.2")

CPM_AddModule("lpc_tools"
    GIT_REPOSITORY "https://github.com/JitterCompany/lpc_tools.git"
    GIT_TAG "2.6.2")

CPM_AddModule("chip_lpc43xx_m4"
    GIT_REPOSITORY "https://github.com/JitterCompany/chip_lpc43xx_m4.git"
    GIT_TAG "3.3.0")

CPM_AddModule("c_utils"
    GIT_REPOSITORY "https://github.com/JitterCompany/c_utils.git"
    GIT_TAG "1.4.5")

CPM_Finish()


#------------------------------------------------------------------------------
# Build Setup & Targets
#------------------------------------------------------------------------------

file(GLOB SPECIFIC_SOURCES 
"${CMAKE_SOURCE_DIR}/src/m4/*.c"
)
list(APPEND SOURCES ${SPECIFIC_SOURCES})

include(${CMAKE_SOURCE_DIR}/cmake/common_build.cmake)

