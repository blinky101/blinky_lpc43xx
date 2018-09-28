#-----------------------------------------------------------------------
# Setup source
#-----------------------------------------------------------------------

get_property(startup_linker GLOBAL PROPERTY startup_linker)
set(LINKER_FILES "-L \"${CMAKE_SOURCE_DIR}/src/\" -T ${startup_linker}")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${L_FLAGS} \
${LINKER_FILES}")


file(GLOB COMMON_SOURCES 
"${CMAKE_SOURCE_DIR}/src/*.c"
)

include_directories("${CMAKE_SOURCE_DIR}/src")
set(SOURCES "${SOURCES};${COMMON_SOURCES}")

#-----------------------------------------------------------------------
# Setup executable
#-----------------------------------------------------------------------

if(NOT TARGET prepare)
    add_custom_target(prepare

        # empty flash file
        COMMAND echo "Prepare empty flash file"
        COMMAND > "${FLASH_FILE}"
        )
endif(NOT TARGET prepare)

if(NOT TARGET bin)
    add_custom_target(bin ALL
        )
endif(NOT TARGET bin)

add_executable(${EXE_NAME} ${SOURCES})
target_link_libraries(${EXE_NAME} ${CPM_LIBRARIES})
target_link_libraries(${EXE_NAME} ${SYSTEM_LIBRARIES})

add_custom_target(${EXE_NAME}.bin
    DEPENDS ${EXE_NAME}

    COMMAND echo "building ${EXE_NAME}.bin"
    COMMAND ${CMAKE_OBJCOPY} -O binary ${EXE_NAME} ${EXE_NAME}.bin

    # append flash file
    COMMAND echo "${EXE_PATH} ${FLASH_ADDR} ${FLASH_CFG}" >> "${FLASH_FILE}"
    )

add_dependencies(bin ${EXE_NAME}.bin)

