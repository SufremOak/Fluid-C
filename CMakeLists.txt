cmake_minimum_required(VERSION 3.10)

# Set the project name
project(FluidCyPlusPlus)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Include directories
include_directories(${PROJECT_SOURCE_DIR}/lib)

# Add the custom CMake module path
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake")

# Find Python and Cython
find_package(Python3 COMPONENTS Interpreter Development REQUIRED)
find_package(Cython REQUIRED)

# Add the Cython module
add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/LibCompiler.cpp
    COMMAND ${Cython_EXECUTABLE} -3 --cplus -o ${CMAKE_CURRENT_BINARY_DIR}/LibCompiler.cpp ${CMAKE_SOURCE_DIR}/src/LibCompiler.pyx
    DEPENDS ${CMAKE_SOURCE_DIR}/src/LibCompiler.pyx
    COMMENT "Running Cython on LibCompiler.pyx"
)

add_library(LibCompiler MODULE ${CMAKE_CURRENT_BINARY_DIR}/LibCompiler.cpp)
target_include_directories(LibCompiler PRIVATE ${Python3_INCLUDE_DIRS})
target_link_libraries(LibCompiler ${Python3_LIBRARIES})

# Install the header file
install(FILES ${PROJECT_SOURCE_DIR}/lib/libfluidcy++.hpp DESTINATION ${CMAKE_INSTALL_PREFIX}/include)

# Install the Cython module
install(TARGETS LibCompiler DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/python${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}/site-packages)