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