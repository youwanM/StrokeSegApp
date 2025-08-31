
set(PYTHON_FOLDER "${PYTHON_DEST_DIR}")

file(TO_NATIVE_PATH ${PYTHON_DEST_DIR} PYTHON_NATIVE_FOLDER)
set(NEW_PATH "${PYTHON_NATIVE_FOLDER}\\;${PYTHON_NATIVE_FOLDER}\\Scripts")

if(${STROKESEG_GPU_CUDA})
    set(ONNX_RUNTIME "onnxruntime-gpu[cudnn]")
else()
    set(ONNX_RUNTIME "onnxruntime")
endif()

# Define the main setup target early
add_custom_target(setup_environment
    ALL # This target will run by default when you build the project
    COMMENT "Setting up Python environment and dependencies via ExternalProject"
    WORKING_DIRECTORY ${PYTHON_FOLDER}
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe ./get-pip.py
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install --upgrade pip setuptools wheel
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install tkinter-embed  --target .
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install ${ONNX_RUNTIME}
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install nibabel
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install scipy
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install tkhtmlview
    COMMAND  ${CMAKE_COMMAND} -E env PATH="${NEW_PATH}" ./python.exe -m pip install markdown
)

# Now, add dependencies to setup_environment
add_dependencies(setup_environment  
    ${ALL_DEPENDENCIES}
)
