# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_SOURCE_DIR = /home/avinash/Downloads/oxDNA

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/avinash/Downloads/oxDNA/build

# Include any dependencies generated for this target.
include contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/depend.make

# Include the progress variables for this target.
include contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/progress.make

# Include the compile flags for this target's objects.
include contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/flags.make

contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.o: contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/flags.make
contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.o: ../contrib/randisi/src/Interactions/DNA2ModInteraction.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/avinash/Downloads/oxDNA/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.o"
	cd /home/avinash/Downloads/oxDNA/build/contrib/randisi && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.o -c /home/avinash/Downloads/oxDNA/contrib/randisi/src/Interactions/DNA2ModInteraction.cpp

contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.i"
	cd /home/avinash/Downloads/oxDNA/build/contrib/randisi && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/avinash/Downloads/oxDNA/contrib/randisi/src/Interactions/DNA2ModInteraction.cpp > CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.i

contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.s"
	cd /home/avinash/Downloads/oxDNA/build/contrib/randisi && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/avinash/Downloads/oxDNA/contrib/randisi/src/Interactions/DNA2ModInteraction.cpp -o CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.s

# Object files for target DNA2ModInteraction
DNA2ModInteraction_OBJECTS = \
"CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.o"

# External object files for target DNA2ModInteraction
DNA2ModInteraction_EXTERNAL_OBJECTS =

../contrib/randisi/DNA2ModInteraction.so: contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/src/Interactions/DNA2ModInteraction.cpp.o
../contrib/randisi/DNA2ModInteraction.so: contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/build.make
../contrib/randisi/DNA2ModInteraction.so: contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/avinash/Downloads/oxDNA/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library ../../../contrib/randisi/DNA2ModInteraction.so"
	cd /home/avinash/Downloads/oxDNA/build/contrib/randisi && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DNA2ModInteraction.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/build: ../contrib/randisi/DNA2ModInteraction.so

.PHONY : contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/build

contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/clean:
	cd /home/avinash/Downloads/oxDNA/build/contrib/randisi && $(CMAKE_COMMAND) -P CMakeFiles/DNA2ModInteraction.dir/cmake_clean.cmake
.PHONY : contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/clean

contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/depend:
	cd /home/avinash/Downloads/oxDNA/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/avinash/Downloads/oxDNA /home/avinash/Downloads/oxDNA/contrib/randisi /home/avinash/Downloads/oxDNA/build /home/avinash/Downloads/oxDNA/build/contrib/randisi /home/avinash/Downloads/oxDNA/build/contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : contrib/randisi/CMakeFiles/DNA2ModInteraction.dir/depend

