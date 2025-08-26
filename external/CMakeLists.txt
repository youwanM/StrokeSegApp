include(ExternalProject)

#############################################################################
set(EP_BASE_PATH ${CMAKE_BINARY_DIR}/ExtProjs)

if(CMAKE_EXTRA_GENERATOR)
  set(gen "${CMAKE_EXTRA_GENERATOR} -G ${CMAKE_GENERATOR}")
else()
  set(gen "${CMAKE_GENERATOR}")
endif()

# Iterate over each found custumPhase
file(GLOB custumPhases "./costumPhases/*.cmake")
foreach(custumPhase ${custumPhases})
    include(${custumPhase})
endforeach()
#############################################################################

# Iterate over each found module
file(GLOB modules "*.cmake")
foreach(module ${modules})    
    get_filename_component(ep ${module} NAME_WE) # Get the file name without the extension
    message(STATUS "Including module: ${ep}")   
    include(${module}) # Include the CMake module    
    list(APPEND ALL_DEPENDENCIES ${ep})
endforeach()

set(ALL_DEPENDENCIES ${ALL_DEPENDENCIES} PARENT_SCOPE)
