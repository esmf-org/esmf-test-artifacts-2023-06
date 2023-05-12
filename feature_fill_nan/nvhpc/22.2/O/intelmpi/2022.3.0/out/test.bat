#!/bin/sh -l
#SBATCH --account=hfv3gfs
#SBATCH -o /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_intelmpi_O_feature_fill_nan/test.bat_%j.o
#SBATCH -e /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_intelmpi_O_feature_fill_nan/test.bat_%j.e
#SBATCH --time=1:30:00
#SBATCH --partition=xjet
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake
module load nvhpc/22.2 impi/2022.3.0

set -x
export ESMF_MPIRUN=mpirun.srun
export ESMF_F90=mpinvf90
export ESMF_CXX=mpinvc++
export ESMF_C=mpinvc
export ESMF_DIR=/lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_intelmpi_O_feature_fill_nan/esmf
export ESMF_COMPILER=nvhpc
export ESMF_COMM=intelmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_intelmpi_O_feature_fill_nan/module-test.log
cd /lfs4/HFIP/hfv3gfs/Mark.Potts/esmf-tests/nvhpc_22.2_intelmpi_O_feature_fill_nan/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc.log
