# ESMF application makefile fragment
#
# Use the following ESMF_ variables to compile and link
# your ESMF application against this ESMF build.
#
# !!! VERY IMPORTANT: If the location of this ESMF build is   !!!
# !!! changed, e.g. libesmf.a is copied to another directory, !!!
# !!! this file - esmf.mk - must be edited to adjust to the   !!!
# !!! correct new path                                        !!!
#
# Please see end of file for options used on this ESMF build
#

#----------------------------------------------
ESMF_VERSION_STRING=8.5.0 beta snapshot
ESMF_VERSION_STRING_GIT=v8.5.0b21-123-g21bcb6467b
#----------------------------------------------

ESMF_VERSION_MAJOR=8
ESMF_VERSION_MINOR=5
ESMF_VERSION_REVISION=0
ESMF_VERSION_PATCHLEVEL=0
ESMF_VERSION_PUBLIC='F'
ESMF_VERSION_BETASNAPSHOT='T'


ESMF_APPSDIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/apps/appsO/Unicos.gfortran.64.mpi.default
ESMF_LIBSDIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default
ESMF_ESMXDIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/src/addon/ESMX


ESMF_F90COMPILER=ftn
ESMF_F90LINKER=ftn

ESMF_F90COMPILEOPTS=-O -fPIC  -pthread -ffree-line-length-none  -fopenmp
ESMF_F90COMPILEPATHS=-I/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/mod/modO/Unicos.gfortran.64.mpi.default -I/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/src/include -I/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/include -I/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/include
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.5.0b21-123-g21bcb6467b' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_PIO=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Unicos=1 -DESMF_COMM=mpi -DESMF_DIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf
ESMF_F90COMPILEFREECPP=
ESMF_F90COMPILEFREENOCPP=-ffree-form
ESMF_F90COMPILEFIXCPP=-cpp -ffixed-form
ESMF_F90COMPILEFIXNOCPP=

ESMF_F90LINKOPTS=   -pthread  -fopenmp
ESMF_F90LINKPATHS=-L/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -L/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib -L/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/
ESMF_F90ESMFLINKPATHS=-L/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default
ESMF_F90LINKRPATHS=-Wl,-rpath,/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -Wl,-rpath,/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib  -Wl,-rpath,/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/
ESMF_F90ESMFLINKRPATHS=-Wl,-rpath,/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default
ESMF_F90LINKLIBS=  -lrt -lstdc++ -ldl -lnetcdff -lnetcdf -lpioc
ESMF_F90ESMFLINKLIBS=-lesmf   -lrt -lstdc++ -ldl -lnetcdff -lnetcdf -lpioc

ESMF_CXXCOMPILER=CC
ESMF_CXXLINKER=CC

ESMF_CXXCOMPILEOPTS=-std=c++11 -O -DNDEBUG -fPIC -pthread  -fopenmp
ESMF_CXXCOMPILEPATHS= -I/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/src/include  -I/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/include -I/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.5.0b21-123-g21bcb6467b' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_PIO=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Unicos=1 -DESMF_COMM=mpi -DESMF_DIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf -D__SDIR__='' -DESMF_CXXSTD=11 -DESMF_NO_POSIXIPC

ESMF_CXXLINKOPTS=  -pthread  -fopenmp
ESMF_CXXLINKPATHS=-L/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -L/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib -L/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/
ESMF_CXXESMFLINKPATHS=-L/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default
ESMF_CXXLINKRPATHS=-Wl,-rpath,/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -Wl,-rpath,/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib  -Wl,-rpath,/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/
ESMF_CXXESMFLINKRPATHS=-Wl,-rpath,/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default
ESMF_CXXLINKLIBS=  -lrt -lgfortran -ldl -lnetcdff -lnetcdf -lpioc
ESMF_CXXESMFLINKLIBS=-lesmf   -lrt -lgfortran -ldl -lnetcdff -lnetcdf -lpioc

ESMF_CCOMPILER=cc
ESMF_CLINKER=cc

ESMF_CCOMPILEOPTS=-std=c99 -O -DNDEBUG -fPIC  -fopenmp
ESMF_CCOMPILEPATHS= -I/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/src/include  
ESMF_CCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.5.0b21-123-g21bcb6467b' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_PIO=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Unicos=1 -DESMF_COMM=mpi -DESMF_DIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf -D__SDIR__='' -DESMF_CSTD=99

ESMF_CLINKOPTS=   -fopenmp
ESMF_CLINKPATHS=-L/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -L/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib -L/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/ -L/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -L/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib -L/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/
ESMF_CESMFLINKPATHS=-L/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default
ESMF_CLINKRPATHS=-Wl,-rpath,/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -Wl,-rpath,/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib -Wl,-rpath,/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/ -Wl,-rpath,/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default -Wl,-rpath,/opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib -Wl,-rpath,/opt/cray/pe/gcc/11.2.0/snos/lib/gcc/x86_64-suse-linux/11.2.0/../../../../lib64/
ESMF_CESMFLINKRPATHS=-Wl,-rpath,/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default
ESMF_CLINKLIBS=  -lrt -lgfortran -ldl -lnetcdff -lnetcdf -lpioc   -lrt -lstdc++ -ldl -lnetcdff -lnetcdf -lpioc
ESMF_CESMFLINKLIBS=-lesmf   -lrt -lgfortran -ldl -lnetcdff -lnetcdf -lpioc   -lrt -lstdc++ -ldl -lnetcdff -lnetcdf -lpioc

ESMF_SO_F90COMPILEOPTS=-fPIC
ESMF_SO_F90LINKOPTS=-shared
ESMF_SO_F90LINKOPTSEXE=-Wl,-export-dynamic
ESMF_SO_CXXCOMPILEOPTS=-fPIC
ESMF_SO_CXXLINKOPTS=-shared
ESMF_SO_CXXLINKOPTSEXE=-Wl,-export-dynamic
ESMF_SO_CCOMPILEOPTS=-fPIC
ESMF_SO_CLINKOPTS=-shared
ESMF_SO_CLINKOPTSEXE=-Wl,-export-dynamic

ESMF_OPENMP_F90COMPILEOPTS= -fopenmp
ESMF_OPENMP_F90LINKOPTS= -fopenmp
ESMF_OPENMP_CXXCOMPILEOPTS= -fopenmp
ESMF_OPENMP_CXXLINKOPTS= -fopenmp

ESMF_OPENACC_F90COMPILEOPTS= -fopenacc
ESMF_OPENACC_F90LINKOPTS= -fopenacc
ESMF_OPENACC_CXXCOMPILEOPTS= -fopenacc
ESMF_OPENACC_CXXLINKOPTS= -fopenacc

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/lib/libO/Unicos.gfortran.64.mpi.default/libesmftrace_preload.so
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf
ESMF_INTERNAL_MPIRUN="/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf/scripts/mpirun.srun "

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_hconfig-iter/esmf
# ESMF_OS: Unicos
# ESMF_MACHINE: x86_64
# ESMF_ABI: 64
# ESMF_COMPILER: gfortran
# ESMF_BOPT: O
# ESMF_COMM: mpi
# ESMF_SITE: default
# ESMF_PTHREADS: ON
# ESMF_OPENMP: ON
# ESMF_OPENACC: OFF
# ESMF_ARRAY_LITE: FALSE
# ESMF_NO_INTEGER_1_BYTE: TRUE
# ESMF_NO_INTEGER_2_BYTE: TRUE
# ESMF_FORTRANSYMBOLS: default
# ESMF_MAPPER_BUILD: OFF
# ESMF_AUTO_LIB_BUILD: ON
# ESMF_DEFER_LIB_BUILD: ON
# ESMF_SHARED_LIB_BUILD: ON
# 
# ESMF environment variables pointing to 3rd party software:
# ESMF_MOAB:              internal
# ESMF_LAPACK:            internal
# ESMF_ACC_SOFTWARE_STACK:            none
# ESMF_NETCDF:            nc-config
# ESMF_NETCDF_INCLUDE:    /opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/include
# ESMF_NETCDF_LIBS:       -lnetcdff -lnetcdf
# ESMF_NETCDF_LIBPATH:    /opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/lib
# ESMF_NFCONFIG:          nf-config
# ESMF_NETCDFF_INCLUDE:   /opt/cray/pe/netcdf/4.9.0.1/gnu/9.1/include
# ESMF_PIO:               internal
# ESMF_PIO_LIBS:          -lpioc
# ESMF_YAMLCPP:           internal
#
# * Compilers, Linkers, Flags, and Libraries *
# Location of the preprocessor:      /opt/cray/pe/gcc/11.2.0/bin/gcc
# Location of the Fortran compiler:  /opt/cray/pe/craype/2.7.20/bin/ftn
# Location of the Fortran linker:    /opt/cray/pe/craype/2.7.20/bin/ftn
# Location of the C++ compiler:      /opt/cray/pe/craype/2.7.20/bin/CC
# Location of the C++ linker:        /opt/cray/pe/craype/2.7.20/bin/CC
# Location of the C compiler:        /opt/cray/pe/craype/2.7.20/bin/cc
# Location of the C linker:          /opt/cray/pe/craype/2.7.20/bin/cc
#
