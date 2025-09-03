set(_EP Anima)

# Define the list of Anima executables to copy
set(ANIMA_EXECUTABLES
    animaApplyTransformSerie
    animaConvertImage
    animaCreateImage
    animaDenseSVFBMRegistration
    animaMaskImage
    animaN4BiasCorrection
    animaPyramidalBMRegistration
    animaTransformSerieXmlGenerator
)

list(JOIN ANIMA_EXECUTABLES "," ANIMA_EXECUTABLES)

###############################################################################
## DOWNLOAD COMMAND
###############################################################################



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
    -DANIMA_UNPACK_DIR=${CMAKE_BINARY_DIR}/ExtProjs/source/anima
    -DANIMA_DEST_DIR=${ANIMA_DEST_DIR}
    -DANIMA_EXECUTABLES=${ANIMA_EXECUTABLES}
    -P
    ${CMAKE_CURRENT_SOURCE_DIR}/customPhases/scripts/animaInstall.cmake)
