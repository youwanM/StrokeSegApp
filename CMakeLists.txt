# Set the minimum required CMake version
cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

# Project name
project(StrokSegApp VERSION 1.0.0 LANGUAGES CXX)

###############################################################################
## User options
###############################################################################
set(ONNX_MODELS_MONO "" CACHE FILEPATH "Model weight in ONNX format for the mono modal (T1) application.")
set(ONNX_MODELS_BI   "" CACHE FILEPATH "Model weight in ONNX format for the bi modal (T1+Flair) application.")
option(GPU_CUDA "Package with cuda support" ON)

###############################################################################
## URLs and Hashs bloc
###############################################################################
set(Python_URL           "https://www.python.org/ftp/python/3.13.4/python-3.13.4-embed-amd64.zip")
set(get_pip_URL          "https://bootstrap.pypa.io/get-pip.py")
set(Anima_URL            "https://github.com/Inria-Empenn/Anima-Public/releases/download/v4.2/Anima-Windows-4.2.zip")
set(StrokeSegCore_URL    "git@github.com:Empenn-Stroke/StrokeSegLab.git")

set(atlas_REF_T1_URL     "https://github.com/Inria-Empenn/Anima-Scripts-Data-Public/raw/refs/heads/master/icc_atlas/Reference_T1.nrrd")
set(atlas_BRAIN_MASK_URL "https://github.com/Inria-Empenn/Anima-Scripts-Data-Public/raw/refs/heads/master/icc_atlas/BrainMask.nrrd")

set(Python_HASH          "514ca14ec356ecb7749a7c0a1ef1eac9fd9c67d57af4812cb1f0822b0d3a85e8")
set(get_pip_HASH         "b4c0f2a23c8c26893d5b9bdcd3ef8e6d3915d90f84acccafa3e7829bd0bf4414")
set(Anima_HASH           "42ff5cca0537b9fb3cd43fe83ffb7c042926afd9e203f9a739a27ac969384ed6")


###############################################################################
## Define paths for installed components relative to the EXTERNAL_INSTALL_ROOT
###############################################################################
set(PYTHON_DEST_DIR          "${CMAKE_BINARY_DIR}/bin/Program/Python")
set(ANIMA_DEST_DIR           "${CMAKE_BINARY_DIR}/bin/Program/Anima")
set(STROKE_SEG_CORE_DEST_DIR "${CMAKE_BINARY_DIR}/bin/Program/StrokeSegCore")
set(STROKE_SEG_BOOT_DEST_DIR "${CMAKE_BINARY_DIR}/bin/Program/StrokeSegCore")
set(ONNX_MODELS_DEST_DIR     "${CMAKE_BINARY_DIR}/bin/AppData/Models")
set(ATLAS_DEST_DIR           "${CMAKE_BINARY_DIR}/bin/AppData/Atlas")


###############################################################################
## Targets
###############################################################################

## External Targets (python, pip, anima, StrokeSegLab, ...)
add_subdirectory(external)

## Core Setup Target
include(setup_env.cmake)

## Populate Data Target
include(populateData.cmake)

## Create install step for bundelling and package it after 
include(cmake/package/packaging.cmake)