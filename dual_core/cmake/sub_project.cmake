
add_custom_target(rm
    COMMAND true)

function(sub_project project_name)
    set(project_dir "${CMAKE_BINARY_DIR}/${project_name}")

    message(STATUS "sub_project ${project_name} ${project_dir}")
    execute_process(
        COMMAND mkdir -p ${project_dir}/build
        )
    execute_process(
        COMMAND ln -s ${CMAKE_SOURCE_DIR}/src/${project_name}/CMakeLists.txt ${project_dir}/
        )
    execute_process(WORKING_DIRECTORY ${project_dir}/build
        COMMAND cmake .. -DCPM_SHOW_HIERARCHY=TRUE -DTOPLEVEL_SRC_DIR=${CMAKE_SOURCE_DIR} -DTOPLEVEL_BIN_DIR=${PROJECT_BINARY_DIR}

        )
    add_custom_target(${project_name} ALL
        WORKING_DIRECTORY ${project_dir}/build
        COMMAND make -j8
        )

    if(NOT TARGET prepare)
        add_custom_target(prepare
            WORKING_DIRECTORY ${project_dir}/build
            COMMAND make prepare
            )
        add_custom_target(flash
            WORKING_DIRECTORY ${project_dir}/build
            COMMAND make flash
            )
        add_custom_target(update
            WORKING_DIRECTORY ${project_dir}/build
            COMMAND make update
            )
        
    endif(NOT TARGET prepare)
    add_dependencies(${project_name} prepare)
    add_dependencies(flash ${project_name})
    add_dependencies(update ${project_name})

    add_custom_target(flash_${project_name}
        WORKING_DIRECTORY ${project_dir}/build
        DEPENDS ${project_name}
        COMMAND make flash_${project_name}
        )

    add_custom_target(debug_${project_name}
        WORKING_DIRECTORY ${project_dir}/build
        DEPENDS ${project_name}
        COMMAND make debug
        )

    add_custom_target(clean_${project_name}
        WORKING_DIRECTORY ${project_dir}/build
        COMMAND make clean
        )
    add_dependencies(rm clean_${project_name})

endfunction()

