#!/bin/sh -l
#SBATCH --account=nems
#SBATCH -o /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2022.3.0-oneAPI_intelmpi_g_feature_fill_nan/test.bat_%j.o
#SBATCH -e /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2022.3.0-oneAPI_intelmpi_g_feature_fill_nan/test.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake
module load intel/2022.3.0 impi/2022.3.0
module load netcdf-hdf5parallel/4.7.4

set -x
export ESMF_MPIRUN=mpirun.srun
export I_MPI_F90=/apps/oneapi/compiler/2022.2.0/linux/bin/ifx
export I_MPI_CXX=/apps/oneapi/compiler/2022.2.0/linux/bin/icpx
export I_MPI_CC=/apps/oneapi/compiler/2022.2.0/linux/bin/icx
export ESMF_DIR=/scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2022.3.0-oneAPI_intelmpi_g_feature_fill_nan/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2022.3.0-oneAPI_intelmpi_g_feature_fill_nan/module-test.log
cd /scratch2/NCEPDEV/stmp1/Gerhard.Theurich/ESMF-Nightly-Testing/intel_2022.3.0-oneAPI_intelmpi_g_feature_fill_nan/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc.log
