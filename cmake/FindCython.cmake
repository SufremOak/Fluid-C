find_package(Python3 COMPONENTS Interpreter Development REQUIRED)

if(NOT CYTHON_EXECUTABLE)
    find_program(CYTHON_EXECUTABLE NAMES cython3 cython)
endif()

if(NOT CYTHON_EXECUTABLE)
    message(FATAL_ERROR "Cython executable not found")
endif()

set(Cython_EXECUTABLE ${CYTHON_EXECUTABLE})
set(Cython_FOUND TRUE)