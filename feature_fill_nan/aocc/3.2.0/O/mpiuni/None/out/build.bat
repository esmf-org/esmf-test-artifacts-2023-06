#!/bin/bash -l
export JOBID=NO_BATCH
module load AOCC/3.2.0 

set -x
export ESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_O_feature_fill_nan/esmf
export ESMF_COMPILER=aocc
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_O_feature_fill_nan/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_O_feature_fill_nan/module-build.log
cd /home/gerhard/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_O_feature_fill_nan/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 4 2>&1| tee ../build.log
