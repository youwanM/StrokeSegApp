# Fichier: StrokeSegBootstrapperCmd.cmake
#
# Description: This CMake command module focuses on the patch phase for the
# StrokeSegBootstrapper external project. It defines a command to run a
# custom script that applies modifications to the bootstrapper's source code
# before it is compiled.
#
# Main functional blocks:
# 1. Patch Command Definition: Constructs a command that executes a specific
#    patching script located in the `customPhases/scripts` directory.

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
## BUILD COMMAND
###############################################################################    



###############################################################################
## INSTALL COMMAND
###############################################################################    
