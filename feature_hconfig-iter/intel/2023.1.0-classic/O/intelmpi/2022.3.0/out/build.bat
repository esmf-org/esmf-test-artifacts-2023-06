#!/bin/sh -l
#SBATCH --account=esmf
#SBATCH -o /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2023.1.0-classic_intelmpi_O_feature_hconfig-iter/build.bat_%j.o
#SBATCH -e /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2023.1.0-classic_intelmpi_O_feature_hconfig-iter/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load gnu cmake
module load intel/2023.1.0 impi/2022.3.0
module load netcdf-hdf5parallel/4.7.4

set -x
export ESMF_MPIRUN=mpirun.srun
export ESMF_DIR=/scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2023.1.0-classic_intelmpi_O_feature_hconfig-iter/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2023.1.0-classic_intelmpi_O_feature_hconfig-iter/module-build.log
cd /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2023.1.0-classic_intelmpi_O_feature_hconfig-iter/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 40 2>&1| tee ../build.log
