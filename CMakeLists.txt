# =================================
# jellyfish
#
# jellyfish/CMakeLists.tx
# =================================

#Set up min CMake version
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

#Set project name
PROJECT(jellyfish)

SET(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_FLAGS " -pthread ")

IF("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
  MESSAGE(SEND_ERROR "In-source builds are not allowed, please build this in the bin directory!")
ENDIF("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")

execute_process(COMMAND 'autoreconf -i; ./configure --enable-python-binding'
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  )

INCLUDE_DIRECTORIES(include/jellyfish)

ADD_SUBDIRECTORY(externals)
ADD_SUBDIRECTORY(lib)
ADD_SUBDIRECTORY(jellyfish)
ADD_SUBDIRECTORY(sub_commands)
