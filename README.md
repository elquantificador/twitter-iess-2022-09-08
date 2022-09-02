# Twitter IESS Analysis

This **repository** includes all the files and scripts to reproduce the analysis of tweets with respect to the IESS.

**Keywords:** Twitter, API, IESS, Ecuador, word cloud, public opinion.

* R (<https://www.r-project.org>) is required for reproducing the analysis.
 
## Reproducing the analysis

### Step 1

Check that the following files are stored in the `data` folder:
- `provincias.dbf`
- `provincias.shp`
- `provincias.shx`
- `tweets_iess_list.RData`

`provincias.dbf`, `provincias.shp` and `provincias.shx` are used to plot `map.png`.

`tweets_iess_list.RData` is the source dataset for performing the analysis.

### Step 2
To reproduce the analysis, run `twitter_analysis.R` from `code` folder.

- The analysis will be automatically reproduced.
- Three images will be created/overwriten inside `images`.

## Reports

This repository has **two** reports, both within the `report` folder.

- **Report 1:** The first report is the `report.pdf` file. To replicate it: download, unzip and compile `report.zip` using `LaTex`.
- **Report 2:** This analysis was created for publication in [El Quantificador](https://elquantificador.org/). For this purpose there is a short spanish version of the report inside the `report_spanish` folder called `report.Rmd` and its respective `.html` compilation. This report focuses on a mass audience.
