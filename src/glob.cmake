if(LINUX)
  file(GLOB OUTER_SOURCE
    ${CMAKE_CURRENT_LIST_DIR}/*.cpp
  )
  file(GLOB OUTER_HEADER
    ${CMAKE_CURRENT_LIST_DIR}/../include/global/*.h 
  )
else()
  set(OUTER_SOURCE 
    ${CMAKE_CURRENT_LIST_DIR}/dconfig.cpp 
    ${CMAKE_CURRENT_LIST_DIR}/dsgapplication.cpp 
    ${CMAKE_CURRENT_LIST_DIR}/dsysinfo.cpp 
    ${CMAKE_CURRENT_LIST_DIR}/dsecurestring.cpp 
    ${CMAKE_CURRENT_LIST_DIR}/ddesktopentry.cpp 
    ${CMAKE_CURRENT_LIST_DIR}/dtkcore_global.cpp
  )
  set(OUTER_HEADER 
    ${CMAKE_CURRENT_LIST_DIR}/../include/global/dtkcore_global.h 
    ${CMAKE_CURRENT_LIST_DIR}/../include/dconfig.h 
    ${CMAKE_CURRENT_LIST_DIR}/../include/dsgapplication.h 
    ${CMAKE_CURRENT_LIST_DIR}/../include/dsysinfo.h 
    ${CMAKE_CURRENT_LIST_DIR}/../include/dsecurestring.h 
    ${CMAKE_CURRENT_LIST_DIR}/../include/ddesktopentry.h
  )
endif()
set(glob_SRC
  ${OUTER_HEADER}
  ${OUTER_SOURCE}
)