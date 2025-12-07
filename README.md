#  Biological Computing Bootcamp Repository

## Description

This repository is the companion to The Multilingual Quantitative Biologist (MulQuaBio) materials, covering the four-week **Biological Computing Bootcamp** module.

It provides a clean project scaffold, ready-to-run scripts, and notes to help you work through Unix, R, and Python exercises in a reproducible way. The repository mirrors the course's workflow conventions, keeps your work organized, and focuses on applying computational skills to biological and ecological datasets.

---

## Languages and Technologies

This bootcamp utilizes a multilingual approach for computational biology:

* **Bash** (Unix shell) — Tested on macOS default bash/zsh.
* **Python 3** — Used for sequence analysis and general programming.
* **R** — Used for statistical analysis, modeling, and advanced data visualization.

## Dependencies and Installation

### Core Dependencies

| Language | Dependency | Purpose | Installation |
| :--- | :--- | :--- | :--- |
| **Bash** | Homebrew | Package management (macOS) | N/A |
| **Python** | `ipython3` | Interactive computing | `pip install ipython` |
| **R** | R (4.0+) | Core statistical environment | `RStudio` |

### R Packages (Used in Weeks 3 & 4)

The following R packages are required for the statistical and visualization scripts:

* **Week 3:** `minpack.lm` (for non-linear regression)
* **Week 4:** `ggplot2` (for plotting) and `dplyr` (for data manipulation)

Install via:

```r
install.packages(c("ggplot2", "dplyr", "minpack.lm"))
````

### Repository Setup

1.  **Download/Clone:** Download the repository as a ZIP and unzip locally.

2.  **Dependencies:** Ensure all language and package dependencies listed above are installed.

3.  **Permissions:** To ensure the R scripts are executable:

    ```bash
    # Run this from within the code/ directory
    chmod +x *.R
    ```

-----

Project Structure and Conventions
Directory Structure

The repository is organized into four main week directories, with supporting files at the top level:

CMEECourseWork.../
├── week1/
│   ├── code/
│   ├── data/
│   ├── results/
│   ├── sandbox/
│   └── readme.md
├── week2/
│   ├── code/
│   ├── data/
│   ├── results/
│   ├── sandbox/
│   └── readme.md
├── week3/
│   ├── code/
│   ├── data/
│   ├── results/
│   ├── sandbox/
│   └── readme.md
├── week4/
│   ├── code/
│   ├── data/
│   ├── results/
│   ├── sandbox/
│   └── readme.md
├── .gitignore
├── .gitmodules
├── README.md                   (This main file)
└── temporary.tmp

### Conventions

  * **Data Integrity:** Never edit raw inputs in the `data/` directory.
  * **Output:** Write all script outputs to the `results/` directory.
  * **Portability:** Use **relative paths only** (portable between machines).
  * **Modularity:** Keep scripts small, modular, and documented.

-----

## Module Breakdown

### Week 1: Unix, Shell Scripting, and File I/O

  * **Focus:** Core Unix commands, shell scripting, and processing file inputs and outputs.
  * **Key Topics:** File redirection, piping, shell variables, and using `sed` and `grep`.
  * **Code Example:** `boilerplate.sh` (Shell script template).

### Week 2: Python Programming and Biological Sequence Analysis

  * **Focus:** Introduction to Python for biological data, focusing on practical scripts and modules.
  * **Key Topics:** Sequence alignment, control flow (`if`/`else`), loops, dictionaries, and command line arguments.
  * **Code Example:** `align_seqs.py` (Performs sequence alignment and defines a function for alignment).
  * **Data:** `sequences.csv` (Contains sequence data).

### Week 3: R Programming for Statistical Analysis and Modeling

  * **Focus:** Statistical analysis, I/O operations, linear and non-linear regression using the R language.
  * **Key Topics:** Reading and writing files, implementing linear regression, using control flow in R, and simulation (e.g., Lotka-Volterra).
  * **Code Example:** `Min_Max.R` (Script for finding minimum/maximum and linear regression).
  * **Data:** `Mass.csv` (Input data for regression).

### Week 4: Data Wrangling and Advanced Visualization with R

  * **Focus:** Data cleaning, transformation, and advanced visualization of ecological datasets.
  * **Key Topics:** Data wrangling with `dplyr`, creating custom plots with `ggplot2`, and regression analysis on predator-prey mass.
  * **Key Scripts:**
      * `DataWrangTidy.R`: Wrangles the **Pound Hill** dataset.
      * `MyLinReg.R`: Performs and visualizes linear regression.
      * `PP_Regress.R`: Performs regression analysis on predator and prey mass.
  * **Data:** `PoundHillData.csv` and `EcolArchives-E089-51-D1.csv`.

-----

## Author and Contact

**Ahmet Selim Esmer**

  * **Email:** ase225@ic.ac.uk
