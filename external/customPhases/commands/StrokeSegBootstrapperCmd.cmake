set(_EP StrokeSegBootStrapper)

###############################################################################
## DOWNLOAD COMMAND
###############################################################################



###############################################################################
## PATCH COMMAND
###############################################################################
set(StrokeSegBootStrapper_PATCH_CMD  
    ${CMAKE_COMMAND}
    -DWORKING_DIR=${CMAKE_CURRENT_SOURCE_DIR}/BootStrap
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/StrokeSegBootStrapperPatch.cmake)


###############################################################################
## INSTALL COMMAND
###############################################################################    
