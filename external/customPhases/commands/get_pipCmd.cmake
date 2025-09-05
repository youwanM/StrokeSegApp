# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: get_pipCmd.cmake
#
# Description: This CMake command module defines the download and install
# commands for the `get-pip.py` script. It ensures that the script is
# securely fetched using a utility function and then correctly placed
# within the Python installation directory.
#
# Main functional blocks:
# 1. Download Command Definition: Constructs a command to download the
#    `get-pip.py` script and verify its integrity using its SHA256 hash.
# 2. Install Command Definition: Defines the command to copy the downloaded
#    script to the correct Python destination.

set(_EP get_pip)

###############################################################################
## DOWNLOAD COMMAND
###############################################################################
set(${_EP}_DOWNLOAD_CMD
    ${CMAKE_COMMAND}
    -DURL=${get_pip_URL}
    -DDESTINATION=${CMAKE_BINARY_DIR}/ExtProjs/source/get_pip/get-pip.py
    -DSHA256=${get_pip_HASH}
    -P
    ${CMAKE_SOURCE_DIR}/cmake/DownloadFile.cmake)


###############################################################################
## PATCH COMMAND
###############################################################################



###############################################################################
## BUILD COMMAND
###############################################################################    



###############################################################################
## INSTALL COMMAND
###############################################################################
set(${_EP}_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -DSOURCE_FILE=${CMAKE_BINARY_DIR}/ExtProjs/source/get_pip/get-pip.py
    -DDESTINATION_DIR=${PYTHON_DEST_DIR}
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/get_pipInstall.cmake)
