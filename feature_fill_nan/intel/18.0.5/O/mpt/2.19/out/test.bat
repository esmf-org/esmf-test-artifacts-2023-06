#!/bin/sh -l
#PBS -N test.bat
#PBS -l walltime=3:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load intel/18.0.5 mpt/2.19
module load netcdf/4.6.3
module load python/3.7.9

set -x
export ESMPY_DATA_DIR="/glade/work/theurich/esmf-test-data/grids"
export ESMF_DIR=/glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpt_O_feature_fill_nan/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpt
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpt_O_feature_fill_nan/module-test.log
cd /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpt_O_feature_fill_nan/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc.log
ssh cheyenne6 /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpt_O_feature_fill_nan/esmpy_install.bat
cd /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpt_O_feature_fill_nan
. esmpy_venv/bin/activate
cd /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpt_O_feature_fill_nan/esmf/src/addon/esmpy
make test 2>&1| tee /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_mpt_O_feature_fill_nan/esmpy-test.log
deactivate
