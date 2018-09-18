#' ---
#' title: "osmdata Beispiel"
#' author: "Jan-Philipp Kolb"
#' date: "23 August 2018"
#' output: beamer_presentation
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

#' 
#' ## [Szeneviertel in Deutschland](http://www.spiegel.de/wirtschaft/soziales/deutschland-das-sind-die-szeneviertel-in-den-grossstaedten-a-1223648.html)
#' 
## ------------------------------------------------------------------------
c("Berlin Friedrichshain","Berlin Kreuzberg","Berlin Neukölln", "Hamburg Schanzenviertel","Hamburg Karoviertel", "Hamburg St. Pauli","München Glockenbachviertel","München Westend","Köln Ehrenfeld","Köln Belgisches Viertel","Frankfurt Bahnhofsviertel","Stuttgart Süd","Stuttgart Heusteigviertel","Stuttgart West","Düsseldorf Flingern")

c("Düsseldorf Kiefernstraße","Berlin Bergmannstraße","Berlin Karl-Marx-Straße","Berlin Maybachufer","Köln Brüsseler Platz","Stuttgart Tübinger Straße")

#' 
## ------------------------------------------------------------------------
library(osmdata)
city <- 'Stuttgart'
bb <- getbb(city)
q <- opq(bbox = bb)

#' 
#' ##
#' 
## ------------------------------------------------------------------------
library(tmap)
bb_poly <- getbb(place_name = "Frankfurt", 
                 format_out = "polygon")
plot(bb_poly)

#' 
#' 
#' 
#' 
#' ## Information - `r city`
#' 
## ----eval=F--------------------------------------------------------------
## keyI <- 'amenity'
## q <- opq (bbox = city)
## q <- add_osm_feature (q, key = keyI)
## osmdata_xml (q, paste0("../data/",city,"_",keyI,".osm"))

#' 
#' 
#' ## Was dahinter steckt:
#' 
## ----eval=F--------------------------------------------------------------
## dat <- sf::st_read (paste0("../data/",city,"_",keyI,".osm"),
##                     layer = 'points',
##                     quiet = TRUE)

#' 
#' 
## ------------------------------------------------------------------------
head(dat)

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## ?sf::st_read

#' 
#' 
#' 
#' ## Plot `geometry`
#' 
#' - [**Plotting Simple Features**](https://r-spatial.github.io/sf/articles/sf5.html)
#' 
## ------------------------------------------------------------------------
library(sf)

plot(st_geometry(dat$geometry))

#' 
#' 
#' ## Links
#' 
#' - [Manipulating Simple Feature Geometries](https://cran.r-project.org/web/packages/sf/vignettes/sf3.html)
#' 
#' 
