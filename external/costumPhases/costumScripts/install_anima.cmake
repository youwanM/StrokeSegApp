
file(MAKE_DIRECTORY "${ANIMA_DEST_DIR}")


string(REPLACE "," ";" ANIMA_EXECUTABLES ${ANIMA_EXECUTABLES})
message("${ANIMA_EXECUTABLES}")
foreach(executable ${ANIMA_EXECUTABLES})
    # Use glob for potential extensions like .exe
    file(GLOB actual_source_file "${ANIMA_UNPACK_DIR}/${executable}*")
    if(NOT actual_source_file)
        message(WARNING "Anima executable '${executable}' not found at '${ANIMA_UNPACK_DIR}/${executable}*'. Skipping copy.")
        continue()
    endif()
    message(STATUS "Copying ${actual_source_file} to ${ANIMA_DEST_DIR}/")
    file(COPY "${actual_source_file}" DESTINATION "${ANIMA_DEST_DIR}/")
endforeach()
