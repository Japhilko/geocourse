#' ---
#' title: "Das osmdata Paket"
#' author: "Jan-Philipp Kolb"
#' date: "18 Juni 2018"
#' output: beamer_presentation
#' ---
#' 
## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(echo = T,cache=T,eval=T)

#' 
#' ## [Das `osmdata` Paket](https://github.com/ropensci/osmdata)
#' 
#' ![](figure/osmdatatitle.png)
#' 
#' ## Das `osmdata` Paket
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("osmdata")

#' 
#' 
## ------------------------------------------------------------------------
library(osmdata)

#' 
## ----eval=F--------------------------------------------------------------
## citation("osmdata")

#' 
#' 
#' ## Einen Rahmen definieren um Daten zu bekommen
#' 
#' - Der Rahmen kann entweder erstellt werden, indem die Koordinaten angegeben werden:
#' 
## ----opq,eval=F----------------------------------------------------------
## q <- opq(bbox = c(52.3, 4.7, 52.4, 5.1))

#' 
#' - oder indem man den Befehl `getbb` verwendet:
#' 
## ----eval=F--------------------------------------------------------------
## bb <- getbb('Amsterdam')

#' 
#' - Befehl `opq` - eine Overpass Anfrage erstellen
#' 
## ------------------------------------------------------------------------
q <- opq(bbox = bb)

#' 
#' - Als Ergebnis bekommt man aber noch keine Daten
#' 
#' ## Die Grenze von Mannheim 
#' 
## ------------------------------------------------------------------------
bb_poly <- getbb(place_name = "Amsterdam", 
                 format_out = "polygon")
library(tmap)
qtm(bb_poly)

#' 
#' 
#' ## Einrichtungen (amenity) in Amsterdam
#' 
#' - alle benannten Objekte
#' - die meisten sind hier zu finden:
#' 
#' https://wiki.openstreetmap.org/wiki/Map_Features
#' 
#' - Achtung, wenn man bspw. alle Objekte mit dem Schlüssel `amenity` für eine Stadt heraussucht, bekommt man einen recht großen Datensatz
#' 
## ----eval=F--------------------------------------------------------------
## q <- add_osm_feature (q, key = 'amenity')
## osmdata_xml(q, '../data/Amsterdam_amenity.osm')

#' 
#' ## 
#' 
#' - [OSM map features](https://wiki.openstreetmap.org/wiki/Map_Features#Highway)
#' 
## ----eval=F--------------------------------------------------------------
## q <- add_osm_feature (q, key = 'amenity',value = "bicycle_parking")
## osmdata_xml(q, '../data/Amsterdam_amenity_bicycle_parking.osm')

#' 
## ------------------------------------------------------------------------
dat <- sf::st_read ('../data/Amsterdam_amenity_bicycle_parking.osm', 
                    layer = 'points', 
                    quiet = TRUE)

#' 
#' ## 
#' 
## ------------------------------------------------------------------------
library(tmap)
qtm(dat)

#' 
#' 
#' 
#' ## Sehen was dahinter steckt
#' 
## ----eval=F--------------------------------------------------------------
## dat <- sf::st_read ('../data/Amsterdam_amenity.osm',
##                     layer = 'points',
##                     quiet = TRUE)

#' 
#' 
#' 
#' 
#' 
#' 
#' 
## ----eval=F--------------------------------------------------------------
## nrow(dat)
## names(dat)

#' 
#' ## Bar`s in Mannheim
#' 
## ----eval=F--------------------------------------------------------------
## ?add_osm_feature

#' 
## ----eval=F--------------------------------------------------------------
## q <- opq (bbox = 'Mannheim')
## q <- add_osm_feature (q, key ="amenity",value = 'bar')
## osmdata_xml (q, 'data/Mannheim_bar.osm')

#' 
## ------------------------------------------------------------------------
dat_bar <- sf::st_read ('../data/Mannheim_bar.osm', 
                        layer = 'points', quiet = TRUE)

#' 
#' ## Bus stations in Amsterdam
#' 
## ----eval=F--------------------------------------------------------------
## q <- opq (bbox = 'Amsterdam')
## q <- add_osm_feature (q, key ="amenity",
##                       value = 'bus_station')
## osmdata_xml (q, 'data/Amsterdam_bus_station.osm')

#' 
## ------------------------------------------------------------------------
dat_bus <- sf::st_read ('../data/Amsterdam_bus_station.osm', 
                        layer = 'points', quiet = TRUE)
nrow(dat_bus)

#' 
## ----eval=F--------------------------------------------------------------
## ?sf::st_read

#' 
#' 
#' ## An alternative
#' 
#' - [Main vignette `osmdata`](https://github.com/ropensci/osmdata/blob/master/vignettes/osmdata.Rmd)
#' - [OpenStreetMap Data Structure](https://cran.r-project.org/web/packages/osmdata/vignettes/osm-sf-translation.html)
#' 
## ----eval=F--------------------------------------------------------------
## q <- opq (bbox = 'Amsterdam')
## q <- add_osm_feature (q, key ="public_transport",
##                       value = 'station')
## osmdata_xml (q, '../data/Amsterdam_bus_pubtrans.osm')

#' 
## ------------------------------------------------------------------------
dat_bus <- sf::st_read ('../data/Amsterdam_bus_pubtrans.osm', 
                        layer = 'points', quiet = TRUE)
nrow(dat_bus)

#' 
#' <!--
#' als layer getestet: area, polygon
#' -->
#' 
#' ## Further information about public transport
#' 
#' ### Stop area
#' 
## ----eval=F,echo=F-------------------------------------------------------
## q <- add_osm_feature (q, key ="public_transport",
##                       value = 'stop_area')
## osmdata_xml (q, '../data/Amsterdam_pubtrans_stoparea.osm')

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## q <- add_osm_feature (q, key ="railway",value = 'tram_stop')
## osmdata_xml (q, '../data/Amsterdam_railway_tram_stop.osm')
## dat_points <- sf::st_read('../data/Amsterdam_railway_tram_stop.osm',
##                           layer = 'points', quiet = TRUE)
## nrow(dat_points)

#' 
#' 
#' <!--
#' dat_stoparea <- sf::st_read('data/Amsterdam_pubtrans_stoparea.osm', layer = 'points', quiet = TRUE)
#' -->
#' 
#' 
## ----amsterdamtramstop,eval=F--------------------------------------------
## dat3 <- opq(bbox = 'Amsterdam') %>%
##     add_osm_feature(key = 'railway',
##                     value = 'tram_stop') %>%
##     osmdata_sf ()

#' 
## ----eval=F,echo=F-------------------------------------------------------
## save(dat3,file="../data/osf_Amsterdam_tramstop.RData")

#' 
## ----echo=F--------------------------------------------------------------
load("../data/osf_Amsterdam_tramstop.RData")

#' 
#' 
## ----echo=F--------------------------------------------------------------
library(knitr)
# head(dat3$osm_points)
# nrow(dat3$osm_points)
# names(dat3$osm_points)

#' 
## ------------------------------------------------------------------------
dat3$osm_points$geometry

#' 
#' ## Plotting the result
#' 
## ----echo=F--------------------------------------------------------------
library(ggmap)
  # Amsterdam: 
AMmap <- qmap("Rotterdam")
# geocode failed with status OVER_QUERY_LIMIT, location = "Amsterdam"

#' 
## ----echo=F,eval=F-------------------------------------------------------
## load("D:/Daten/Daten/GeoDaten/osmplotr_amsterdam_hw.RData")

#' 
## ----eval=F--------------------------------------------------------------
## # install.packages("osmplotr")
## library("osmplotr")
## bbox <- getbb("Amsterdam")
## dat_pa <- extract_osm_objects(key='highway',
##                               value="primary",
##                               bbox=bbox)
## dat_sa <- extract_osm_objects(key='highway',
##                               value="secondary",
##                               bbox=bbox)
## dat_ta <- extract_osm_objects(key='highway',
##                               value="tertiary",
##                               bbox=bbox)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## save(dat_pa,dat_sa,dat_ta,file="../data/highways_adam.RData")

#' 
## ----eval=F,echo=F-------------------------------------------------------
## load("../data/highways_adam.RData")

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## dat_ra <- extract_osm_objects(key='railway',
##                               value="tram",
##                               bbox=bbox)

#' 
#' 
## ----eval=F--------------------------------------------------------------
## map <- osm_basemap(bbox = bbox, bg = c("#F5F5DC"))
## map <- add_osm_objects(map, dat_pa, col = c("#00008B"))
## map <- add_osm_objects(map, dat_sa, col = "green")
## map <- add_osm_objects(map, dat_ta, col = "lightblue")
## map <- add_osm_objects(map, dat3$osm_points, col = c("red"))
## print_osm_map(map)

#' 
#' ![](figure/tramhighway_amsterdam.pdf)
#' 
#' ## Get an overview of the available features
#' 
## ------------------------------------------------------------------------
features <- available_features()
head(features,n=20)

#' 
#' 
#' 
#' ## [Changing the API](https://github.com/ropensci/osmdata/issues/126)
#' 
#' 
## ------------------------------------------------------------------------
api_list <- c('http://overpass-api.de/api/interpreter',
              'https://lz4.overpass-api.de/api/interpreter',
              'https://z.overpass-api.de/api/interpreter',
              'https://overpass.kumi.systems/api/interpreter')

api_to_use <- sample(1:length(api_list), 1)

set_overpass_url(api_list[api_to_use]) 

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## install.packages("colourpicker")

#' 
#' ## Die wichtigsten Funktionen im Paket `osmdata`
#' 
#' 
#' 
#' ## Links
#' 
#' - [Github repo of the `osmdata` package](https://github.com/ropensci/osmdata)
#' - [Vignette for the package `osmdata`](https://cran.r-project.org/web/packages/osmdata/vignettes/osmdata.html) on [github](https://github.com/ropensci/osmdata/blob/master/vignettes/osmdata.Rmd)
#' - [osmdata Homepage](https://ropensci.github.io/osmdata/)
#' - [Overpass API - query form](http://overpass-api.de/query_form.html)
#' - [Overpass API/Language Guide](https://wiki.openstreetmap.org/wiki/DE:Overpass_API/Language_Guide)
#' - [Overpass Turbo](https://wiki.openstreetmap.org/wiki/DE:Overpass_turbo)
#' <!--
#' https://cran.r-project.org/web/packages/osmdata/osmdata.pdf
#' -->
