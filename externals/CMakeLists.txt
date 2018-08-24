include(ExternalProject)

SET( JELLYFISH_DEPENDENCIES )

include(yaggo.cmake)
LIST(APPEND JELLYFISH_DEPENDENCIES ${YAGGO_PROJECT})

SET(JELLYFISH_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/external CACHE INTERNAL "" FORCE)

SET(JELLYFISH_EXTERNAL_PROJECT_DIR ${CMAKE_BINARY_DIR}/externals/jellyfish_external_project CACHE INTERNAL "external project directory")
SET(JELLYFISH_EXTERNAL_PROJECT jellyfish_external_project CACHE INTERNAL "all jellyfish external projects")
ExternalProject_Add(${JELLYFISH_EXTERNAL_PROJECT}
    DEPENDS ${JELLYFISH_DEPENDENCIES}
    DOWNLOAD_COMMAND ""
	SOURCE_DIR ${JELLYFISH_SOURCE_DIR}
	BINARY_DIR ${JELLYFISH_EXTERNAL_PROJECT_DIR}/bin
	INSTALL_COMMAND ""
    UPDATE_COMMAND ""
	CMAKE_CACHE_ARGS
        -DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER}
        -DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER}
)

set(YAGGO_SOURCES
  ${PROJECT_SOURCE_DIR}/sub_commands/count_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/info_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/cite_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/stats_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/query_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/mem_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/histo_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/merge_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/dump_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/sub_commands/bc_main_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/jellyfish/fastq2sam_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/jellyfish/generate_sequence_cmdline.yaggo
  ${PROJECT_SOURCE_DIR}/unit_tests/test_main_cmdline.yaggo
)


foreach(yaggo_path ${YAGGO_SOURCES})
	add_custom_command(TARGET ${JELLYFISH_EXTERNAL_PROJECT} POST_BUILD
        COMMAND ${YAGGO_EXE} ${yaggo_path}
        COMMENT "Running CMD: ${YAGGO_EXE} ${yaggo_path}"
    )
endforeach()

if (NOT EXISTS ${PROJECT_SOURCE_DIR}/config.h)
  add_custom_command(TARGET ${JELLYFISH_EXTERNAL_PROJECT} POST_BUILD
        COMMAND configure --enable-python-binding
		WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
        COMMENT "executing config script"
    )
endif()