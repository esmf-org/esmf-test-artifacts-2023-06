#!/bin/bash -l
export JOBID=NO_BATCH
module load CMake/3.24.3
module load compiler/gnu/8.1.0 openmpi/3.1.1-gnu8.1.0
module load tool/netcdf/4.6.1/gcc-8.1.0

set -x
export ESMF_DIR=/project/esmf/theurich/ESMF-Nightly-Testing/gfortran_8.1.0_openmpi_g_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /project/esmf/theurich/ESMF-Nightly-Testing/gfortran_8.1.0_openmpi_g_develop/module-build.log
cd /project/esmf/theurich/ESMF-Nightly-Testing/gfortran_8.1.0_openmpi_g_develop/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 8 2>&1| tee ../build.log
