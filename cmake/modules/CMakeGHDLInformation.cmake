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

include(CMakeLanguageInformation)

set(CMAKE_GHDL_OUTPUT_EXTENSION .o)

# compile a vhdl file into an object file
if(NOT CMAKE_GHDL_COMPILE_OBJECT)
  set(CMAKE_GHDL_COMPILE_OBJECT "<CMAKE_GHDL_COMPILER> -a <FLAGS> --workdir=<CMAKE_CURRENT_BINARY_DIR> <SOURCE>")
endif()

if(NOT CMAKE_GHDL_LINK_EXECUTABLE)
  # HACK: Special foo for build.ninja. With target_link_options(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}) this will create LINK_FLAGS which is needed as component for ghdl
  if(CMAKE_GENERATOR STREQUAL "Ninja")
    set(CMAKE_GHDL_LINK_EXECUTABLE "cd <CMAKE_CURRENT_BINARY_DIR> && <CMAKE_GHDL_COMPILER> -e <FLAGS> --workdir=<CMAKE_CURRENT_BINARY_DIR> <LINK_FLAGS>")
  else()
    set(CMAKE_GHDL_LINK_EXECUTABLE "<CMAKE_GHDL_COMPILER> -e <FLAGS> --workdir=<CMAKE_CURRENT_BINARY_DIR> <TARGET>")
  endif()
endif()

mark_as_advanced(CMAKE_VERBOSE_MAKEFILE)

set(CMAKE_GHDL_INFORMATION_LOADED 1)
