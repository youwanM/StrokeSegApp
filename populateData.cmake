file(MAKE_DIRECTORY ${ONNX_MODELS_DEST_DIR})

# Déclaration des variables de commande par défaut
set(ONNX_MODELS_MONO_COPY_CMD "")
set(ONNX_MODELS_BI_COPY_CMD "")

# if ONN_MODELS_MONO is set, copy the mono model and Check if the file exists
if(EXISTS "${ONNX_MODELS_MONO}")
    message(STATUS "Copying mono ONNX model from: ${ONNX_MODELS_MONO}")
    # Use execute_process with CMAKE_COMMAND -E copy
    set(ONNX_MODELS_MONO_COPY_CMD
        ${CMAKE_COMMAND}
        -E
        copy
        ${ONNX_MODELS_MONO}
        ${ONNX_MODELS_DEST_DIR})
else()
    set(ONNX_MODELS_MONO "" CACHE FILEPATH "Model weight in ONNX format for the mono modal (T1) application." FORCE)
    message(SEND_ERROR "Mono ONNX model path does not exist or is not a directory: ${ONNX_MODELS_MONO}")
endif()

# if ONN_MODELS_BI is set, copy the bi model and Check if the directory and file exist
if(EXISTS ${ONNX_MODELS_BI})
    message(STATUS "Copying bi ONNX model from: ${ONNX_MODELS_BI}")
    # Use execute_process with CMAKE_COMMAND -E copy
    set(ONNX_MODELS_BI_COPY_CMD 
        ${CMAKE_COMMAND}
        -E
        copy
        ${ONNX_MODELS_BI}
        ${ONNX_MODELS_DEST_DIR})
else()
    set(ONNX_MODELS_BI   "" CACHE FILEPATH "Model weight in ONNX format for the bi modal (T1+Flair) application." FORCE)
    message(SEND_ERROR "Bi ONNX model path does not exist or is not a directory: ${ONNX_MODELS_BI}")
endif()

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

add_custom_target(PopulateData
    ALL
    COMMENT "Populating data directories"
    COMMAND ${Reference_T1_DOWNLOAD_CMD}
    COMMAND ${BRAIN_MASK_DOWNLOAD_CMD}
    COMMAND ${ONNX_MODELS_MONO_COPY_CMD}
    COMMAND ${ONNX_MODELS_BI_COPY_CMD}
)

