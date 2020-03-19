#!/bin/bash
#
# Re-run the code locally, to re-create the data and figure.
#
# Usage:
#
#   ./scripts/rerun.sh
#
#SBATCH --partition=gelifes
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=1
#SBATCH --mem=10G
#SBATCH --job-name=pirex22
#SBATCH --output=example_22.log
#
rm -rf example_22
rm errors.png
time Rscript example_22.R
zip -r pirouette_example_22.zip example_22 example_22.R scripts errors.png

