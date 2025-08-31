set(_EP StrokeSegCore)

###############################################################################
## DOWNLOAD COMMAND
###############################################################################



###############################################################################
## PATCH COMMAND
###############################################################################
#set(${_EP}_PATCH_CMD  
#    ${CMAKE_COMMAND}
#    -DCore_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/StrokeSegCore
#    -P
#    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/StrokeSegCorePatch.cmake)


###############################################################################
## BUILD COMMAND
###############################################################################    
set(${_EP}_BUILD_CMD  
    ${CMAKE_COMMAND}
    -DSOURCE_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/StrokeSegCore
    -DDESTINATION_DIR=${CMAKE_BINARY_DIR}/ExtProjs/build/StrokeSegCore
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/StrokeSegCoreBuild.cmake)


###############################################################################
## INSTALL COMMAND
###############################################################################    
set(${_EP}_INSTALL_CMD  
    ${CMAKE_COMMAND}
    -DSOURCE_DIR=${CMAKE_BINARY_DIR}/ExtProjs/build/StrokeSegCore
    -DDESTINATION_DIR=${STROKE_SEG_CORE_DEST_DIR}
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/StrokeSegCoreInstall.cmake)
