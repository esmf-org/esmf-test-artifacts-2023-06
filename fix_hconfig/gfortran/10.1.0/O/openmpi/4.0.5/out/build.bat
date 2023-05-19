#!/bin/sh -l
#PBS -N build.bat
#PBS -l walltime=1:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load gnu/10.1.0 openmpi/4.0.5
module load netcdf/4.7.4
module load python/3.7.9

set -x
export ESMPY_DATA_DIR="/glade/work/theurich/esmf-test-data/grids"
export ESMF_DIR=/glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_O_fix_hconfig/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_O_fix_hconfig/module-build.log
cd /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_O_fix_hconfig/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 36 2>&1| tee ../build.log
