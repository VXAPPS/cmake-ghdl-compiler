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

# for debugging of build steps
option(CMAKE_VERBOSE_MAKEFILE "Show the complete build commands" OFF)

# General
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# CMake
set(CMAKE ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Force VHDL Standard
# https://ghdl.github.io/ghdl/using/ImplementationOfVHDL.html#vhdl-standards
#set(CMAKE_GHDL_STANDARD 87)
#set(CMAKE_GHDL_STANDARD 93)
#set(CMAKE_GHDL_STANDARD 08)

if (CMAKE_GHDL_STANDARD)
  set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --std=${CMAKE_GHDL_STANDARD}")
endif()

# Warning flags

# Warns if a design unit replaces another design unit with the same name.
# set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-library")

# During analyze, warns if a component instantiation has neither configuration
# specification nor default binding. This may be useful if you want to detect
# during analyze possibly unbound components if you don’t use configuration.
# See section VHDL standards for more details about default binding rules.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-default-binding")

# During elaboration, warns if a component instantiation is not bound (and not
# explicitly left unbound). Also warns if a port of an entity is not bound in a
# configuration specification or in a component configuration. This warning is
# enabled by default, since default binding rules are somewhat complex and an
# unbound component is most often unexpected.
# set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-binding")

# Emit a warning if an identifier is a reserved word in a later VHDL standard.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-reserved")

# Emit a warning if a /* appears within a block comment (vhdl 2008).
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-nested-comment")

# Emit a warning in case of weird use of parentheses.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-parenthesis")

# Warns if a generic name of a vital entity is not a vital generic name. This is
# set by default.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-vital-generic")

# Warns for checks that cannot be done during analysis time and are postponed to
# elaboration time. This is because not all procedure bodies are available
# during analysis (either because a package body has not yet been analysed or
# because GHDL doesn’t read not required package bodies).
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-delayed-checks")

# Emit a warning if a package body which is not required is analyzed. If a
# package does not declare a subprogram or a deferred constant, the package does
# not require a body.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-body")

# Emit a warning if an all or others specification does not apply.
#set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-specs")

# Emit a warning in case of runtime error that is detected during analysis.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-runtime-error")

# Emit a warning when a shared variable is declared and its type it not a
# protected type.
#set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-shared")

# Emit a warning when a declaration hides a previous hide.
#set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-hide")

# Emit a warning when a subprogram is never used.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-unused")

# Emit a warning is an others choice is not required because all the choices
# have been explicitly covered.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-others")

# Emit a warning when a pure rules is violated (like declaring a pure function
# with access parameters).
#set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-pure")

# Emit a warning when a non-static expression is used at a place where the
# standard requires a static expression.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-static")

# When this option is set, warnings are considered as errors.
set(CMAKE_GHDL_FLAGS "${CMAKE_GHDL_FLAGS} --warn-error")

# Project modules/variables
set(CMAKE_MODULE_PATH ${CMAKE}/modules)

# Includes
include(${CMAKE}/find_package.cmake)
