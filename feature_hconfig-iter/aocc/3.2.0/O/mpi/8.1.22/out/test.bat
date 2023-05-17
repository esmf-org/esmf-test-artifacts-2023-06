#!/bin/sh -l
#SBATCH --account=e3sm
#SBATCH -o /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpi_O_feature_hconfig-iter/test.bat_%j.o
#SBATCH -e /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpi_O_feature_hconfig-iter/test.bat_%j.e
#SBATCH --time=4:00:00
#SBATCH -C cpu
#SBATCH --qos=regular
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load PrgEnv-aocc cpu
module load aocc/3.2.0 cray-mpich/8.1.22
module load cray-hdf5/1.12.2.1 cray-netcdf/4.9.0.1

set -x
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpi_O_feature_hconfig-iter/esmf
export ESMF_COMPILER=aocc
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpi_O_feature_hconfig-iter/module-test.log
cd /global/cfs/cdirs/e3sm/theurich/ESMF-Nightly-Testing/aocc_3.2.0_mpi_O_feature_hconfig-iter/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc.log
