# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: StrokeSegCoreInstall.cmake
#
# Description: This script handles the installation of the compiled
# StrokeSegCore binaries. It copies the entire build output directory to the
# final installation location.
#
# Main functional blocks:
# 1. Binary Copying: Uses a `copy_directory_if_different` command to perform
#    a recursive copy of the compiled binaries to their destination.

# SOURCE_DIR
# DESTINATION_DIR
    
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    copy_directory_if_different
    ${SOURCE_DIR}
    ${DESTINATION_DIR})
