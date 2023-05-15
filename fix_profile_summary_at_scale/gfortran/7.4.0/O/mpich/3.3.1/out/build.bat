#!/bin/bash -l
export JOBID=NO_BATCH
module load GCC/7.4.0/GCC GCC/7.4.0/mpich/3.3.1
module load GCC/7.4.0/netcdf/4.7.4p

set -x
export ESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_O_fix_profile_summary_at_scale/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_O_fix_profile_summary_at_scale/module-build.log
cd /home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_O_fix_profile_summary_at_scale/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 4 2>&1| tee ../build.log
