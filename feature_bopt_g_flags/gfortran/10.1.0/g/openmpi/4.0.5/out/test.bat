#!/bin/sh -l
#PBS -N test.bat
#PBS -l walltime=2:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load gnu/10.1.0 openmpi/4.0.5
module load netcdf/4.7.4
module load python/3.7.9

set -x
export ESMPY_DATA_DIR="/glade/work/theurich/esmf-test-data/grids"
export ESMF_DIR=/glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_g_feature_bopt_g_flags/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_g_feature_bopt_g_flags/module-test.log
cd /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_g_feature_bopt_g_flags/esmf
make install 2>&1| tee ../install.log
make all_tests 2>&1| tee ../test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee ../nuopc.log
ssh cheyenne6 /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_g_feature_bopt_g_flags/esmpy_install.bat
cd /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_g_feature_bopt_g_flags
. esmpy_venv/bin/activate
cd /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_g_feature_bopt_g_flags/esmf/src/addon/esmpy
make test 2>&1| tee /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_openmpi_g_feature_bopt_g_flags/esmpy-test.log
deactivate
