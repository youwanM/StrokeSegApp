# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.txt.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Description: This CMake command module defines the build and install phases
# for the main StrokeSegCore project. It acts as a bridge, calling dedicated
# scripts to handle the complex logic of compiling the source code and
# installing the resulting binaries.
#
# Main functional blocks:
# 1. Build Command Definition: Constructs a command to execute the
#    `StrokeSegCoreBuild.cmake` script, which manages the compilation process.
# 2. Install Command Definition: Defines the command to run the
#    `StrokeSegCoreInstall.cmake` script, responsible for copying the compiled
#    binaries to the installation directory.

set(_EP StrokeSegCore)

###############################################################################
## DOWNLOAD COMMAND
###############################################################################



###############################################################################
## PATCH COMMAND
###############################################################################



###############################################################################
## BUILD COMMAND
###############################################################################    
set(${_EP}_BUILD_CMD  
    ${CMAKE_COMMAND}
    -DSOURCE_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/StrokeSegCore
    -DDESTINATION_DIR=${CMAKE_BINARY_DIR}/ExtProjs/build/StrokeSegCore
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/StrokeSegCoreBuild.cmake)


###############################################################################
## INSTALL COMMAND
###############################################################################    
set(${_EP}_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -DSOURCE_DIR=${CMAKE_BINARY_DIR}/ExtProjs/build/StrokeSegCore
    -DDESTINATION_DIR=${STROKE_SEG_CORE_DEST_DIR}
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/StrokeSegCoreInstall.cmake)

