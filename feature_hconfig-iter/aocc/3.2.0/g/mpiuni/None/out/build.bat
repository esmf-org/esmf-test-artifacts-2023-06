#!/bin/sh -l
#SBATCH --account=e3sm
#SBATCH -o /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_feature_hconfig-iter/build.bat_%j.o
#SBATCH -e /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_feature_hconfig-iter/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH -C cpu
#SBATCH --qos=regular
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load PrgEnv-aocc cpu
module load aocc/3.2.0 
module load cray-hdf5/1.12.2.1 cray-netcdf/4.9.0.1

set -x
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_feature_hconfig-iter/esmf
export ESMF_COMPILER=aocc
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_feature_hconfig-iter/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_feature_hconfig-iter/module-build.log
cd /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpiuni_g_feature_hconfig-iter/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 128 2>&1| tee ../build.log
