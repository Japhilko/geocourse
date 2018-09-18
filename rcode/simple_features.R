#' ---
#' title: "Das Paket sf"
#' author: "Jan-Philipp Kolb"
#' date: "12 9 2018"
#' output: beamer_presentation
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

#' 
#' ## 
#' 
## ------------------------------------------------------------------------
library(sf)

#' 
#' - [**Vignette für das Paket `sf`**](https://cran.r-project.org/web/packages/sf/vignettes/sf3.html)
#' 
#' 
#' ## Die Grenze von Mannheim
#' 
## ------------------------------------------------------------------------
library(osmdata)
bb_poly <- getbb(place_name = "Mannheim", 
                 format_out = "polygon")

#' 
#' 
#' 
#' ## Information in simple feature umwandeln
#' 
## ------------------------------------------------------------------------
library(dplyr)
ls <- st_linestring(bb_poly)
(sfc <- st_sfc(ls))

library(tmap)
qtm(sfc)

#' 
#' ## Straßen für Mannheim
#' 
## ------------------------------------------------------------------------
bb <- getbb(place_name = "Mannheim") 
q <- opq(bbox = bb)
q <- add_osm_feature (q, key = 'highway',value = "primary")

#' 
#'   - hier spielt die Musik:
## ----eval=F--------------------------------------------------------------
## osmdata_xml(q, '../data/Amsterdam_highway_primary.osm')
## ?sf::st_read

#' 
## ------------------------------------------------------------------------
dat <- sf::st_read ('../data/Amsterdam_highway_primary.osm',
                    layer="points",
                    quiet = TRUE)

#' 
#' 
#' <!--
#' https://r-spatial.github.io/sf/reference/st_as_sf.html
#' https://r-spatial.github.io/sf/reference/st_read.html
#' https://r-spatial.github.io/sf/articles/sf1.html
#' 
#' -->
