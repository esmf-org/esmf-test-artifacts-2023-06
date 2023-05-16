#!/bin/sh -l
#SBATCH --account=esrl_bmcs
#SBATCH -o /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1-classic_mpiuni_g_feature_hconfig-iter/test.bat_%j.o
#SBATCH -e /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1-classic_mpiuni_g_feature_hconfig-iter/test.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --cluster=c5
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module unload darshan-runtime
module load PrgEnv-intel git
module load intel-classic/2022.2.1 
module load cray-hdf5/1.12.2.3 cray-netcdf/4.9.0.3

set -x
export ESMF_NETCDF_INCLUDE="$CRAY_NETCDF_PREFIX/include"
export ESMF_NETCDF_LIBPATH="$CRAY_NETCDF_PREFIX/lib"
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1-classic_mpiuni_g_feature_hconfig-iter/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1-classic_mpiuni_g_feature_hconfig-iter/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1-classic_mpiuni_g_feature_hconfig-iter/module-test.log
cd /lustre/f2/dev/ncep/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2022.2.1-classic_mpiuni_g_feature_hconfig-iter/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
