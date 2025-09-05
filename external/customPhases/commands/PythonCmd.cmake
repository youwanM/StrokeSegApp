# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: PythonCmd.cmake
#
# Description: This CMake command module defines the patch and installation
# commands for the Python external project. It leverages dedicated scripts
# to handle these specific phases, ensuring the Python environment is
# correctly configured after being downloaded.
#
# Main functional blocks:
# 1. Patch Command Definition: Constructs a command to run a script that
#    applies any necessary patches to the Python installation.
# 2. Install Command Definition: Defines the command to install the Python
#    files into the designated destination directory.

set(_EP Python)

###############################################################################
## DOWNLOAD COMMAND
###############################################################################



###############################################################################
## PATCH COMMAND
###############################################################################
set(${_EP}_PATCH_CMD  
    ${CMAKE_COMMAND}
    -DWORKING_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/Python
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/PythonPatch.cmake)


###############################################################################
## BUILD COMMAND
###############################################################################    



###############################################################################
## INSTALL COMMAND
###############################################################################    
set(${_EP}_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -DSOURCE_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/Python
    -DDESTINATION_DIR=${PYTHON_DEST_DIR}
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/PythonInstall.cmake)
