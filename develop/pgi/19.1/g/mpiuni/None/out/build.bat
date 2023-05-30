#!/bin/sh -l
#SBATCH --account=nems
#SBATCH -o /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_mpiuni_g_develop/build.bat_%j.o
#SBATCH -e /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_mpiuni_g_develop/build.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake
module load pgi/19.10 

set -x
export ESMF_DIR=/scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_mpiuni_g_develop/esmf
export ESMF_COMPILER=pgi
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_mpiuni_g_develop/module-build.log
cd /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_mpiuni_g_develop/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 40 2>&1| tee ../build.log
