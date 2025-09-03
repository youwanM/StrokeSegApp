file(MAKE_DIRECTORY ${ONNX_MODELS_DEST_DIR})

###############################################################################
##  Models code blocs
###############################################################################
set(ONNX_MODELS_MONO "" CACHE FILEPATH "Model weight in ONNX format for the mono modal (T1) application.")
set(ONNX_MODELS_BI   "" CACHE FILEPATH "Model weight in ONNX format for the bi modal (T1+Flair) application.")

set(ONNX_MODELS_MONO_COPY_CMD "")
set(ONNX_MODELS_BI_COPY_CMD "")

### MONO MODEL
if(EXISTS "${ONNX_MODELS_MONO}")
    message(STATUS "Copying mono ONNX model from: ${ONNX_MODELS_MONO}")
    set(ONNX_MODELS_MONO_COPY_CMD
        ${CMAKE_COMMAND}
        -E
        copy
        ${ONNX_MODELS_MONO}
        ${ONNX_MODELS_DEST_DIR})
else()
    if("${ONNX_MODELS_MONO}" STREQUAL "")
	    message("Mono ONNX model path are not specified. Application will be generate without Mono-model.")
	else()
	    message(SEND_ERROR "Mono ONNX model path does not exist or is not a directory: ${ONNX_MODELS_MONO}")
        set(ONNX_MODELS_MONO "" CACHE FILEPATH "Model weight in ONNX format for the mono modal (T1) application." FORCE)	
	endif()
endif()

### Bi MODEL
if(EXISTS ${ONNX_MODELS_BI})
    message(STATUS "Copying bi ONNX model from: ${ONNX_MODELS_BI}")
    set(ONNX_MODELS_BI_COPY_CMD 
        ${CMAKE_COMMAND}
        -E
        copy
        ${ONNX_MODELS_BI}
        ${ONNX_MODELS_DEST_DIR})
else()
    if("${ONNX_MODELS_MONO}" STREQUAL "")
	    message("Bi ONNX model path are not specified. Application will be generate without Mono-model.")
	else()
	    message(SEND_ERROR "Bi ONNX model path does not exist or is not a directory: ${ONNX_MODELS_MONO}")
        set(ONNX_MODELS_BI   "" CACHE FILEPATH "Model weight in ONNX format for the bi modal (T1+Flair) application." FORCE)	
	endif()
endif()



###############################################################################
##  Atlas code blocs
###############################################################################
file(MAKE_DIRECTORY ${ATLAS_DEST_DIR})
set(Reference_T1_DOWNLOAD_CMD
    ${CMAKE_COMMAND}
    -DURL=${atlas_REF_T1_URL}
    -DDESTINATION=${ATLAS_DEST_DIR}/Reference_T1.nrrd
    -P
    ${CMAKE_SOURCE_DIR}/cmake/DownloadFile.cmake)

set(BRAIN_MASK_DOWNLOAD_CMD
    ${CMAKE_COMMAND}
    -DURL=${atlas_BRAIN_MASK_URL}
    -DDESTINATION=${ATLAS_DEST_DIR}/BrainMask.nrrd
    -P
    ${CMAKE_SOURCE_DIR}/cmake/DownloadFile.cmake)



###############################################################################
##  Create PopulateData targets
###############################################################################
add_custom_target(PopulateDataAtlas
    ALL
    COMMENT "Populating data directories with Atlas and Mask"
    COMMAND ${Reference_T1_DOWNLOAD_CMD}
    COMMAND ${BRAIN_MASK_DOWNLOAD_CMD}
)

add_custom_target(PopulateDataModels
    ALL
    COMMENT "Populating data directories with Models"
    COMMAND ${ONNX_MODELS_MONO_COPY_CMD}
    COMMAND ${ONNX_MODELS_BI_COPY_CMD}
)

message(STATUS "")