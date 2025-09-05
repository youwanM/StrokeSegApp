# SPDX-License-Identifier: AGPL-3.0-or-later
# License details in LICENSE.md.
#
# Author: Florent LERAY
# Date: 2025-09-05
#
# Copyright (c) 2025, INRIA


# Fichier: PythonPatch.cmake
#
# Description: This script modifies Python's `.pth` files to enable site
# packages and add the application's core directory to the Python path. This
# is a critical step for a self-contained Python environment.
#
# Main functional blocks:
# 1. File Search: Searches for all files with the `._pth` extension.
# 2. Content Modification Loop: Iterates through each file, reads its content,
#    and performs two string replacements: un-commenting `import site` and
#    adding the `..\\StrokeSegCore` path.
# 3. File Rewriting: Writes the modified content back to the file if changes
#    were made.

# Script to iterate through files and modify their content.
# Defines the working directory to search for files.


# Searches for all files ending with '._pth'
file(GLOB_RECURSE _PTH_FILES "${WORKING_DIR}/*._pth")

# Iterates over each file found
foreach(_PTH_FILE ${_PTH_FILES})
    message(STATUS "Processing file: ${_PTH_FILE}")

    # Reads the content of the file
    file(READ "${_PTH_FILE}" FILE_CONTENT)

    string(REPLACE "#import site" "import site" NEW_CONTENT "${FILE_CONTENT}") # Replaces '#import site' with 'import site'
    string(REPLACE ".\n" ".\n..\\StrokeSegCore" NEW_CONTENT "${NEW_CONTENT}")  # Replaces '.' with '.' and '\\StrokeSegCore'
    
    # If the content was modified, the file is rewritten
    if(NOT "${NEW_CONTENT}" STREQUAL "${FILE_CONTENT}")
        message(STATUS "  - Found and replaced '#import site'.")
        file(WRITE "${_PTH_FILE}" "${NEW_CONTENT}")
    else()
        message(STATUS "  - '#import site' not found. No change made.")
    endif()
endforeach()
message(STATUS "Modification of ._pth files completed.")

