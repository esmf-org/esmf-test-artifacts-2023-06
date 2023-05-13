#!/bin/bash -l
export JOBID=NO_BATCH
module load gfortran-12.2.0_clang-14.0.0 
module load netcdf-4.9.2

set -x
export ESMF_DIR=/Users/oehmke/ESMF_AutoTest/gfortranclang_12.2.0_14.0.0_mpiuni_g_feature_fill_nan/esmf
export ESMF_COMPILER=gfortranclang
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/Users/oehmke/ESMF_AutoTest/gfortranclang_12.2.0_14.0.0_mpiuni_g_feature_fill_nan/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /Users/oehmke/ESMF_AutoTest/gfortranclang_12.2.0_14.0.0_mpiuni_g_feature_fill_nan/module-test.log
cd /Users/oehmke/ESMF_AutoTest/gfortranclang_12.2.0_14.0.0_mpiuni_g_feature_fill_nan/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
