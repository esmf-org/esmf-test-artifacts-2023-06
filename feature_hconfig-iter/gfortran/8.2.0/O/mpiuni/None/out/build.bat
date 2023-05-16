#!/bin/bash -l
export JOBID=NO_BATCH
module load CMake/3.24.3
module load compiler/gnu/8.2.0 
module load tool/netcdf/4.6.1/gcc

set -x
export ESMF_DIR=/project/esmf/theurich/ESMF-Nightly-Testing/gfortran_8.2.0_mpiuni_O_feature_hconfig-iter/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/project/esmf/theurich/ESMF-Nightly-Testing/gfortran_8.2.0_mpiuni_O_feature_hconfig-iter/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /project/esmf/theurich/ESMF-Nightly-Testing/gfortran_8.2.0_mpiuni_O_feature_hconfig-iter/module-build.log
cd /project/esmf/theurich/ESMF-Nightly-Testing/gfortran_8.2.0_mpiuni_O_feature_hconfig-iter/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 8 2>&1| tee ../build.log
