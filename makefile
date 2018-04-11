# Makefile for CardiacFEM
CardiacFEM: 

precision.o: precision.f90
    mpif90 -c precision.f90

global_variables.o: precision.o global_variables.f90
    mpif90 -c global_variables.f90
    
mp_interface.o: precision.o global_variables.o mp_interface.f90
    mpif90 -c mp_interface.f90
    
input.o: precision.o mp_interface.o input.f90
    mpif90 -c input.f90
    
output.o: precision.o mp_interface.o output.f90
    mpif90 -c output.f90
