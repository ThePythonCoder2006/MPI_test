CC=gcc

MPI_ROOT= $(shell echo %I_MPI_ROOT%)

IDIR=$(MPI_ROOT)/include
LDIR=$(MPI_ROOT)/lib/release

LFLAGS=-I"$(IDIR)" -L"$(LDIR)" -limpi
CFLAGS=-Wall -Wextra -pedantic -O3

all: comp_all run_all

run_all:
	mpiexec -n=4 main

comp_all:
	$(CC) main.c -o main $(CFLAGS) $(LFLAGS)