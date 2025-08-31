#SOURCE_FILE
#DESTINATION_DIR 
	
execute_process(COMMAND
    ${CMAKE_COMMAND}
    -E
    copy_if_different
    ${SOURCE_FILE}
    ${DESTINATION_DIR})