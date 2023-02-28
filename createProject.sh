#!/bin/bash

projName=$1
pyVersion=$2

# create directories
mkdir -p $projName/config $projName/data/raw $projName/data/processed $projName/models $projName/notebooks $projName/utils

# create empty YAML files
touch $projName/config/params.yaml $projName/config/model.yaml

# create empty Python files
touch $projName/models/model_architecture.py $projName/utils/helper_functions.py

# create empty Jupyter notebooks
touch $projName/notebooks/exploratory_data_analysis.ipynb $projName/notebooks/model_evaluation.ipynb

# create environment.yml file
cat <<EOT >> $projName/environment.yml
name: $projName
channels:
  - defaults
  - conda-forge
dependencies:
  - python="$pyVersion"
  - pip
  - pip:
    - -r requirements.txt
EOT

# create empty requirements.txt file
touch $projName/requirements.txt

# create README.md file
cat <<EOT >> $projName/README.md
# Project Structure

This is a Python AI project structured in the following way:

"$projName"/
|-- config/
| |-- params.yaml
| |-- model.yaml
|-- data/
| |-- raw/
| |-- processed/
|-- models/
| |-- <model_architecture>.py
|-- notebooks/
| |-- <exploratory_data_analysis>.ipynb
| |-- <model_evaluation>.ipynb
|-- utils/
| |-- <helper_functions>.py
|-- requirements.txt
|-- environment.yml
|-- README.md
|-- main.py
|-- train.py


The \`config\` directory contains the configuration files for the project, such as hyperparameters and model architecture.

The \`data\` directory contains the input and processed data for the project.

The \`models\` directory contains the Python code defining the model architecture.

The \`notebooks\` directory contains the Jupyter notebooks used for exploratory data analysis and model evaluation.

The \`utils\` directory contains helper functions for the project.

The \`requirements.txt\` file lists the required Python packages to run the project.

The \`environment.yml\` file lists the required packages to create the conda environment.

The \`README.md\` file provides a high-level overview of the project structure.

The \`main.py\` file is the entry point of the project, and the `train.py` file contains the training routine for the model.
EOT


echo "Project structure created successfully!"

echo "Note that the script creates an environment.yml file which lists the required packages to create the conda environment.
You can create the environment by running the following command:
conda env create -f environment.yml
This will create a new conda environment named my_project_env with the required packages."