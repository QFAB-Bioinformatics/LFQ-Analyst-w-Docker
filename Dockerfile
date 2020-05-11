FROM rocker/shiny-verse:3.5.2

# add shiny server
#RUN export ADD=shiny && bash /etc/cont-init.d/add
#RUN groupadd  shiny \
#    && useradd --gid shiny --shell /bin/bash --create-home shiny


## add rstudio user
RUN useradd rstudio \
    && echo "rstudio:rstudio" | chpasswd \
  	&& mkdir /home/rstudio \
    && chown rstudio:rstudio /home/rstudio \
	&& addgroup rstudio staff

#USER rstudio ## change to user rstudio only if necessary . this will cause chown (see below) to fail if this turns on


#RUN apt-get update && apt-get install -y libnetcdf-dev libcairo2-dev
RUN apt-get install -y libnetcdf-dev libcairo2-dev
RUN pkg-config --cflags cairo | export PKG_CONFIG_PATH=/usr/local/opt/libffi/lib/pkgconfig
RUN Rscript -e 'install.packages(c("devtools", "mvtnorm", "tmvtnorm","impute", "pcaMethods", "imputeLCMD", "plotly", "DT", "BiocInstaller","testthat", "RColorBrewer", "shiny","shinyalert","shinydashboard", "shinyjs", "svglite"), dependencies=TRUE)'
RUN Rscript -e 'BiocInstaller::biocLite(pkgs=c("DEP", "SummarizedExperiment", "limma", "ComplexHeatmap"))'

COPY ./shiny-server.conf /etc/shiny-server/shiny-server.conf

COPY ./LFQ-Analyst /home/rstudio/ShinyApps/LFQ-Analyst/

RUN chown -hR rstudio:rstudio /home/rstudio/ShinyApps
