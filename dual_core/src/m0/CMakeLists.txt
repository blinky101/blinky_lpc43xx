cmake_minimum_required(VERSION 3.5.0 FATAL_ERROR)

set(CMAKE_TOOLCHAIN_FILE
    ${TOPLEVEL_SRC_DIR}/cmake/toolchain-gcc-arm-embedded.cmake)
project(m0)

#------------------------------------------------------------------------------
# Target Specifig Build Settings
#------------------------------------------------------------------------------

# target specific
set(EXE_NAME                m0)
set(FLASH_ADDR              0x1B000000)
set(DEBUG_BREAKPOINT_LIMIT  2)
set(DEBUG_WATCHPOINT_LIMIT  1)

set(MCU_PLATFORM            43xx_m0)

set(TARGET_C_FLAGS  "-DCORE_M0 -mcpu=cortex-m0")
set(TARGET_L_FLAGS  "-mcpu=cortex-m0")


#------------------------------------------------------------------------------
# Common Settings & CPM Modules
#------------------------------------------------------------------------------

include(${TOPLEVEL_SRC_DIR}/cmake/common_settings.cmake)


#------------------------------------------------------------------------------
# Target Specific CPM Modules
#------------------------------------------------------------------------------

CPM_AddModule("startup_lpc43xx_m0"
    GIT_REPOSITORY "https://github.com/JitterCompany/startup_lpc43xx_m0.git"
    GIT_TAG "1.1")

CPM_AddModule("chip_lpc43xx_m0"
    GIT_REPOSITORY "https://github.com/JitterCompany/chip_lpc43xx_m0.git"
    GIT_TAG "3.3.0")

CPM_Finish()


#------------------------------------------------------------------------------
# Build Setup & Targets
#------------------------------------------------------------------------------

file(GLOB SPECIFIC_SOURCES 
"${CMAKE_SOURCE_DIR}/src/m0/*.c"
)
list(APPEND SOURCES ${SPECIFIC_SOURCES})

include(${CMAKE_SOURCE_DIR}/cmake/common_build.cmake)

