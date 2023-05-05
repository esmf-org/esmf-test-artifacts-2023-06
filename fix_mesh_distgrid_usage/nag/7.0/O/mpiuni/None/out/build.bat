#!/bin/bash -l
export JOBID=NO_BATCH
module load CMake/3.24.3
module load compiler/nag/7.0 
module load tool/netcdf/4.6.1/nag

set -x
export ESMF_DIR=/project/esmf/theurich/ESMF-Nightly-Testing/nag_7.0_mpiuni_O_fix_mesh_distgrid_usage/esmf
export ESMF_COMPILER=nag
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/project/esmf/theurich/ESMF-Nightly-Testing/nag_7.0_mpiuni_O_fix_mesh_distgrid_usage/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /project/esmf/theurich/ESMF-Nightly-Testing/nag_7.0_mpiuni_O_fix_mesh_distgrid_usage/module-build.log
cd /project/esmf/theurich/ESMF-Nightly-Testing/nag_7.0_mpiuni_O_fix_mesh_distgrid_usage/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 8 2>&1| tee ../build.log
