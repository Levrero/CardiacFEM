# MAKEFILE src/modules/mpi/makefile
# Author: Louise M. Lever
# -----------------------------------------------------------------------
# Compiles common "shared" files and specific "mpi" files
# Builds as a STATIC library libParaFEM_mpi.a
# -----------------------------------------------------------------------
# Options:
# (default) : Compile and build library
# install: Copy modules into global include directory
#          Copy library into global lib directory
# -----------------------------------------------------------------------
# Notes:
# (1) VPATH required to find "shared" modules when building lib rule
# -----------------------------------------------------------------------

VPATH = ../shared
.SUFFIXES: .f90 .o
%.o: %.mod

include ../../../build/mk_defs.inc
include ../../../build/$(MACHINE).inc

MPI=	mpi_wrapper.o \
	mp_interface.o \
	input.o \
	output.o \
	maths.o \
	gather_scatter.o \
	pcg.o \
	loading.o \
	large_strain.o \
	bicg.o \
	eigen.o
SHARED=	precision.o \
	global_variables.o \
	partition.o \
	steering.o \
	elements.o \
	timing.o \
	plasticity.o \
	geometry.o \
	fluid.o \
	new_library.o

all:	release

release:
	@echo
	@echo "Building MODULE RELEASE (MPI)"
	$(MAKE) FFLAGS="$(LIB_MPI_REL_FFLAGS)" lib-release
	@echo "Done MODULE RELEASE (MPI)"
debug:
	@echo
	@echo "Building MODULE DEBUG (MPI)"
	$(MAKE) FFLAGS="$(LIB_MPI_DBG_FFLAGS)" lib-debug
	@echo "Done MODULE DEBUG (MPI)"

lib-release:	$(SHARED) $(MPI)
	ar -r libParaFEM_mpi.$(VERSION).a $(SHARED) $(MPI)

lib-debug:	$(SHARED) $(MPI)
	ar -r libParaFEM_mpi_D.$(VERSION).a $(SHARED) $(MPI)


.f90.o:
	$(FC) -c $(FFLAGS) ../shared/precision.f90
	$(FC) -c $(FFLAGS) ../shared/global_variables.f90
	$(FC) -c $(FFLAGS) ../shared/partition.f90
	$(FC) -c $(FFLAGS) ../shared/steering.f90
	$(FC) -c $(FFLAGS) ../shared/elements.f90
	$(FC) -c $(FFLAGS) ../shared/timing.f90
	$(FC) -c $(FFLAGS) ../shared/plasticity.f90
	$(FC) -c $(FFLAGS) ../shared/geometry.f90
	$(FC) -c $(FFLAGS) ../shared/fluid.f90
	$(FC) -c $(FFLAGS) ../shared/new_library.f90
	$(FC) -c $(FFLAGS) mpi_wrapper.f90
	$(FC) -c $(FFLAGS) mp_interface.f90
	$(FC) -c $(FFLAGS) input.f90
	$(FC) -c $(FFLAGS) output.f90
	$(FC) -c $(FFLAGS) maths.f90
	$(FC) -c $(FFLAGS) gather_scatter.f90
	$(FC) -c $(FFLAGS) pcg.f90
	$(FC) -c $(FFLAGS) loading.f90
	$(FC) -c $(FFLAGS) bicg.f90
	$(FC) -c $(FFLAGS) large_strain.f90
	$(FC) -c $(FFLAGS) eigen.f90

clean:
	rm -f *.o *.mod *.a

execlean:
	rm -f ../../../include/mpi/*.mod
	rm -f ../../../lib/libParaFEM_mpi*.a

install:
	cp *.mod ../../../include/mpi
	cp *.a ../../../lib
