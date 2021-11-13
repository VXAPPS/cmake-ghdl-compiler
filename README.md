# cmake-ghdl-compiler
Compiler Definition for GHDL usage. Use VHDL projects with outside build and standard CMake configuration as known for other applications.

## Build
```bash
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE:STRING=Debug|Release ../cmake-ghdl-compiler
make -j`nproc`
```

## Dependencies
(https://github.com/ghdl/ghdl)[GHDL] and (https://github.com/gtkwave/gtkwave)[GtkWave] is required to use this example.


## Compiler Definition
Just use cmake/modules inside your project to compile and run VHDL projects with GHDL.

## Known Issues
Currently the ninja generator is not working. And the path is only valid for linux system.
