#' ---
#' title: "Rasterdaten"
#' author: "Jan-Philipp Kolb"
#' date: "23 Oktober 2018"
#' output:
#'   beamer_presentation: 
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: tango
#'     keep_tex: yes
#'     theme: CambridgeUS
#'   slidy_presentation: default
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

#' 
#' ## 
#' 
## ----eval=FALSE, include=FALSE-------------------------------------------
## install.packages("rnaturalearth")

#' 
#' 
## ------------------------------------------------------------------------
library(rnaturalearth)
usa = ne_countries(country = "United States of America") # United States borders
class(usa)

#' 
#' ## [](https://geocompr.robinlovelace.net/read-write.html)
#' 
## ------------------------------------------------------------------------
library(sf)
usa_sf <- st_as_sf(usa)
plot(usa_sf)

#' 
#' ## [Indikatoren vom Institut für ökologische Raumforschung (IÖR)](http://www.ioer-monitor.de/)
#' 
#' 
#' ![](figure/ioermonitor.PNG)
#' 
#' <!--
#' http://www.ioer-monitor.de/indikatoren/#c1793
#' https://monitor.ioer.de/frontend/data/anleitung_import_qgis.pdf
#' https://monitor.ioer.de/?raeumliche_gliederung=raster&klassenanzahl=7&opacity=0.8&zoom=6&lat=51.33061163769853&lng=10.458984375000002&ind=B02DT&baselayer=webatlas&time=2011&raumgl=bld&klassifizierung=haeufigkeit&darstellung=auto&ags_array=&glaettung=0&rasterweite=0&
#' http://www.ioer-monitor.de/indikatoren/#c1793
#' -->
