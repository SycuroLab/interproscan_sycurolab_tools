#!/bin/bash
#SBATCH --job-name="interproscan_properties_setup_sbatch_job"
#SBATCH --time=7-00:00:00
#SBATCH --partition=cpu2019,cpu2021,cpu2022,cpu2023,synergy
#SBATCH --cpus-per-task=1
#SBATCH --mem=80G
#SBATCH --output=run_interproscan_properties_setup_sbatch_job.%A.out
#SBATCH --error=run_interproscan_properties_setup_sbatch_job.%A.err

# Get the bashrc information for conda.
source ~/.bashrc

# Activate the interproscan conda environment.
conda activate interproscan_env

cd /bulk/IMCshared_bulk/shared/shared_software/interproscan/interproscan-5.65-97.0
python3 setup.py -f interproscan.properties


