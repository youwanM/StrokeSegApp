# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.txt.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: StrokeSegCoreBuild.cmake
#
# Description: This script prepares the StrokeSegCore source for compilation.
# It copies the source files from the Git repository clone to the build
# directory and then removes version control-related files to ensure a clean
# build environment.
#
# Main functional blocks:
# 1. Source Copying: Copies the source directory to the build directory.
# 2. Cleanup: Removes the `.git` directory and `.gitignore` file from the
#    build directory.

# SOURCE_DIR
# DESTINATION_DIR
    
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    copy_directory_if_different
    ${SOURCE_DIR}
    ${DESTINATION_DIR})
    
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    rm
    -rf
    ${DESTINATION_DIR}/.git/)
    
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    rm
    -rf
    ${DESTINATION_DIR}/.gitignore)
