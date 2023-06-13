#!/bin/sh -l
#SBATCH --account=hfv3gfs
#SBATCH -o /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_23.3_openmpi_O_feature_bopt_g_flags/build.bat_%j.o
#SBATCH -e /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_23.3_openmpi_O_feature_bopt_g_flags/build.bat_%j.e
#SBATCH --time=1:20:00
#SBATCH --partition=xjet
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake
module load nvhpc/23.3 nvhpc/23.3

set -x
export ESMF_MPIRUN=mpirun.srun
export ESMF_DIR=/lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_23.3_openmpi_O_feature_bopt_g_flags/esmf
export ESMF_COMPILER=nvhpc
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_23.3_openmpi_O_feature_bopt_g_flags/module-build.log
cd /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_23.3_openmpi_O_feature_bopt_g_flags/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 24 2>&1| tee ../build.log
