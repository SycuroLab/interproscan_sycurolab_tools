#!/bin/bash
#SBATCH --job-name="interproscan_sbatch_job"
#SBATCH --time=7-00:00:00
#SBATCH --partition=cpu2019,cpu2021,cpu2022,cpu2023,synergy
#SBATCH --cpus-per-task=8
#SBATCH --mem=100G
#SBATCH --output=run_interproscan_sbatch_job.%A.out
#SBATCH --error=run_interproscan_sbatch_job.%A.err

# Get the bashrc information for conda.
source ~/.bashrc

# Activate the interproscan conda environment.
conda activate interproscan_env

# The protein fasta file to annotate.
fasta_infile="/bulk/IMCshared_bulk/shared/shared_software/interproscan/interproscan-5.73-104.0/test_all_appl.fasta"

# The number of threads to use for interproscan.
num_threads=8

# The output directory to write the interproscan output.
output_dir="/bulk/IMCshared_bulk/shared/shared_software/interproscan/interproscan-5.73-104.0/testing"

# Make the directory output_dir if it does not already exist.
mkdir -p $output_dir

# The path to the interproscan.sh script.
software_path="/bulk/IMCshared_bulk/shared/shared_software/interproscan/interproscan-5.73-104.0"

# Run the interproscan.sh command.
echo "${software_path}/interproscan.sh --input ${fasta_infile} --iprlookup -goterms --cpu ${num_threads} --output-dir ${output_dir}"
${software_path}/interproscan.sh --input ${fasta_infile} --iprlookup -goterms --cpu ${num_threads} --output-dir ${output_dir}

