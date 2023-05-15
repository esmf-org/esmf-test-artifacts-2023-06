#!/bin/bash -l
export JOBID=NO_BATCH
module load GCC/11.2.0/GCC GCC/11.2.0/mpich/4.0.0
module load GCC/11.2.0/netcdf/4.7.4-mpich4.0.0

set -x
export ESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_11.2.0_mpich_g_fix_profile_summary_at_scale/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /home/gerhard/ESMF-Nightly-Testing/gfortran_11.2.0_mpich_g_fix_profile_summary_at_scale/module-test.log
cd /home/gerhard/ESMF-Nightly-Testing/gfortran_11.2.0_mpich_g_fix_profile_summary_at_scale/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc.log
