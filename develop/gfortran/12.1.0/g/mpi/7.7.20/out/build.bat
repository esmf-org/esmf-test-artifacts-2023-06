#!/bin/sh -l
#SBATCH --account=nggps_emc
#SBATCH -o /lustre/f2/dev/Mark.Potts/esmf-test/gfortran_12.1.0_mpi_g_develop/build.bat_%j.o
#SBATCH -e /lustre/f2/dev/Mark.Potts/esmf-test/gfortran_12.1.0_mpi_g_develop/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c4
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module unload PrgEnv-intel darshan
module load PrgEnv-gnu
module load gcc/12.1.0 cray-mpich/7.7.20
module load cray-hdf5/1.12.1.3 cray-netcdf/4.8.1.3

set -x
export ESMF_NETCDF_INCLUDE="$CRAY_NETCDF_PREFIX/include"
export ESMF_NETCDF_LIBPATH="$CRAY_NETCDF_PREFIX/lib"
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/lustre/f2/dev/Mark.Potts/esmf-test/gfortran_12.1.0_mpi_g_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /lustre/f2/dev/Mark.Potts/esmf-test/gfortran_12.1.0_mpi_g_develop/module-build.log
cd /lustre/f2/dev/Mark.Potts/esmf-test/gfortran_12.1.0_mpi_g_develop/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 24 2>&1| tee ../build.log
