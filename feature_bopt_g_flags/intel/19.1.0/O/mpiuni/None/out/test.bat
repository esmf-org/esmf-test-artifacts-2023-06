#!/bin/bash -l
export JOBID=NO_BATCH
module load CMake/3.24.3
module load compiler/intel/20.0.1 
module load tool/netcdf/4.6.1/intel

set -x
export ESMF_DIR=/project/esmf/theurich/ESMF-Nightly-Testing/intel_19.1.0_mpiuni_O_feature_bopt_g_flags/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/project/esmf/theurich/ESMF-Nightly-Testing/intel_19.1.0_mpiuni_O_feature_bopt_g_flags/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /project/esmf/theurich/ESMF-Nightly-Testing/intel_19.1.0_mpiuni_O_feature_bopt_g_flags/module-test.log
cd /project/esmf/theurich/ESMF-Nightly-Testing/intel_19.1.0_mpiuni_O_feature_bopt_g_flags/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
