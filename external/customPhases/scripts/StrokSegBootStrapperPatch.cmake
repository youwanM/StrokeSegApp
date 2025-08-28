if(NOT EXISTS ./resources/
  file(COPY ../resources/ .)
  file(COPY ./resources/resource.h .)
  file(COPY ./resources/BootStrapper.rc .)
endif()