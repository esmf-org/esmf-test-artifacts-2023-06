#!/bin/sh -l
#PBS -N build.bat
#PBS -l walltime=2:00:00
#PBS -q main
#PBS -A ACGD0008
#PBS -l select=1:ncpus=128:mpiprocs=128
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load cce/15.0.1 cray-mpich/8.1.25
module load netcdf/4.9.1

set -x
export ESMF_MPIRUN=mpiexec
export ESMF_DIR=/glade/derecho/scratch/theurich/ESMF-Nightly-Testing/cce_15.0.1_mpi_g_develop/esmf
export ESMF_COMPILER=cce
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/derecho/scratch/theurich/ESMF-Nightly-Testing/cce_15.0.1_mpi_g_develop/module-build.log
cd /glade/derecho/scratch/theurich/ESMF-Nightly-Testing/cce_15.0.1_mpi_g_develop/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 128 2>&1| tee ../build.log
