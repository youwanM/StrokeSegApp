set(_EP embed_python)

###############################################################################
## DOWNLOAD COMMAND
###############################################################################



###############################################################################
## PATCH COMMAND
###############################################################################
set(${_EP}_PATCH_CMD  
    ${CMAKE_COMMAND}
    -DWORKING_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/embed_python
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/pythonPatch.cmake)


###############################################################################
## INSTALL COMMAND
###############################################################################    
set(${_EP}_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -E
    copy_directory_if_different
    ${CMAKE_BINARY_DIR}/ExtProjs/source/embed_python
    ${PYTHON_DEST_DIR})
