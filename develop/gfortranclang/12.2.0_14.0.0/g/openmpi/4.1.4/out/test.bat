#!/bin/bash -l
export JOBID=NO_BATCH
module load gfortran-12.2.0_clang-14.0.0 4.1.4
module load netcdf-4.9.0

set -x
export ESMF_DIR=/Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_openmpi_g_develop/esmf
export ESMF_COMPILER=gfortranclang
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_openmpi_g_develop/module-test.log
cd /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_openmpi_g_develop/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc.log
