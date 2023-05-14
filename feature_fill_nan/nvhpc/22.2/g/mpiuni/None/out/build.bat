#!/bin/sh -l
#SBATCH --account=hfv3gfs
#SBATCH -o /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_mpiuni_g_feature_fill_nan/build.bat_%j.o
#SBATCH -e /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_mpiuni_g_feature_fill_nan/build.bat_%j.e
#SBATCH --time=1:20:00
#SBATCH --partition=xjet
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake
module load nvhpc/22.2 

set -x
export ESMF_DIR=/lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_mpiuni_g_feature_fill_nan/esmf
export ESMF_COMPILER=nvhpc
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_mpiuni_g_feature_fill_nan/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_mpiuni_g_feature_fill_nan/module-build.log
cd /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_mpiuni_g_feature_fill_nan/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 24 2>&1| tee ../build.log
