# cmake-ghdl-compiler
Compiler Definition for [GHDL](https://github.com/ghdl/ghdl) usage. Use VHDL projects with outside build and standard CMake configuration as known for other applications.

## Build
```bash
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE:STRING=Debug|Release ../cmake-ghdl-compiler
make -j`nproc`
```

## Dependencies
[GHDL](https://github.com/ghdl/ghdl) and [GtkWave](https://github.com/gtkwave/gtkwave) is required to use this example.

## Compiler Definition
Just use cmake/modules inside your project to compile and run VHDL projects with [GHDL](https://github.com/ghdl/ghdl).

## Simulation Targets
Create a simulation target for testbench. Example:
```cmake
add_custom_target(sim_example COMMAND ${CMAKE_GHDL_COMPILER} -r ${PROJECT_NAME} --stop-time=1000ns --disp-time --wave=${PROJECT_NAME}.ghw WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
```

Display the wave output from simulation of testbench. Example:
```cmake
add_custom_target(sim_example_wave COMMAND ${GTKWAVE} ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.ghw DEPENDS simulation WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
```

Run a custom target
```bash
make sim_example|sim_example_wave
```

## Known Issues
Currently the ninja generator is not working.
