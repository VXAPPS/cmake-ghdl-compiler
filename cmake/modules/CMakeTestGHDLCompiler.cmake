#
# Copyright (c) 2021 Florian Becker <fb@vxapps.com> (VX APPS).
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice, this
#    list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
#    this list of conditions and the following disclaimer in the documentation
#    and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

if(CMAKE_GHDL_COMPILER_FORCED)
  # The compiler configuration was forced by the user.
  # Assume the user has configured all compiler information.
  set(CMAKE_GHDL_COMPILER_WORKS TRUE)
  return()
endif()

include(CMakeTestCompilerCommon)

# This file is used by EnableLanguage in cmGlobalGenerator to
# determine that the selected GHDL compiler can actually compile
# and link the most basic of programs.   If not, a fatal error
# is set and cmake stops processing commands and will not generate
# any makefiles or projects.
#if(NOT CMAKE_GHDL_COMPILER_WORKS)
#  PrintTestCompilerStatus("GHDL")
#  __TestCompiler_setTryCompileTargetType()
#  file(WRITE ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/testGHDLCompiler.vhd
#    "entity ${CMAKE_PROJECT_NAME} is\n"
#    "end test;\n"
#    "architecture vx of test is\n"
#    "begin\n"
#    "end vx;\n")
#  try_compile(CMAKE_GHDL_COMPILER_WORKS ${CMAKE_BINARY_DIR}
#    ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeTmp/testGHDLCompiler.vhd
#    OUTPUT_VARIABLE __CMAKE_GHDL_COMPILER_OUTPUT)
#  # Move result from cache to normal variable.
#  set(CMAKE_GHDL_COMPILER_WORKS ${CMAKE_GHDL_COMPILER_WORKS})
#  unset(CMAKE_GHDL_COMPILER_WORKS CACHE)
#  __TestCompiler_restoreTryCompileTargetType()
#  if(NOT CMAKE_GHDL_COMPILER_WORKS)
#    PrintTestCompilerResult(CHECK_FAIL "broken")
#    file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeError.log
#      "Determining if the GHDL compiler works failed with "
#      "the following output:\n${__CMAKE_GHDL_COMPILER_OUTPUT}\n\n")
#    string(REPLACE "\n" "\n  " _output "${__CMAKE_GHDL_COMPILER_OUTPUT}")
#    message(FATAL_ERROR "The GHDL compiler\n  \"${CMAKE_GHDL_COMPILER}\"\n"
#      "is not able to compile a simple test program.\nIt fails "
#      "with the following output:\n  ${_output}\n\n"
#      "CMake will not be able to correctly generate this project.")
#  endif()
#  PrintTestCompilerResult(CHECK_PASS "works")
#  file(APPEND ${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/CMakeOutput.log
#    "Determining if the GHDL compiler works passed with "
#    "the following output:\n${__CMAKE_GHDL_COMPILER_OUTPUT}\n\n")
#endif()

# Re-configure to save learned information.
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules/CMakeGHDLCompiler.cmake.in ${CMAKE_PLATFORM_INFO_DIR}/CMakeGHDLCompiler.cmake @ONLY)
include(${CMAKE_PLATFORM_INFO_DIR}/CMakeGHDLCompiler.cmake)
