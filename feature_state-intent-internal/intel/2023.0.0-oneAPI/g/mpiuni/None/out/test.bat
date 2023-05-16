#!/bin/sh -l
#PBS -N test.bat
#PBS -l walltime=2:00:00
#PBS -q main
#PBS -A p93300606
#PBS -l select=1:ncpus=128:mpiprocs=128
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load intel-oneapi/2023.0.0 
module load netcdf/4.9.1

set -x
export ESMF_DIR=/glade/gust/scratch/theurich/ESMF-Nightly-Testing/intel_2023.0.0-oneAPI_mpiuni_g_feature_state-intent-internal/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/glade/gust/scratch/theurich/ESMF-Nightly-Testing/intel_2023.0.0-oneAPI_mpiuni_g_feature_state-intent-internal/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /glade/gust/scratch/theurich/ESMF-Nightly-Testing/intel_2023.0.0-oneAPI_mpiuni_g_feature_state-intent-internal/module-test.log
cd /glade/gust/scratch/theurich/ESMF-Nightly-Testing/intel_2023.0.0-oneAPI_mpiuni_g_feature_state-intent-internal/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
