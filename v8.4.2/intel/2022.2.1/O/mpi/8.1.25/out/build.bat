#!/bin/sh -l
#SBATCH --account=esrl_bmcs
#SBATCH -o /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1_mpi_O_v8.4.2/build.bat_%j.o
#SBATCH -e /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1_mpi_O_v8.4.2/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c5
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module unload darshan-runtime
module load PrgEnv-intel git
module load intel/2022.2.1 cray-mpich/8.1.25
module load cray-hdf5/1.12.2.3 cray-netcdf/4.9.0.3

set -x
export ESMF_NETCDF_INCLUDE="$CRAY_NETCDF_PREFIX/include"
export ESMF_NETCDF_LIBPATH="$CRAY_NETCDF_PREFIX/lib"
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1_mpi_O_v8.4.2/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1_mpi_O_v8.4.2/module-build.log
cd /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1_mpi_O_v8.4.2/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 128 2>&1| tee ../build.log
