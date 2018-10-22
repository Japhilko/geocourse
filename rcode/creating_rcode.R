# Jan-Philipp Kolb
# Sat Sep 15 10:21:51 2018

#-------------------------------------------------#
# Installing necessary packages
#-------------------------------------------------#

necpackages <- c("knitr","rmarkdown","tidyverse")
for (i in 1:length(necpackages)){
  if (!require(necpackages[i])){
    install.packages(necpackages[i])    
  }
  library(necpackages[i])
}

#-------------------------------------------------#
# Load libraries
#-------------------------------------------------#

library(knitr)
library(rmarkdown)
library(lme4)

#-------------------------------------------------#
# Define paths
#-------------------------------------------------#

main_path <- "D:/github/geocourse/" # zu Hause
main_path <- "D:/Daten/GitHub/geocourse/"
slide_path <- paste0(main_path,"slides/")
rcode_path <- paste0(main_path,"rcode/")

#-------------------------------------------------#
# Parts of the presentation
#-------------------------------------------------#
setwd(slide_path)
dirnamen <- dir()
presparts <- dirnamen[grep(".Rmd",dirnamen)]


# setwd("D:/gitlab/IntroDataAnalysis/rcode/")
setwd(rcode_path)

for (i in 1:length(presparts)){
  purl(paste0("../slides/",presparts[i]),documentation = 2)  
}

#-------------------------------------------------#
# Creating pdf slides
#-------------------------------------------------#

# setwd("D:/Daten/GitLab/IntroDataAnalysis/slides")
setwd(slide_path)


for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "beamer_presentation")
}


for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "md_document")
}

for (i in 1:length(presparts)){
  rmarkdown::render(presparts[i], "all")
}


# B1_DataProcessing


#-------------------------------------------------#
# Create rcode in course
#-------------------------------------------------#

setwd(rcode_path)

purl("../slides/A3_DataPUF.Rmd",documentation = 2)
purl("../slides/A4_tmap.Rmd",documentation = 2)
purl("../slides/A5_Choroplethen.Rmd",documentation = 2)
purl("../slides/A6_Shapefiles.Rmd",documentation = 2)
purl("../slides/A7_spdep.Rmd",documentation = 2)

purl("../slides/B1_OpenStreetMap.Rmd",documentation = 2)
purl("../slides/B2_Geokodierung.Rmd",documentation = 2)
purl("../slides/B3_osm_mainapi.Rmd",documentation = 2)
purl("../slides/B4_Overpass.Rmd",documentation = 2)
purl("../slides/B5_osmdata.Rmd",documentation = 2)

#-------------------------------------------------#
# Install necessary packages
#-------------------------------------------------#


install.packages("lme4")

#-------------------------------------------------#
# Links
#-------------------------------------------------#


# https://rmarkdown.rstudio.com/authoring_quick_tour.html
# https://www.r-bloggers.com/function-to-simplify-loading-and-installing-packages/