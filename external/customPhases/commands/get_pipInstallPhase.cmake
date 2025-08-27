
set(get_pip_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -E
    copy_if_different
    ${CMAKE_BINARY_DIR}/ExtProjs/source/get_pip/get-pip.py
    ${PYTHON_DEST_DIR}/) 
