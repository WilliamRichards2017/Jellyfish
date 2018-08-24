# =================================
# jellyfish
#
# jellyfish/lib/CMakeLists.tx
# =================================

INCLUDE_DIRECTORIES(
  ${PROJECT_SOURCE_DIR}
  ${PROJECT_SOURCE_DIR}/include
  ${PROJECT_SOURCE_DIR}/include/jellyfish
  )

set(JELLYFISH_LIB_SOURCES
  allocators_mmap.cc
  err.cc
  generator_manager.cc
  int128.cc
  jsoncpp.cpp
  mer_dna.cc
  misc.cc
  rectangular_binary_matrix.cc
  storage.cc
  thread_exec.cc
  time.cc
  )

SET(JELLYFISH_LIB_LIB jellyfish_lib CACHE STRING "THE CORE LIBRARY") #cache jellyfish_core so you can use it to link later

add_library(${JELLYFISH_LIB_LIB} STATIC ${JELLYFISH_LIB_SOURCES})

#add_dependencies(${JELLYFISH_LIB_LIB} ${JELLYFISH_EXTERNAL_PROJECT})