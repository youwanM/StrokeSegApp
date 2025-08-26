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
    string(REPLACE ".\n" ".\n..\\SegStrokCore" NEW_CONTENT "${NEW_CONTENT}")  # Replaces '.' with '.' and '\\SegStrokCore'
	
    # If the content was modified, the file is rewritten
    if(NOT "${NEW_CONTENT}" STREQUAL "${FILE_CONTENT}")
        message(STATUS "  - Found and replaced '#import site'.")
        file(WRITE "${_PTH_FILE}" "${NEW_CONTENT}")
    else()
        message(STATUS "  - '#import site' not found. No change made.")
    endif()
endforeach()
message(STATUS "Modification of ._pth files completed.")
