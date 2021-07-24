#!/bin/bash

# Project account key and queue
#SBATCH --account=nn9560k --qos=preproc 
## Wall time limit:
#SBATCH --time=0:24:0
## Job name
#SBATCH --job-name=metgrid_noresm2-mm
## Number of nodes needed
#SBATCH --nodes=1
#SBATCH --core-spec=16

## Number of tasks to start on each node (max is 2 sockets x 16 cores =32)
#SBATCH --ntasks-per-node=8
## Number of sockets on each node (max is 2)
#--SBATCH --sockets-per-node=2
## Number of cores per socket (max is 16)
#--SBATCH --cores-per-socket=16
## Over ride default settings for islands and queues
#--SBATCH --switches=4
#SBATCH --mem=10G  # justere up

## Recommended safety settings:
set -o errexit # Make bash exit on any error
set -o nounset # Treat unset variables as errors

## Software modules
#module load intel/2016a
#module load netCDF/4.4.0-intel-2016a
#module load netCDF-Fortran/4.4.3-intel-2016a 

module load netCDF-Fortran/4.5.3-iompi-2020b
module load netCDF/4.7.4-iompi-2020b
module load HDF5/1.10.7-iompi-2020b

## go to run directory 
## Make sure output is copied back after job finishess
savefile geo_em* 

## Run the application
#srun --mpi=pmi2 metgrid.exe >& metgrid.log
mpirun metgrid.exe >& metgrid.log
