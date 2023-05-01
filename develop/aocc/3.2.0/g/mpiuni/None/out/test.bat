#!/bin/bash -l
export JOBID=NO_BATCH
module load AOCC/3.2.0 

set -x
export ESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_develop/esmf
export ESMF_COMPILER=aocc
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_develop/module-test.log
cd /home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_develop/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
