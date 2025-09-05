# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: get_pipInstall.cmake
#
# Description: This script is an installation utility for the `get-pip.py`
# file. It copies the downloaded script from its source location to the
# specified destination directory, ensuring the file is up-to-date.
#
# Main functional blocks:
# 1. File Copying: Executes a `copy_if_different` command to transfer the
#    `get-pip.py` script.

# SOURCE_FILE
# DESTINATION_DIR 
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    copy_if_different
    ${SOURCE_FILE}
    ${DESTINATION_DIR})
