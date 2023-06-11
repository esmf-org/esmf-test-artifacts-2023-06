#!/bin/sh -l
#PBS -N build.bat
#PBS -l walltime=2:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load intel/18.0.5 
module load netcdf/4.6.3
module load python/3.7.9

set -x
export ESMPY_DATA_DIR="/glade/work/theurich/esmf-test-data/grids"
export ESMF_DIR=/glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_O_feature_bopt_g_flags/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_O_feature_bopt_g_flags/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_O_feature_bopt_g_flags/module-build.log
cd /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_O_feature_bopt_g_flags/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 36 2>&1| tee ../build.log
