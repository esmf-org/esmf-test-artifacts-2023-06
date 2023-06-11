#!/bin/sh -l
#SBATCH --account=e3sm
#SBATCH -o /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_bopt_g_flags/build.bat_%j.o
#SBATCH -e /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_bopt_g_flags/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH -C cpu
#SBATCH --qos=regular
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load PrgEnv-gnu cpu
module load gcc/11.2.0 cray-mpich/8.1.22
module load cray-hdf5/1.12.2.1 cray-netcdf/4.9.0.1

set -x
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_bopt_g_flags/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_bopt_g_flags/module-build.log
cd /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/gfortran_11.2.0_mpi_O_feature_bopt_g_flags/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 128 2>&1| tee ../build.log
