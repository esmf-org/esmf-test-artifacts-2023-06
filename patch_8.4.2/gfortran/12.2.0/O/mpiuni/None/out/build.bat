#!/bin/sh -l
#SBATCH --account=esrl_bmcs
#SBATCH -o /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.2.0_mpiuni_O_patch_8.4.2/build.bat_%j.o
#SBATCH -e /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.2.0_mpiuni_O_patch_8.4.2/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c5
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module unload darshan-runtime PrgEnv-intel cray-mpich
module load PrgEnv-gnu git
module load gcc/12.2.0 
module load cray-hdf5/1.12.2.3 cray-netcdf/4.9.0.3

set -x
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.2.0_mpiuni_O_patch_8.4.2/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.2.0_mpiuni_O_patch_8.4.2/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.2.0_mpiuni_O_patch_8.4.2/module-build.log
cd /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.2.0_mpiuni_O_patch_8.4.2/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 128 2>&1| tee ../build.log
