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
## INSTALL COMMAND
###############################################################################    
set(${_EP}_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -DSOURCE_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/Python
    -DDESTINATION_DIR=${PYTHON_DEST_DIR}
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/PythonInstall.cmake)