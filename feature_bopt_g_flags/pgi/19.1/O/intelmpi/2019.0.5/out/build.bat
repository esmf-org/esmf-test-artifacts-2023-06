#!/bin/sh -l
#SBATCH --account=nems
#SBATCH -o /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_intelmpi_O_feature_bopt_g_flags/build.bat_%j.o
#SBATCH -e /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_intelmpi_O_feature_bopt_g_flags/build.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake
module load pgi/19.10 impi/2019.0.5

set -x
export ESMF_MPIRUN=mpirun.srun
export ESMF_DIR=/scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_intelmpi_O_feature_bopt_g_flags/esmf
export ESMF_COMPILER=pgi
export ESMF_COMM=intelmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_intelmpi_O_feature_bopt_g_flags/module-build.log
cd /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/pgi_19.1_intelmpi_O_feature_bopt_g_flags/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 40 2>&1| tee ../build.log
