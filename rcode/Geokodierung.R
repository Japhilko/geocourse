#' ---
#' title: "B2 - Geokodierung"
#' author: "Jan-Philipp Kolb"
#' date: "22 Oktober 2018"
#' output:
#'   beamer_presentation:
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: tango
#'     fig_caption: no
#'     keep_tex: yes
#'     theme: CambridgeUS
#'   slidy_presentation: default
#' ---
#' 
## ----setup_geokodierung, include=FALSE-----------------------------------
knitr::opts_chunk$set(echo = T,eval=T,message=F,warning=F,cache=T)
googleEX <- F
osmEX <- T
library(knitr)

#' 
#' ## Inhalt dieses Abschnitts
#' 
#' - Das Konzept der Geokoordinaten erklären
#' - Möglichkeiten vorstellen, die Geokodierung mit R durchzuführen
#' 
#' ## Geokodierung
#' 
#' ### [Wikipedia - Geocoding](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes)
#' 
#' 
#' > Geocoding (...) uses a description of a location, most typically a postal address or place name, to find geographic coordinates from spatial reference data ... 
#' 
#' 
## ----message=F,warning=F,eval=googleEX,echo=F----------------------------
library(ggmap)
geocode("Mannheim",source="google")

#' 
## ----echo=F,message=F,warning=F,eval=googleEX----------------------------
MAgc <- geocode("Mannheim B2,5",source="google")
kable(MAgc)

#' 
#' 
#' ## Geokodierung mit dem Paket `ggmap`
#' 
#' - Einer der ersten Ansätze Geokodierung mit R durchzuführen
#' - Wenn Geokodierung mit R durchgeführt wird dieses Paket wohl am häufigsten verwendet. 
#' - Das führt auch dazu, dass im Internet zahlreiche Anwendungsbeispiele zu finden sind. 
#' 
## ----eval=F--------------------------------------------------------------
## library(ggmap)
## geocode("Heidelberg")

#' 
#' ```
#' Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Heidelberg&sensor=false
#'        lon      lat
#' 1 8.672434 49.39875
#' ```
#' 
#' 
#' ## Latitude und Longitude
#' 
#' ![](figure/definition-of-latitude-longitude.jpg)
#' 
#' [http://modernsurvivalblog.com](http://modernsurvivalblog.com/survival-skills/basic-map-reading-latitude-longitude/)
#' 
#' 
#' ## Die Distanz zwischen zwei Punkten
#' 
## ----message=F,eval=googleEX---------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

#' 
## ----message=F,eval=googleEX---------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="walking")

#' 
#' 
#' ### Eine andere Distanz bekommen
#' 
## ----message=F,eval=googleEX---------------------------------------------
mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="bicycling")

#' 
#' 
#' ## Geokodierung mit dem Paket `tmaptools`
#' 
#' - Beim Paket `tmaptools` wird die Nominatim API zur Geokodierung verwendet.
#' - Diese Funktion hat den Vorteil, dass eine Projektion ausgewählt werden kann, in der die Geokodierungen zurück gegeben werden. 
#' 
## ------------------------------------------------------------------------
library("tmaptools")

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## ?geocode_OSM

#' 
#' 
#' 
#' ## Koordinaten verschiedener Orte in Deutschland
#' 
## ----echo=T,message=F,eval=osmEX-----------------------------------------
cities <- c("Hamburg","Koeln","Dresden","Muenchen")

lat <- vector()
lon <- vector()
for (i in 1:length(cities)){
  gc <- geocode_OSM(cities[i])
  lat[i] <- gc$coords[1]
  lon[i] <- gc$coords[2]
}

#' 
#' ## Welche Koordinaten hat der Norden
#' 
## ------------------------------------------------------------------------
Dat <- data.frame(cities,lon,lat)
kable(Dat)

#' 
#' 
#' ## Geokodierung - verschiedene Punkte von Interesse
#' 
## ----message=F,warning=F,eval=googleEX,echo=F----------------------------
POI1 <- geocode_OSM("B2, 1 Mannheim")
POI2 <- geocode_OSM("Hbf Mannheim")
POI3 <- geocode_OSM("Mannheim, Friedrichsplatz")
ListPOI <-data.frame(rbind(POI1$coords,POI2$coords,POI3$coords))
ListPOI

#' 
## ----message=F,warning=F,eval=googleEX,echo=F----------------------------
POI1 <- geocode_OSM("Mannheim")
POI2 <- geocode_OSM("Speyer")
POI3 <- geocode_OSM("Heidelberg")
ListPOI <-data.frame(rbind(POI1$coords,POI2$coords,POI3$coords))
ListPOI

#' 
#' 
#' ## Punkte in der Karte
#' 
## ----eval=F--------------------------------------------------------------
## MA_map <- qmap("Mannheim")

#' 
#' 
## ----echo=F--------------------------------------------------------------
load("../data/MA_map.RData")

#' 
## ----message=F,warning=F,eval=googleEX-----------------------------------
MA_map +
geom_point(aes(x = x, y = y),
data = ListPOI)

#' 
#' ## Punkte in der Karte
#' 
## ----message=F,warning=F,eval=googleEX-----------------------------------
MA_map +
geom_point(aes(x = x, y = y),col="red",
data = ListPOI)

#' 
#' 
#' 
#' ## Reverse Geokodierung
#' 
#' > Reverse geocoding is the process of back (reverse) coding of a point location (latitude, longitude) to a readable address or place name. This permits the identification of nearby street addresses, places, and/or areal subdivisions such as neighbourhoods, county, state, or country.
#' 
#' Quelle: [Wikipedia](https://en.wikipedia.org/wiki/Reverse_geocoding)
#' 
#' 
## ----echo=F,eval=F-------------------------------------------------------
## library(tmap)
## data(metro)
## five_cities <- metro[sample(length(metro), 5), ]

#' 
## ----echo=F,eval=F-------------------------------------------------------
## rev_geocode_OSM(x=48,y=8)

#' 
#' 
## ----cache=T,message=F,eval=googleEX-------------------------------------
revgeocode(c(48,8))

#' 
#' 
#' 
#' ## Daten einlesen
#' 
#' - Hier wird ein Beispieldatensatz eingelesen, den ich über räumliche Stichproben und reverse geocoding erzeugt habe. 
#' 
## ------------------------------------------------------------------------
load("../data/addr_list_t_68239.RData")
head(addr_list_t)

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## (load("../data/addr_list_t_Deutschland_samp1.RData"))
## head(addr_list_t)
## addr_dat <- data.frame(address = addr_list_t)
## # gc_addr <- mutate_geocode(addr_dat, address)

#' 
#' 
#' 
#' 
#' 
#' ## Die erste Adressen geokodieren
#' 
#' 
## ------------------------------------------------------------------------
geocode_OSM(addr_list_t[1])

#' 
#' ## Alle Adressen geokodieren
#' 
## ----eval=F--------------------------------------------------------------
## gc_list <- list()
## 
## for (i in 1:length(addr_list_t)){
##   gc_list[[i]] <- geocode_OSM(addr_list_t[i])
## }

#' 
#' ## Geokodierung mit dem R-Paket `opencage`
#' 
#' - Um dieses Paket zu nutzen muss man sich vorher bei der API registrieren
#' 
## ------------------------------------------------------------------------
library(opencage)

#' 
#' 
#' 
## ----eval=F--------------------------------------------------------------
## gc_info<-opencage_forward(placename =
##                               "Amsterdam, Van Woustraat")

#' 
#' - Hinweise, wie das Paket genutzt erden kann sind im [**opencage Tutorial**](https://ropensci.org/tutorials/opencage_tutorial/) zu finden. 
#' 
#' ## Das Paket [`geonames`](https://github.com/ropensci/geonames)
#' 
#' <!--
#' https://cran.r-project.org/web/packages/geonames/README.html
#' -->
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("geonames")

#' 
#' - Ein Account ist notwendig um die meisten Funktionen des Paketes `geonames`zu nutzen.
#' 
## ------------------------------------------------------------------------
library(geonames)

#' 
## ----eval=F--------------------------------------------------------------
## options(geonamesUsername="myusername")

#' 
## ----eval=F--------------------------------------------------------------
## MAwiki<-GNfindNearbyWikipedia(postalcode=68239,country="DE",
##                               radius=10)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## save(MAwiki,file="../data/MAwiki.RData")

#' 
#' ## Wikipediaeinträge in der Nähe
#' 
## ----echo=F--------------------------------------------------------------
load("../data/MAwiki.RData")
library(knitr)
kable(MAwiki)

#' 
#' 
#' - [Login für Geonames](http://www.geonames.org/login)
#' 
#' - [Link um mit den Geodaten zu arbeiten](http://www.geonames.org/enablefreewebservice)
#' 
#' - [Informationen über den Download](http://www.geonames.org/export/ws-overview.html)
#' 
## ------------------------------------------------------------------------
library(osmdata)
bbox <- getbb("Mannheim")

#' 
#' <!--
#' x -lon - ost-West Richtung
#' -->
#' 
## ----eval=F--------------------------------------------------------------
## erg <- geonames::GNcities(49.649591,8.627236,
##                           49.329591,8.307236)

#' 
#' <!--
#' https://cengel.github.io/rspatial/5_Geocoding.nb.html
#' http://www.datasciencetoolkit.org/
#' 
#' https://github.com/cengel/ArcGIS_geocoding
#' -->
#' 
#' ## Das Paket `googleway`
#' 
#' > Accesses Google Maps APIs to Retrieve Data and Plot Maps
#' 
## ----eval=F,echo=F-------------------------------------------------------
## install.packages("googleway")

#' 
## ------------------------------------------------------------------------
library(googleway)

#' 
#' - Ein API Schlüssel ist notwendig um die meisten Funktionen des Paketes zu nutzen. 
#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## install.packages("rgeolocate")
## # install.packages("ipapi")
## install.packages("geoparser")
## install.packages("geosapi")

#' 
#' <!--
#' Abschnitt zu Geocoding in diesem Task View:
#' 
#' https://cran.r-project.org/web/views/WebTechnologies.html
#' -->
#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## library(devtools)
## install_github("trestletech/rydn")
## devtools::install_github("hrbrmstr/ipapi") # https://github.com/hrbrmstr/ipapi/
## devtools::install_github("erzk/PostcodesioR") # https://github.com/ropensci/PostcodesioR/

#' 
#' ## Das Paket `bbox` 
#' 
#' - Das Paket `bbox` ist auf github zu finden.
#' 
## ----eval=F,echo=F-------------------------------------------------------
## devtools::install_github("ropensci/bbox") # https://github.com/ropensci/PostcodesioR/

#' 
#' - Beispieldatensatz laden:
#' 
## ------------------------------------------------------------------------
load("../data/ddat.RData")

#' 
#' - Rahmen für das räumliche Objekt bestimmen:
#' 
## ----eval=T--------------------------------------------------------------
library(bbox)
b_box(ddat)

#' 
## ----eval=F--------------------------------------------------------------
## citation("bbox")

#' 
#' 
#' <!--
#' https://github.com/ropensci/bbox
#' -->
#' 
#' 
#' 
#' 
#' 
#' ## Links
#' 
#' - Überblick von Jesse Sadler zur [**Geokodierung mit R**](https://www.jessesadler.com/post/geocoding-with-r/)
#' - Ein Schummelzettel für [**`ggmap`**](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf)
#' - Die Vignette zum Paket `tmap` - [**tmap: get started**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html)
#' 
#' - [**latlong.net**](https://www.latlong.net/place/hamburg-germany-8766.html) - eine Homepage um Koordinaaten zu bestimmen.
