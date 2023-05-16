#!/bin/sh -l
#PBS -N build.bat
#PBS -l walltime=2:00:00
#PBS -q main
#PBS -A p93300606
#PBS -l select=1:ncpus=128:mpiprocs=128
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load intel/2023.0.0 cray-mpich/8.1.25
module load netcdf/4.9.1

set -x
export ESMF_MPIRUN=mpiexec
export ESMF_DIR=/glade/gust/scratch/theurich/ESMF-Nightly-Testing/intel_2023.0.0_mpi_O_feature_state-intent-internal/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/gust/scratch/theurich/ESMF-Nightly-Testing/intel_2023.0.0_mpi_O_feature_state-intent-internal/module-build.log
cd /glade/gust/scratch/theurich/ESMF-Nightly-Testing/intel_2023.0.0_mpi_O_feature_state-intent-internal/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 128 2>&1| tee ../build.log
