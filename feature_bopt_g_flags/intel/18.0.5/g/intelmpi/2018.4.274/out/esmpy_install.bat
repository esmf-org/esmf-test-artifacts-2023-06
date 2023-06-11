#!/bin/sh
module load intel/18.0.5 impi/2018.4.274
module load netcdf/4.6.3
module load python/3.7.9

set -x
export ESMPY_DATA_DIR="/glade/work/theurich/esmf-test-data/grids"
export ESMF_DIR=/glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_intelmpi_g_feature_bopt_g_flags/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
cd /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_intelmpi_g_feature_bopt_g_flags/esmf
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_intelmpi_g_feature_bopt_g_flags
rm -rf esmpy_venv
python3 -m venv esmpy_venv
. esmpy_venv/bin/activate
cd /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_intelmpi_g_feature_bopt_g_flags/esmf/src/addon/esmpy
python3 -m pip install . 2>&1| tee /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_intelmpi_g_feature_bopt_g_flags/esmpy-install.log
make download 2>&1| tee /glade/scratch/theurich/ESMF-Nightly-Testing/intel_18.0.5_intelmpi_g_feature_bopt_g_flags/esmpy-download.log
deactivate
