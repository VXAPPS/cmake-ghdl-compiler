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

## Known Issues
Currently the ninja generator is not working.
