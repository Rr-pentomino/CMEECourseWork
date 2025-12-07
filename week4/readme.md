# Week 4 - Biological Bootcamp

## Project Description
This repository contains the scripts and resources for the fourth week of the Biological Bootcamp module. The focus of this week is on data wrangling, regression analysis, and visualizing ecological datasets.

## Languages
- **R** (Tested with R 4.0+)

## Dependencies
- **R** (Version 4.0 or higher)
- **ggplot2** (for plotting)
- **dplyr** (for data manipulation)
  - Install via:  
    ```r
    install.packages(c("ggplot2", "dplyr"))
    ```

## Installation
1. **Clone this repository** to your local machine:
 
 2. cd week4/code

3. install.packages(c("ggplot2", "dplyr"))

## Project Structure
- `week4/code`: Contains all R scripts used for this module.
  - `DataWrangTidy.R`: Wrangles the **Pound Hill** dataset, transforming it from wide to long format and performing data manipulation tasks.
  - `Girko.R`: Demonstrates the Girko circle for eigenvalues of a random matrix.
  - `MyBars.R`: Creates customized bar plots with multiple layers using **ggplot2**.
  - `MyLinReg.R`: Performs linear regression and visualizes the results with a customized plot.
  - `PP_Dists.R`: Creates distribution plots for predator-prey mass data, and generates subplot PDFs.
  - `PP_Regress.R`: Performs regression analysis on predator and prey mass and saves the results.
  - `PP.R`: Performs various plots and transformations on predator-prey mass data.

- `week4/data`: Contains data files used in the scripts.
  - `EcolArchives-E089-51-D1.csv`: Ecological data for predator-prey mass analysis.
  - `PoundHillData.csv`: Raw data for the Pound Hill dataset.
  - `PoundHillMetaData.csv`: Metadata associated with the Pound Hill dataset.

- `week4/Results`: Output folder for storing the results of analyses and saved files.

`week4/sandbox`: A working directory for experiments.

### Setup
To ensure the scripts are executable, run the following:
```bash
chmod +x *.R

### Usage
To execute any script, run:
source("script_name.R")
Example:
To run MyLinReg.R:
source("MyLinReg.R")

## Author and Contact
- **Ahmet Selim Esmer** (ase225@ic.ac.uk)
