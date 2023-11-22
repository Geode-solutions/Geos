# file: platform-config.cmake

# detect host and name the configuration file
site_name(HOST_NAME)
set(CONFIG_NAME "geode" CACHE PATH "")
message("CONFIG_NAME = ${CONFIG_NAME}")

# set paths to C, C++, and Fortran compilers. Note that while GEOS does not contain any Fortran code,
# some of the third-party libraries do contain Fortran code. Thus a Fortran compiler must be specified.
# set(CMAKE_C_COMPILER "/usr/bin/clang" CACHE PATH "")
# set(CMAKE_CXX_COMPILER "/usr/bin/clang++" CACHE PATH "")
# set(CMAKE_Fortran_COMPILER "/usr/local/bin/gfortran" CACHE PATH "")
set(ENABLE_FORTRAN OFF CACHE BOOL "" FORCE)

# enable MPI and set paths to compilers and executable.
# Note that the MPI compilers are wrappers around standard serial compilers.
# Therefore, the MPI compilers must wrap the appropriate serial compilers specified
# in CMAKE_C_COMPILER, CMAKE_CXX_COMPILER, and CMAKE_Fortran_COMPILER.
set(ENABLE_MPI ON CACHE BOOL "")
# set(MPI_C_COMPILER "/usr/local/bin/mpicc" CACHE PATH "")
# set(MPI_CXX_COMPILER "/usr/local/bin/mpicxx" CACHE PATH "")
# set(MPI_Fortran_COMPILER "/usr/local/bin/mpifort" CACHE PATH "")
# set(MPIEXEC "/usr/local/bin/mpirun" CACHE PATH "")

# disable CUDA and OpenMP
set(ENABLE_CUDA OFF CACHE BOOL "" FORCE)
set(ENABLE_OPENMP OFF CACHE BOOL "" FORCE)

# enable PVTPackage
set(ENABLE_PVTPackage OFF CACHE BOOL "" FORCE)

# enable tests
set(ENABLE_GTEST_DEATH_TESTS OFF CACHE BOOL "" FORCE )
set(ENABLE_SPHINX_EXECUTABLE OFF CACHE BOOL "")
set(ENABLE_UNCRUSTIFY OFF CACHE BOOL "")
set(ENABLE_DOXYGEN OFF CACHE BOOL "")
set(ENABLE_XML_UPDATES OFF CACHE BOOL "")

# define the path to your compiled installation directory
set(GEOSX_TPL_DIR "/geos" CACHE PATH "")
# let GEOS define some third party libraries information for you
include("/code/GEOS/host-configs/tpls.cmake")