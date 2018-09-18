#' ---
#' title: "Overpass"
#' author: "Jan-Philipp Kolb"
#' date: "29 August 2018"
#' output: html_document
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

#' 
#' ## Das Paket `osmplotr`
#' 
## ------------------------------------------------------------------------
library("osmplotr")
library("osmdata")

#' 
#' ## Beispiel Kindergärten in Mannheim
#' 
## ----eval=F--------------------------------------------------------------
## bbox <- getbb("Mannheim")
## dat_osm <- extract_osm_objects(key='building',
##                               value="kindergarten",
##                               bbox=bbox)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## save(dat_osm,file="../data/overpass_building_kindergarten_Mannheim.RData")

#' 
## ----echo=F--------------------------------------------------------------
load("../data/overpass_building_kindergarten_Mannheim.RData")

#' 
#' 
#' ## Eine Hintergrundkarte besorgen
#' 
## ----eval=F--------------------------------------------------------------
## library(ggmap)
## MA_map <- qmap("Mannheim",zoom=12)

#' 
## ----echo=F,eval=F-------------------------------------------------------
## save(MA_map,file="../data/MA_map12.RData")

#' 
## ----echo=F--------------------------------------------------------------
load("../data/MA_map12.RData")

#' 
## ----echo=F,eval=F-------------------------------------------------------
## MA_map <- qmap("Mannheim")

#' 
## ----echo=F,eval=F-------------------------------------------------------
## save(MA_map,file="../data/MA_map.RData")

#' 
#' ##
#' 
## ------------------------------------------------------------------------
library(sf)

#' 
## ----eval=F--------------------------------------------------------------
## ?st_centroid

#' 
#' 
#' - [Den Mittelpunkt für die Geometrien bekommen](https://stackoverflow.com/questions/46176660/how-to-calculate-centroid-of-polygon-using-sfst-centroid)
#' 
## ------------------------------------------------------------------------
centr <- st_centroid(dat_osm$geometry)

#' 
#' 
#' 
#' 
#' ##
#' 
## ------------------------------------------------------------------------
MA_map +
geom_point(aes(x = lon, y = lat),
data = dat_osm)

#' 
