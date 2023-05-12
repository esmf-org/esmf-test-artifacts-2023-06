#!/bin/sh -l
#SBATCH --account=nems
#SBATCH -o /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_g_feature_fill_nan/build.bat_%j.o
#SBATCH -e /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_g_feature_fill_nan/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake
module load intel/18.0.5.274 
module load netcdf/4.6.1

set -x
export ESMF_DIR=/scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_g_feature_fill_nan/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_g_feature_fill_nan/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_g_feature_fill_nan/module-build.log
cd /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_18.0.5_mpiuni_g_feature_fill_nan/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 40 2>&1| tee ../build.log
