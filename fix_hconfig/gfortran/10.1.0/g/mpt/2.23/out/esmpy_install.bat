#!/bin/sh
module load gnu/10.1.0 mpt/2.23
module load netcdf/4.7.4
module load python/3.7.9

set -x
export ESMPY_DATA_DIR="/glade/work/theurich/esmf-test-data/grids"
export ESMF_DIR=/glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_mpt_g_fix_hconfig/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpt
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
cd /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_mpt_g_fix_hconfig/esmf
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_mpt_g_fix_hconfig
rm -rf esmpy_venv
python3 -m venv esmpy_venv
. esmpy_venv/bin/activate
cd /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_mpt_g_fix_hconfig/esmf/src/addon/esmpy
python3 -m pip install . 2>&1| tee /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_mpt_g_fix_hconfig/esmpy-install.log
make download 2>&1| tee /glade/scratch/theurich/ESMF-Nightly-Testing/gfortran_10.1.0_mpt_g_fix_hconfig/esmpy-download.log
deactivate
