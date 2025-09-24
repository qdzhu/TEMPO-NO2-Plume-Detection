#!/bin/bash
#
# filename: slurm_script
#
# Example SLURM script to run a job on the svante cluster.
# The lines beginning #SBATCH set various queuing parameters.
#
# Set name of submitted job

#SBATCH -J trend

#
# Ask for 3 cores

#SBATCH --ntasks=16
#SBATCH --nodes=1
#SBATCH --partition=edr
#SBATCH --mem=0

#
# Submit with maximum 24 hour walltime HH:MM:SS

#SBATCH -t 24:00:00

#
echo 'Your job is running on node(s):'
echo $SLURM_JOB_NODELIST
echo 'Cores per node:'
echo $SLURM_TASKS_PER_NODE

#module load anaconda3/2023.07
source activate cesm2-def

python download.py --short_name TEMPO_NO2_L3 --start 2024-09-22 --end 2025-06-01 --output_dir ./NO2_L3/
#python calc_aquaplanet_chem_annual.py -o Zonal_CO_SymZonal
exit 0

