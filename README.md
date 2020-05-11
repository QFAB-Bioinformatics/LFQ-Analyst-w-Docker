# LFQ Analyst with Docker #
LFA-Analyst is a shiny app for analysing label-free quantative proteomics. Docker is a platform and tool for building, distributing, and running Docker Container. LFQ-Analyst is made available in the Docker for easy distribution. 
- Official LFQ-Analyst Site [demo](https://bioinformatics.erc.monash.edu/apps/LFQ-Analyst/)
- Source Code [Github](https://github.com/MonashBioinformaticsPlatform/LFQ-Analyst)

# How to Cite LFQ-Analyst? #
Please Cite: Shah AD, Goode RJA, Huang C, Powell DR, Schittenhelm RB. LFQ-Analyst: An easy-to-use interactive web-platform to analyze and visualize proteomics data preprocessed with MaxQuant. DOI: 0.1021/acs.jproteome.9b00496


LFQ Analyst with Docker Configuration

To run the app:

* type git clone https://github.com/QFAB-Bioinformatics/LFQ-Analyst-w-Docker (if you haven’t already)
* navigate to the LFQ-Analyst-w-Docker directory
* type _make run_
* two windows will open in firefox (if available)
* one browser window will open RStudio Server at http://localhost:8080
* the second browser window will open Shiny Server at http://localhost:3838/users/rstudio
* click on LFQ-Analyst in the second window to open the shiny app.

### Note ###
The original Docker from LFQ-Analyst project has been modified and merged with the Docker file from this [gapminder-pipeline](https://github.com/chapmandu2/gapminder-pipeline/tree/master/02-shiny-app) example. The gapminder-pipeline comes with _Makefile_ for building the docker image. 

This LFQ-Analyst Shinny App with Docker has been tested under CentOS 7.
