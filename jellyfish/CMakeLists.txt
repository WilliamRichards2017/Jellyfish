# =================================
# jellyfish
#
# jellyfish/jellyfish/CMakeLists.tx
# =================================

INCLUDE_DIRECTORIES(
  ${PROJECT_SOURCE_DIR}
  ${PROJECT_SOURCE_DIR}/include
  ${PROJECT_SOURCE_DIR}/include/jellyfish
  )

set(JELLYFISH_SOURCES
  mersenne.cpp
  backtrace.cc
  dbg.cc
  fastq2sam.cc
  generate_sequence.cc
  merge_files.cc
  )

set(JELLYFISH_MODIFIED_SOURCES
  mersenne.cpp
  backtrace.cc
  dbg.cc
  fastq2sam.cc
  generate_sequence.cc
  modified_merge_files.cc
)

##add_executable(jellyfish
##	${JELLYFISH_SOURCES}
##)

##target_link_libraries(jellyfish
##	${JELLYFISH_LIB_LIB}
##)


add_executable(jellyfishModified
	${JELLYFISH_MODIFIED_SOURCES}
)

target_link_libraries(jellyfishModified
	${JELLYFISH_LIB_LIB}
)


SET(JELLYFISH_CORE_LIB jellyfish_core CACHE STRING "THE CORE LIBRARY") #cache jellyfish_core so you can use it to link later

add_library(${JELLYFISH_CORE_LIB} STATIC ${JELLYFISH_SOURCES})

TARGET_LINK_LIBRARIES(${JELLYFISH_CORE_LIB}
  ${JELLYFISH_LIB_LIB}
)

add_dependencies(${JELLYFISH_LIB_LIB} ${JELLYFISH_EXTERNAL_PROJECT})
