    
set(embed_python_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -E
    copy_directory_if_different
    ${CMAKE_BINARY_DIR}/ExtProjs/source/embed_python    
    ${PYTHON_DEST_DIR})
