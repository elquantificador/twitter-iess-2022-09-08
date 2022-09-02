# Twitter IESS Analysis

This **repository** includes all the files and scripts to reproduce the analysis of tweets on the Ecuadorian Social Security Institute (IESS).

**Keywords:** Twitter, API, IESS, Ecuador, word cloud, public opinion.

### Requisites
- `R` and `RStudio` are required for reproducing the analysis. Further documentation [here](https://www.r-project.org).
- Apart from installing the necessary packages listed in `twitter_analysis.R`, `Java` must be installed and configured within `RStudio`. For this, first download and install Java from this [link](https://java.com/en/download/manual.jsp). Then open Windows' [`cmd`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/cmd) and excecute the following code line:

```
setx PATH "C:\Program Files\Java\jre1.8.0_211\bin\server;%PATH%"
```

Finally set `Java` environment running the following command inside the `RStudio`'s console:

``` r
Sys.setenv(JAVA_HOME = "")
```
For more details on this process, please visit [StackOverflow](https://stackoverflow.com/questions/29522088/rjava-install-error-java-home-cannot-be-determined-from-the-registry).

## Reproducing the analysis

### Step 1

Check that the following files are in the `data` folder:
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
- **Report 2:** This analysis was created for publication in [El Quantificador](https://elquantificador.org/). For this purpose, there is a short spanish version inside the `report_spanish` folder called `report.Rmd`. There are also its respective `.html` compilation, bibliography and references styling files. This report focuses on a mass audience.
