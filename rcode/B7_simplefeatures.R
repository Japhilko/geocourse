#' ---
#' title: "B7 Simple Features"
#' author: "Jan-Philipp Kolb"
#' date: "23 Oktober 2018"
#' output:
#'   slidy_presentation: 
#'     keep_md: yes
#'   beamer_presentation: 
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: espresso
#'     keep_tex: yes
#'     theme: CambridgeUS
#' ---
#' 
## ----setup_simplefeatures, include=FALSE---------------------------------
knitr::opts_chunk$set(echo = TRUE,fig.height=4,cach=T,warning=F)
athome <- T

#' 
#' ## Themen dieses Abschnitts
#' 
#' - Der Import von Geodaten mit dem Paket simple features (`sf`).
#' - Die Verarbeitung der OSM-Daten mit dem Paket `sf`.
#' - Die Daten visualisieren mit `sf`
#' 
#' 
#' ## Das Paket `sf`
#' 
#' > Simple Features for R 
#' 
## ------------------------------------------------------------------------
library(sf)

#' 
#' - Ein Demo ist im Paket `sf` integriert
#' 
## ----eval=F--------------------------------------------------------------
## demo(sf::affine)

#' 
#' ![](figure/Rplot.pdf)
#' 
#' 
#' ## [Shapefiles mit `sf` importieren](https://cran.r-project.org/web/packages/sf/vignettes/sf2.html)
#' 
#' 
## ----eval=athome,echo=F--------------------------------------------------
data_path <- "D:/GESIS/data/"

#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd(data_path)
## plz <- st_read("post_pl.shp")

#' 
## ------------------------------------------------------------------------
st_layers("../data/london_sport.shp")
london <- st_read("../data/london_sport.shp")

#' 
#' ## Das Shapefile plotten
#' 
## ------------------------------------------------------------------------
plot(london$geometry)

#' 
#' 
#' <!--
#' https://www.r-spatial.org/r/2018/01/08/sf-0.6-0.html
#' -->
#' 
#' 
#' 
#' ## [Graphiken mit `sf`](https://r-spatial.github.io/sf/articles/sf5.html)
#' 
#' 
## ----message=FALSE, warning=FALSE----------------------------------------
plot(london)

#' 
#' ## Die Hilfe für die Funktion plot im `sf` Paket 
#' 
## ----eval=F--------------------------------------------------------------
## ?plot

#' 
#' ![](figure/fragezeichen_plot.PNG)
#' 
#' 
#' ## Der `london` shapefile als Beispiel
#' 
## ------------------------------------------------------------------------
head(london)

#' 
#' ## Die Farben verändern
#' 
## ----message=FALSE, warning=FALSE----------------------------------------
plot(london,col=1:20)

#' 
#' ## Nur eine Karte 
#' 
#' ### Beispiel Bevölkerung in London`s Stadtteilen
#' 
## ------------------------------------------------------------------------
london2 <- london[,-(1:3)]
plot(london2)

#' 
#' 
#' ## Das Paket `colorRamps`verwenden
#' 
#' ### Cheatsheet zum Thema [**Farbpaletten**](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf)
#' 
## ------------------------------------------------------------------------
library("colorRamps")
plot(london2,col=blue2yellow(10))

#' 
#' 
#' ## Beispieldaten bekommen
#' 
#' <!--
#' https://cran.r-project.org/web/packages/sf/vignettes/sf1.html
#' -->
#' 
## ----bbpoly_amsterdam----------------------------------------------------
library(osmdata)
bb_poly <- getbb(place_name = "Amsterdam", 
                 format_out = "polygon")


#' 
#' 
## ------------------------------------------------------------------------
ls <- st_multilinestring(bb_poly)

#' 
#' 
## ------------------------------------------------------------------------
pol <- sf::st_polygon(bb_poly)
class(pol)

#' 
## ----echo=F,eval=F-------------------------------------------------------
## ab <- st_polygonize(ls)
## ab <- st_geometrycollection(list(pol))
## str(ab)

#' 
#' 
## ----bb_poly_ma----------------------------------------------------------
bb_poly_ma<-getbb(place_name="Mannheim",format_out="polygon")

#' 
#' ## Das Ergebnis plotten
#' 
## ------------------------------------------------------------------------
plot(bb_poly_ma,type="l")

#' 
#' <!--
#' ## Das Beispiel Heidelberg
#' 
## ----eval=F--------------------------------------------------------------
## bb_poly_hd <- getbb(place_name = "Heidelberg",
##                  format_out = "polygon")

#' -->
#' 
## ----eval=F,echo=F-------------------------------------------------------
## ls <- st_multilinestring(bb_poly_ma)
## ab <- st_polygonize(ls)
## ab <- st_polygonize(bb_poly_ma)
## 

#' 
#' 
#' <!--
#' Problem ist, dass man nichts sieht, wenn man das plottet
#' 
#' # folgendes funktioniert nicht
#' -->
#' 
## ----eval=F,echo=F-------------------------------------------------------
## mpol <- sf::st_multipolygon(bb_poly)

#' 
#' 
## ----echo=F--------------------------------------------------------------
# x <- osmdata_sf(pol)

#' 
#' 
#' 
#' ## Eine `.osm` Datei importieren
#' 
#' - In einer `.osm` Datei sind verschiedene Layer vorhanden.
#' - Mit `st_layers` kann man sich anzeigen lassen, welche das sind. 
#' 
#' 
## ------------------------------------------------------------------------
st_layers("../data/ams_centraal.osm")

#' 
#' 
#' ## Daten vom Amsterdam Beispiel
#' 
#' - Mit der Funktion `st_read` kann der gewünschte Layer importiert werden.
#' 
## ------------------------------------------------------------------------
datm <- st_read("../data/ams_centraal.osm","multipolygons")

#' 
#' 
#' 
#' ## [Die Funktion `st_geometry`](https://cran.r-project.org/web/packages/sf/vignettes/sf3.html)
#' 
#' > Get, set, or replace geometry from an sf object
#' 
## ----eval=F--------------------------------------------------------------
## ?st_geometry

#' 
#' 
## ------------------------------------------------------------------------
geom_datm <- st_geometry(datm)
plot(geom_datm)

#' 
#' 
#' ## Die Häuser auswählen
#' 
## ----message=FALSE, warning=FALSE----------------------------------------
library(dplyr)
buis <- datm %>% select(building)
plot(buis)

#' 
#' ## Welche Häusertypen gibt es?
#' 
## ----eval=F--------------------------------------------------------------
## buis2 <- datm %>% as.data.frame %>% select(building)

#' 
## ------------------------------------------------------------------------
datbuis <- datm[, "building", drop = TRUE]
plot(datbuis)

#' 
#' <!--
#' ##
#' 
## ------------------------------------------------------------------------
houses <- datm[datm$building == "house",]
class(houses)
## [1] "sf"         "data.frame"
dhous <- datm[houses,]
plot(dhous$geometry)

#' 
## ------------------------------------------------------------------------
plot(st_geometry(houses))

#' -->
#' 
#' ## [Alle Häuser herausnehmen](https://cran.r-project.org/web/packages/sf/vignettes/sf4.html)
#' 
## ------------------------------------------------------------------------
houses <- datm[datm$building %in% c("house","yes",
                                    "apartments"),]

#' 
#' - Im ersten Teil des Objekts sind allgemeine Informationen zum Geometrietyp, zur Bounding Box und zum EPSG Code enthalten. 
#' 
#' ```
#' Simple feature collection with 2131 features and 25 fields
#' geometry type:  MULTIPOLYGON
#' dimension:      XY
#' bbox:           xmin: 4.887275 ymin: 52.37334 xmax: 4.91342 ymax: 52.38366
#' epsg (SRID):    4326
#' proj4string:    +proj=longlat +datum=WGS84 +no_defs
#' ```
#' 
#' ## Zweiter Teil des Objekts `houses`
#' 
#' - Im zweiten Teil sind dann spezifische Informationen zu den einzelnen Features aufgelistet. 
#' - Es handelt sich beispielsweise um die OSM id und in der letzten Spalte die Geometrie, die wir später zum visualisieren brauchen. 
#' 
#' ```
#'     osm_id osm_way_id name         type    building craft
#' 5  3580102       <NA> <NA> multipolygon  apartments  <NA>
#' 6  3580414       <NA> <NA> multipolygon         yes  <NA>
#' 7  3580416       <NA> <NA> multipolygon  apartments  <NA>
#' 8  3580417       <NA> <NA> multipolygon  apartments  <NA>
#' 9  3580420       <NA> <NA> multipolygon  apartments  <NA>
#' 10 3580421       <NA> <NA> multipolygon  apartments  <NA>
#' 11 3580422       <NA> <NA> multipolygon  apartments  <NA>
#' 12 3580423       <NA> <NA> multipolygon  apartments  <NA>
#' 13 3580427       <NA> <NA> multipolygon  apartments  <NA>
#' 14 3580428       <NA> <NA> multipolygon       house  <NA>
#' ```
#' 
## ----eval=F,echo=F-------------------------------------------------------
## df_ <- data.frame(osm_id=houses$osm_id,type=houses$type,building=houses$building,geometry=houses$geometry)
## head(df_,n=10)
## library(xtable)
## # xtable(df_)

#' 
#' 
#' ## Das Objekt `houses` transformieren
#' 
## ----echo=T,eval=T-------------------------------------------------------
class(houses)
class(st_geometry(houses))

#' 
#' ## Das Ergebnis visualisieren
#' 
## ------------------------------------------------------------------------
library(tmap)
(map1 <- qtm(st_geometry(houses)))

#' 
#' 
#' ## Wohnstraßen hinzufügen
#' 
## ----message=FALSE, warning=FALSE----------------------------------------
datl <- st_read("../data/ams_centraal.osm","lines")
roads <- datl[datl$highway %in% c("residential"),]

#' 
#' ## Der Straßen-Typ `residential`
#' 
## ------------------------------------------------------------------------
(map2 <- map1+qtm(st_geometry(roads),lines.col="purple"))

#' 
#' ## Weitere Straßen hinzufügen
#' 
## ------------------------------------------------------------------------
roads2 <- datl[datl$highway %in% c("tertiary","secondary",
                                  "primary"),]
(map3 <- map2+qtm(st_geometry(roads2),lines.col="red"))

#' 
#' 
#' ## Eine Demonstartion von sf 
#' 
#' ### Beispieldatensatz `nc`
#' 
#' 
## ------------------------------------------------------------------------
demo(nc, ask = FALSE, echo = FALSE)

#' 
#' 
#' ## Die Vignetten für das Paket `sf`
#' 
#' https://r-spatial.github.io/sf/reference/st_as_sf.html
#' 
#' https://r-spatial.github.io/sf/reference/st_read.html
#' 
#' https://r-spatial.github.io/sf/articles/sf1.html
