#' ---
#' title: "Karte Gemeinden"
#' author: "Jan-Philipp Kolb"
#' date: "29 August 2018"
#' output: beamer_presentation
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)
GESIS <- T
athome <- !GESIS

#' 
#' ## [Shapefile mit Regionalschlüssel](http://www.geodatenzentrum.de/geodaten/gdz_rahmen.gdz_div?gdz_spr=deu&gdz_akt_zeile=5&gdz_anz_zeile=1&gdz_unt_zeile=13&gdz_user_id=0) herunterladen
#' 
## ----eval=GESIS,echo=F---------------------------------------------------
vg250path <- "J:/Work/GESISPanel_DATA/01_post_processing/c01/e_2017/ee/01_wave/data/com/geodata/vg250/"

#' 
## ----eval=athome,echo=F--------------------------------------------------
vg250path <- "D:/GESIS/data/vg250_3112.utm32s.shape.ebenen/vg250_ebenen"

#' 
#' 
## ------------------------------------------------------------------------
library(rgdal)

#' 
#' 
## ------------------------------------------------------------------------
setwd(vg250path)
VG250 <- readOGR ("VG250_GEM.shp","VG250_GEM")

#' 
## ----eval=GESIS----------------------------------------------------------
bla <- substr(VG250@data$AGS_0,1,2)

#' 
#' 
#' ## A map for Berlin
#' 
## ------------------------------------------------------------------------
plot(VG250[bla=="11",])

#' 
#' 
#' ## Andere Farben
#' 
#' ![](figure/colourpicker.PNG)
#' 
#' 
#' ## [Räumliche Stichprobe](https://www.rdocumentation.org/packages/sp/versions/1.3-1/topics/spsample)
#' 
## ------------------------------------------------------------------------
spatsamp <- spsample(VG250, 100,type="random")

#' 
#' ## Point in Polygon
#' 
## ------------------------------------------------------------------------
tmp <- sp::over(spatsamp, VG250)

#' 
#' 
## ------------------------------------------------------------------------
# EPSG: 3857
newData<-spTransform(spatsamp, CRS("+init=epsg:3857"))
# res <- spTransform(spatsamp, CRS("+proj=utm +zone=51 ellps=WGS84"))

#' 
#' 
#' ## Links
#' 
#' - [Früherer Kurs zum Thema](https://github.com/Japhilko/GeoData/blob/master/2017/slides/polygonSources.md)
#' 
#' - [Informationen zum AGS](https://de.wikipedia.org/wiki/Amtlicher_Gemeindeschl%C3%BCssel)
