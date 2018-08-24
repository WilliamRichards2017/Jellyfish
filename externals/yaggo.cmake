#  For more information, please see: http://software.sci.utah.edu
# 
#  The MIT License
# 
#  Copyright (c) 2015 Scientific Computing and Imaging Institute,
#  University of Utah.
# 
#  
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:
# 
#  The above copyright notice and this permission notice shall be included
#  in all copies or substantial portions of the Software. 
# 
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
#  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.

# Setting up external library yaggo, we don't build it because we only need the include directories

SET_PROPERTY(DIRECTORY PROPERTY "EP_BASE" ${ep_base})

SET(YAGGO_PROJECT yaggo_project CACHE INTERNAL "yaggo project name")
SET(YAGGO_DIR ${CMAKE_BINARY_DIR}/externals/yaggo CACHE INTERNAL "yaggo project directory")
SET(YAGGO_LIB)
ExternalProject_Add(${YAGGO_PROJECT}
	GIT_REPOSITORY https://github.com/gmarcais/yaggo.git
	GIT_TAG master #lock in the commit id so we don't this doesn't break in the future
	CONFIGURE_COMMAND ""
	BUILD_COMMAND "make"
	INSTALL_COMMAND ""
	UPDATE_COMMAND ""
	BUILD_IN_SOURCE 1
	PREFIX ${YAGGO_DIR}
    LOG_DOWNLOAD 0
	LOG_UPDATE 0
    LOG_CONFIGURE 0
    LOG_BUILD 0
    LOG_TEST 0
    LOG_INSTALL 0
)

ExternalProject_Get_Property(${YAGGO_PROJECT} BINARY_DIR)

SET(YAGGO_EXE ${BINARY_DIR}/yaggo CACHE INTERNAL "yaggo Lib")
