# Week 3 - Biological Bootcamp

## Project Description
This repository contains the scripts and resources for the third week of the Biological Bootcamp module. In Week 3, the focus is on applying R for data analysis tasks like basic I/O operations, performing linear regressions, manipulating data structures, and more advanced topics like simulation modeling.


## Languages
- **R** (Tested with R 4.0+)

## Dependencies
- **R** (Version 4.0 or higher)
- **ggplot2** (for plotting)

## Installation
1. **Clone this repository** to your local machine:
 
2. cd week3/code

3. install.packages(c("ggplot2"))

## Project Structure
- `week3/code`: Contains all R scripts used for this module.
  - `break.R`: Script demonstrating the use of the `break` statement in a loop.
  - `basic_io.R`: Handles basic input/output operations like reading and writing CSV files.
  - `Florida.R`: Performs a permutation test to evaluate the correlation between year and temperature data.
  - `boilerplate.R`: A boilerplate R script template with a function example.
  - `TreeHeight.R`: Computes tree heights based on angle and distance data and saves the result.
  - `next.R`: Demonstrates the use of the `next` statement in a loop.
  - `Stochrickvect.R`: Runs a stochastic model for population dynamics and evaluates execution time.

- `week3/data`: Contains data files used in the scripts.
  - `KeyWestAnnualMeanTemperature.RData`: Dataset with temperature data.
  - `trees.csv`: Contains tree data used for height calculations and other analyses.

- `week3/Results`: Output folder for storing the results of analyses and saved files.

- `week3/sandbox`: A working directory for experiments.
  - Files for testing and experimenting with different R techniques.

### Setup
To ensure the scripts are executable, run the following:
```bash
chmod +x *.R

### Usage
To execute any script, run:
source("script_name.R")

Example:
To run break.R:
source("break.R")

## Author and Contact
- **Ahmet Selim Esmer** (ase225@ic.ac.uk)



