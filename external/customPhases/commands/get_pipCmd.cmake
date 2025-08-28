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
## INSTALL COMMAND
###############################################################################
set(${_EP}_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -E
    copy_if_different
    ${CMAKE_BINARY_DIR}/ExtProjs/source/get_pip/get-pip.py
    ${PYTHON_DEST_DIR}/) 
