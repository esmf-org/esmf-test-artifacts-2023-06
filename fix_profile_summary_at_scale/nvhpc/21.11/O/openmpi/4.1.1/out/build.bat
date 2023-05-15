#!/bin/sh -l
#PBS -N build.bat
#PBS -l walltime=1:00:00
#PBS -q regular
#PBS -A p93300606
#PBS -l select=1:ncpus=36:mpiprocs=36
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load python/3.7.9
module load nvhpc/21.11 openmpi/4.1.1
module load netcdf/4.8.1

set -x
export ESMF_DIR=/glade/scratch/theurich/ESMF-Nightly-Testing/nvhpc_21.11_openmpi_O_fix_profile_summary_at_scale/esmf
export ESMF_COMPILER=nvhpc
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/scratch/theurich/ESMF-Nightly-Testing/nvhpc_21.11_openmpi_O_fix_profile_summary_at_scale/module-build.log
cd /glade/scratch/theurich/ESMF-Nightly-Testing/nvhpc_21.11_openmpi_O_fix_profile_summary_at_scale/esmf
set -o pipefail
make info 2>&1| tee ../info.log
make -j 36 2>&1| tee ../build.log
