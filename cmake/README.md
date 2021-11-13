# cmake

## Configuration files for cmake build environment

env.cmake
Environment variables for CMakeGHDL

doxygen.cmake
Template for running doxygen - not yet usable

find_package.cmake
Overall find package to use these variables in other cmake files

## Add environment variables

Open env.cmake and create a new include directory:
set(MCC_SOURCES_MYSHAREDINCLUDE ${MCC_SOURCES_SHARED}/MySharedInclude)

Steps:
ghdl -a file.vhdl # analysis
ghdl -e ProjectName # elaborate design
ghdl -r ProjectName # run the design
--std=87, 93, 08