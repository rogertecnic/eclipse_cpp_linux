# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /src/build

# Include any dependencies generated for this target.
include CMakeFiles/binario.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/binario.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/binario.dir/flags.make

CMakeFiles/binario.dir/ev3dev.o: CMakeFiles/binario.dir/flags.make
CMakeFiles/binario.dir/ev3dev.o: ../ev3dev.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /src/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/binario.dir/ev3dev.o"
	/usr/bin/arm-linux-gnueabi-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/binario.dir/ev3dev.o -c /src/ev3dev.cpp

CMakeFiles/binario.dir/ev3dev.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/binario.dir/ev3dev.i"
	/usr/bin/arm-linux-gnueabi-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /src/ev3dev.cpp > CMakeFiles/binario.dir/ev3dev.i

CMakeFiles/binario.dir/ev3dev.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/binario.dir/ev3dev.s"
	/usr/bin/arm-linux-gnueabi-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /src/ev3dev.cpp -o CMakeFiles/binario.dir/ev3dev.s

CMakeFiles/binario.dir/ev3dev.o.requires:
.PHONY : CMakeFiles/binario.dir/ev3dev.o.requires

CMakeFiles/binario.dir/ev3dev.o.provides: CMakeFiles/binario.dir/ev3dev.o.requires
	$(MAKE) -f CMakeFiles/binario.dir/build.make CMakeFiles/binario.dir/ev3dev.o.provides.build
.PHONY : CMakeFiles/binario.dir/ev3dev.o.provides

CMakeFiles/binario.dir/ev3dev.o.provides.build: CMakeFiles/binario.dir/ev3dev.o

CMakeFiles/binario.dir/Main.o: CMakeFiles/binario.dir/flags.make
CMakeFiles/binario.dir/Main.o: ../Main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /src/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/binario.dir/Main.o"
	/usr/bin/arm-linux-gnueabi-g++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/binario.dir/Main.o -c /src/Main.cpp

CMakeFiles/binario.dir/Main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/binario.dir/Main.i"
	/usr/bin/arm-linux-gnueabi-g++  $(CXX_DEFINES) $(CXX_FLAGS) -E /src/Main.cpp > CMakeFiles/binario.dir/Main.i

CMakeFiles/binario.dir/Main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/binario.dir/Main.s"
	/usr/bin/arm-linux-gnueabi-g++  $(CXX_DEFINES) $(CXX_FLAGS) -S /src/Main.cpp -o CMakeFiles/binario.dir/Main.s

CMakeFiles/binario.dir/Main.o.requires:
.PHONY : CMakeFiles/binario.dir/Main.o.requires

CMakeFiles/binario.dir/Main.o.provides: CMakeFiles/binario.dir/Main.o.requires
	$(MAKE) -f CMakeFiles/binario.dir/build.make CMakeFiles/binario.dir/Main.o.provides.build
.PHONY : CMakeFiles/binario.dir/Main.o.provides

CMakeFiles/binario.dir/Main.o.provides.build: CMakeFiles/binario.dir/Main.o

# Object files for target binario
binario_OBJECTS = \
"CMakeFiles/binario.dir/ev3dev.o" \
"CMakeFiles/binario.dir/Main.o"

# External object files for target binario
binario_EXTERNAL_OBJECTS =

binario: CMakeFiles/binario.dir/ev3dev.o
binario: CMakeFiles/binario.dir/Main.o
binario: CMakeFiles/binario.dir/build.make
binario: CMakeFiles/binario.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable binario"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/binario.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/binario.dir/build: binario
.PHONY : CMakeFiles/binario.dir/build

CMakeFiles/binario.dir/requires: CMakeFiles/binario.dir/ev3dev.o.requires
CMakeFiles/binario.dir/requires: CMakeFiles/binario.dir/Main.o.requires
.PHONY : CMakeFiles/binario.dir/requires

CMakeFiles/binario.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/binario.dir/cmake_clean.cmake
.PHONY : CMakeFiles/binario.dir/clean

CMakeFiles/binario.dir/depend:
	cd /src/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /src /src /src/build /src/build /src/build/CMakeFiles/binario.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/binario.dir/depend
