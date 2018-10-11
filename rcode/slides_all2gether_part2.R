#' ---
#' title: "Geodaten - zweiter Teil"
#' author: "Jan-Philipp Kolb"
#' date: "11 Oktober 2018"
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
## ----setup_2part, include=FALSE------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

#' 
#' 
## ----child = 'OpenStreetMap.Rmd'-----------------------------------------

#' 
## ----setup_osm, include=FALSE--------------------------------------------
knitr::opts_chunk$set(echo = TRUE,cache=T,eval=T,warning=F,message=F)
Ex <- T

#' 
#' ## Inhalt dieses Abschnitts
#' 
#' - Vorstellung des Openstreetmap (OSM) Projekts
#' - Welche OSM-Daten sind erhältlich?
#' - Vorstellung von Forschung die mit OSM-Daten durchgeführt wurde
#' 
#' 
#' ## [OpenStreetMap](http://www.openstreetmap.de/) Projekt
#' 
#' > OpenStreetMap.org ist ein im Jahre 2004 gegründetes internationales Projekt mit dem Ziel, eine freie Weltkarte zu erschaffen. Dafür sammeln wir weltweit Daten über Straßen, Eisenbahnen, Flüsse, Wälder, Häuser und vieles mehr. 
#' 
#' <http://www.openstreetmap.de/>
#' 
#' 
#' ## OpenStreetMap
#' 
#' > OpenStreetMap (OSM) ist ein kollaboratives Projekt um eine editierbare Weltkarte zu erzeugen.
#' 
#' [**Wikipedia - OpenStreetMap**](https://en.wikipedia.org/wiki/OpenStreetMap)
#' 
#' ## [OSM Map Features](http://wiki.openstreetmap.org/wiki/DE:Map_Features)
#' 
#' ![http://wiki.openstreetmap.org/wiki/DE:Map_Features](figure/osm_mapfeatures.png)
#' 
#' 
#' 
#' ## [Openstreetmap Tags](https://wiki.openstreetmap.org/wiki/Tags)
#' 
#' ![](figure/osm_tag.png)
#' 
#' 
#' 
#' ## Objekttypen in OSM
#' 
#' - Es gibt prinipiell drei verschiedene Objekttypen:
#' - 
#' 
#' <!--
#' Hippolyte Pruvost and Peter Mooney: Exploring Data Model Relations in OpenStreetMap
#' -->
#' 
#' 
#' ## Download von OpenStreetMap Daten
#' 
#' - https://mapzen.com/ - Ausschnitte von OpenStreetMap für einzelne Städte ([metro extracts](https://mapzen.com/data/metro-extracts/))
#' 
#' - Über Geofabrik lassen sich aktuelle Ausschnitte (auch Shapefiles) herunterladen (http://download.geofabrik.de/)
#' 
#' - Kartendaten ([**openaprs**](http://www.openaprs.net/))
#' 
#' ## Bei großen Datenmengen
#' 
#' - Hier geht es nur um das Herunterladen kleiner Ausschnitte.
#' - Wenn größere Datenmengen benötigt werden, sollte man eine Datenbanklösung finden.
#' - [PostgreSQL](http://www.postgresql.org/) hat den Vorteil, dass es Open-Source ist.
#' 
#' - [Download PostreSQL](http://www.postgresql.org/download/windows/)
#' 
#' - [Hier](https://datashenanigan.wordpress.com/2015/05/18/getting-started-with-postgresql-in-r/) ist eine Einführung in PostgreSQL zu finden
#' 
#' - Sehr empfehlenswert: Arbeiten mit pgAdmin III
#' - Beispiel: um Verknüpfung zu einer Datenbank herzustellen - Doppelklick auf den Server in pgAdmin III
#' 
#' 
#' ### PostGIS für PostgreSQL
#' 
#' - [**Installieren**](http://postgis.net/install/) der PostGIS Erweiterung:
#' 
#' ```
#' CREATE EXTENSION postgis;
#' ```
#' 
#' 
#' ## Programm zum Import der OSM Daten in PostgreSQL- osm2pgsql
#' 
#' - Läuft unter Linux deutlich besser
#' - so könnte bspw. ein Import in PostgreSQL aussehen:
#' 
#' ```
#' osm2pgsql -c -d osmBerlin --slim -C  -k  berlin-latest.osm.pbf
#' ```
#' 
#' ## Nutze bspw. [QGIS](http://www.qgis.org/de/site/) um Shapefiles zu extrahieren
#' 
#' - [Plugin OpenLayers](http://www.qgistutorials.com/de/docs/downloading_osm_data.html)
#' 
#' ![qgis](figure/stamen_watercolor1.png)
#' <!--
#' https://underdark.files.wordpress.com/2012/07/stamen_watercolor1.png?w=700
#' -->
## ----echo=F--------------------------------------------------------------
library("knitr")

#' 
#' 
#' ## Links
#' 
#' - [**Wiki zum Downlaod**](http://wiki.openstreetmap.org/wiki/Downloading_data) von Openstreetmap Daten
#' 
#' - [**Openstreetmap Blog**](http://blog.openstreetmap.de/)
#' 
#' - Liste möglicher Datenquellen für räumliche Analysen ([weltweit](http://wiki.openstreetmap.org/wiki/Potential_Datasources) und in  [**Deutschland**](http://wiki.openstreetmap.org/wiki/DE:Potential_Datasources)
#' )
#' 
#' 
#' - [**SALB**](http://wiki.openstreetmap.org/wiki/SALB) - Administrative Grenzen
#' 
#' <http://wiki.openstreetmap.org/wiki/SALB>
#' 

#' 
## ----child = 'Geokodierung.Rmd'------------------------------------------

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

#' 
## ----child = 'osm_mainapi.Rmd'-------------------------------------------

#' 
## ----setup_mainosmapi, include=FALSE-------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
Ex <- T

#' 
#' 
#' ## [OSM Ausschnitte herunterladen](http://www.openstreetmap.org/export)
#' 
#' <www.openstreetmap.org/export>
#' 
#' ![osm export](figure/openstreetmap_export-1024x505.png)
#' 
#' 
#' ## Das R-Paket `XML` - Gaston Sanchez
#' 
## ------------------------------------------------------------------------
library("XML")

#' 
#' ### Gaston Sanchez - Dataflow
#' 
#' ![](figure/GastonSanchez2.png)
#' 
#' Seine Arbeit sieht man [**hier**](http://gastonsanchez.com/).
#' 
#' 
#' ## [Das Arbeiten mit XML Daten](https://github.com/gastonstat/tutorial-R-web-data/blob/master/04-parsing-xml/04-parsing-xml.pdf)
#' 
#' ![Gaston Sanchez - Webdaten bekommen](figure/GastonSanchez3.PNG)
#' 
#' 
#' ## Funktionen im XML Paket
#' 
## ----echo=F,eval=T-------------------------------------------------------
names <- c("xmlName()","name of the node","xmlSize()","number of subnodes","xmlAttrs()","named character vector of all attributes","xmlGetAttr()","value of a single attribute","xmlValue()","contents of a leaf node","xmlParent()","name of parent node","xmlAncestors()","name of ancestor nodes","getSibling()","siblings to the right or to the left","xmlNamespace()","the namespace (if there’s one)")
tab <- data.frame(t(array(names,dim=c(2,length(names)/2))))
colnames(tab) <- c("Function","Description")
kable(tab)

#' 
#' 
#' ## [Einzelne Objekte finden](http://www.openstreetmap.org/export)
#' 
#' <www.openstreetmap.org/export>
#' 
#' ![osm export](figure/admgrBer.PNG)
#' 
#' 
#' ## Beispiel: administrative Grenzen Berlin
#' 
#' [Administrative Grenzen für Deutschland](http://wiki.openstreetmap.org/wiki/DE:Grenze#Bundesl.C3.A4ndergrenze_-_admin_level.3D4)
#' 
## ----echo=T--------------------------------------------------------------
url <- "https://api.openstreetmap.org/api/0.6/relation/62422"

#' 
## ----echo=F,eval=F-------------------------------------------------------
##  library(xml2)
##  BE <- xml2::read_xml.raw(url)

#' 
#' 
## ----eval=F--------------------------------------------------------------
## BE <- xmlParse(url)

#' 
## ------------------------------------------------------------------------
BE <- xmlParse("../data/62422.xml")

#' 
#' 
#' ![Administrative Grenzen  Berlin](figure/ExampleAdmBE.PNG)
#' 
#' ## Das XML analysieren
#' 
#' - [Tobi Bosede - Working with XML Data in R](http://www.informit.com/articles/article.aspx?p=2215520)
#' 
## ----eval=Ex-------------------------------------------------------------
xmltop = xmlRoot(BE)
class(xmltop)
xmlSize(xmltop)
xmlSize(xmltop[[1]])

#' 
#' 
#' ## Nutzung von Xpath
#' 
#' > [Xpath](https://de.wikipedia.org/wiki/XPath), the XML Path Language, is a query language for selecting nodes from an XML document. 
#' 
## ----eval=Ex-------------------------------------------------------------
xpathApply(BE,"//tag[@k = 'population']")

#' 
#' 
#' ## Quelle für die Bevölkerungsgröße
#' 
## ------------------------------------------------------------------------
xpathApply(BE,"//tag[@k = 'source:population']")

#' 
#' -[**Statistik Berlin Brandenburg**](https://www.statistik-berlin-brandenburg.de/datenbank/inhalt-datenbank.asp)
#' 
#' ## Etwas überraschend: 
#' 
## ------------------------------------------------------------------------
xpathApply(BE,"//tag[@k = 'name:ta']")

#' 
#' ![](figure/OSMBerta.png)
#' 
#' ## Geographische Region
#' 
## ------------------------------------------------------------------------
region <- xpathApply(BE,
  "//tag[@k = 'geographical_region']")
# regular expressions
region[[1]]

#' 
#' ```
#' <tag k="geographical_region" 
#'   v="Barnim;Berliner Urstromtal;
#'   Teltow;Nauener Platte"/>
#' ```
#' 
#' ## Landkreis
#' 
#' ![Barnim](figure/Barnim.png)
#' 
#' 
#' ## Weiteres Beispiel
#' 
## ----eval=F--------------------------------------------------------------
## url2<-"http://api.openstreetmap.org/api/0.6/node/25113879"
## obj2<-xmlParse(url2)
## obj_amenity<-xpathApply(obj2,"//tag[@k = 'amenity']")[[1]]
## obj_amenity

#' 
## ----echo=F--------------------------------------------------------------
obj2<-xmlParse("../data/25113879.xml")
obj_amenity<-xpathApply(obj2,"//tag[@k = 'amenity']")[[1]]
obj_amenity

#' 
#' 
#' 
#' ## Wikipedia Artikel
#' 
## ------------------------------------------------------------------------
xpathApply(obj2,"//tag[@k = 'wikipedia']")[[1]]

#' 
## ----eval=F--------------------------------------------------------------
## xpathApply(obj2,"//tag[@k = 'wheelchair']")[[1]]

#' 
## ----eval=F--------------------------------------------------------------
## xpathApply(obj2,"//tag[@k = 'name']")[[1]]

#' 
#' 
#' ## Das C und das A
#' 
## ----eval=F--------------------------------------------------------------
## url3<-"http://api.openstreetmap.org/api/0.6/node/303550876"
## obj3 <- xmlParse(url3)
## xpathApply(obj3,"//tag[@k = 'opening_hours']")[[1]]

#' 
## ----echo=F--------------------------------------------------------------
obj3 <- xmlParse("../data/303550876.xml")
xpathApply(obj3,"//tag[@k = 'opening_hours']")[[1]]

#' 
#' 
#' ## Hin und weg
#' 
## ----eval=F--------------------------------------------------------------
## url4<-"http://api.openstreetmap.org/api/0.6/node/25439439"
## obj4 <- xmlParse(url4)
## xpathApply(obj4,"//tag[@k = 'railway:station_category']")[[1]]

#' 
## ----echo=F--------------------------------------------------------------
obj4 <- xmlParse("../data/25439439.xml")
xpathApply(obj4,"//tag[@k = 'railway:station_category']")[[1]]

#' 
#' 
#' 
#' - [**Wikipedia Artikel Bahnhofskategorien**](https://de.wikipedia.org/wiki/Bahnhofskategorie)
#' 
#' ![](figure/Bahnhofskategorien.PNG)
#' 
#' ## Exkurs: Bahnhofskategorien
#' 
#' - [**rvest: Easily Harvest (Scrape) Web Pages**](https://cran.r-project.org/web/packages/rvest/index.html)
#' 
## ------------------------------------------------------------------------
library(rvest)
bhfkat<-read_html(
  "https://de.wikipedia.org/wiki/Bahnhofskategorie")
df_html_bhfkat<-html_table(
  html_nodes(bhfkat, "table")[[2]],fill = TRUE)

#' 
#' ## Bahnhofskategorien Übersicht
#' 
## ----echo=F--------------------------------------------------------------
library(knitr)
kable(df_html_bhfkat)

#' 
#' ## Nur fliegen ist schöner
#' 
## ----eval=F--------------------------------------------------------------
## url5<-"http://api.openstreetmap.org/api/0.6/way/162149882"
## obj5<-xmlParse(url5)
## xpathApply(obj5,"//tag[@k = 'name']")[[1]]

#' 
## ----echo=F--------------------------------------------------------------
obj5<-xmlParse("../data/162149882.xml")
xpathApply(obj5,"//tag[@k = 'name']")[[1]]

#' 
#' 
## ------------------------------------------------------------------------
xpathApply(obj5,"//tag[@k = 'website']")[[1]]

#' 
#' 
## ------------------------------------------------------------------------
xpathApply(obj5,"//tag[@k = 'iata']")[[1]]

#' 
#' ## Das Paket `osmar` benutzen
#' 
## ------------------------------------------------------------------------
library("osmar")
node_ <- xmlParse("../data/162149882.xml")
node_osmar <- as_osmar(node_)
node_osmar

#' 
#' ## [Drei Typen von Vektorobjekten](https://www.earthdatascience.org/courses/earth-analytics/spatial-data-r/intro-vector-data-r/)
#' 
#' <!--
#' https://www.earthdatascience.org/courses/earth-analytics/spatial-data-r/intro-vector-data-r/
#' -->
#' 
#' ![](figure/points-lines-polygons-vector-data-types.png)
#' 
#' ## Die Ausdehnung
#' 
#' ![](figure/spatial-extent.png)
#' 
#' 
#' ## [Import mit dem Paket `sf`](https://cran.r-project.org/web/packages/sf/vignettes/sf2.html)
#' 
#' 
## ----eval=T--------------------------------------------------------------
library(sf)

#' 
#' - Mit dem Befehl `st_layers` kann man sehen, welche Layer verfügbar sind:
#' 
## ------------------------------------------------------------------------
st_layers("../data/Amsterdam_highway_primary.osm")

#' 
#' ## Import von Layer `lines`
#' 
## ------------------------------------------------------------------------
dat <- st_read("../data/Amsterdam_highway_primary.osm","lines")
plot(dat$geometry)

#' 
#' ## Import von Layer `points`
#' 
## ------------------------------------------------------------------------
datp <- st_read("../data/Amsterdam_highway_primary.osm","points")
plot(dat$geometry,pch=20,col=rgb(0,0,1,.1))

#' 
#' ## Mit einem anderen Paket plotten
#' 
## ------------------------------------------------------------------------
library(tmap)
qtm(dat$geometry)

#' 
#' ## 
#' 
## ------------------------------------------------------------------------
st_layers("../data/ams_centraal.osm")

#' 
## ------------------------------------------------------------------------
datm <- st_read("../data/ams_centraal.osm","multipolygons")
sp::plot(datm$geometry)

#' 
#' 
#' ## Mehr Beispiele, wie man mit XML Daten umgeht:
#' 
#' - Deborah Nolan - [**Extracting data from XML**](http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf)
#' 
#' 
#' - Duncan Temple Lang - [**A Short Introduction to the XML package for R**](http://www.omegahat.net/RSXML/shortIntro.pdf)
#' 
#' 
#' ### Noch mehr Informationen
#' 
#' - [**Web Daten manipulieren**](http://www.di.fc.ul.pt/~jpn/r/web/index.html#parsing-xml)
#' 
#' - [**Tutorial zu xquery**](http://www.w3schools.com/xml/xquery_intro.asp)
#' 
#' - [**R und das Web (für Anfänger), Teil II: XML und R**](http://giventhedata.blogspot.de/2012/06/r-and-web-for-beginners-part-ii-xml-in.html)
#' 
#' - Gaston Sanchez - [**String Manipulation**](http://gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf)
#' 
#' - [**Nutzung, Vor- und Nachteile OSM**](https://www.e-education.psu.edu/geog585/node/738)
#' 
#' - [**Forschungsprojekte im Zusammenhang mit OpenStreetMap**](http://wiki.openstreetmap.org/wiki/Research)
#' 
#' ## Referenzen
#' 
## ------------------------------------------------------------------------
citation("XML")

#' 
#' ## Das neuere Paket
#' 
## ------------------------------------------------------------------------
citation("xml2")

#' 
#' 
#' <!--
#' https://cran.r-project.org/web/packages/XML2R/XML2R.pdf
#' -->
#' 
#' 
## ----eval=FALSE, include=FALSE-------------------------------------------
## library(sf)
## dat <- st_read("../data/162149882.xml")
## dat <- st_read("../data/Amsterdam_highway_primary.osm")

#' 

#' 
## ----child = 'osmdata.Rmd'-----------------------------------------------

#' 
## ----steup_osmdata, include=FALSE----------------------------------------
knitr::opts_chunk$set(echo = T,cache=T,eval=T,message=F,warning=F,fig.height=4)
Ex <- T

#' 
#' 
#' ## Themen dieses Abschnitts
#' 
#' - Das R-Paket `osmdata` mit dem man OSM-Daten herunterladen kann und das auf der [**Overpass API**](https://wiki.openstreetmap.org/wiki/Overpass_API) beruht. 
#' 
#' - Das Paket `osmplotr`
#' 
#' 
#' ## [Das `osmdata` Paket](https://github.com/ropensci/osmdata)
#' 
#' ![](figure/osmdatatitle.png)
#' 
#' > Mark Padgham - Import 'OpenStreetMap' Data as Simple Features or Spatial
#'         Objects
#' 
#' ## Das `osmdata` Paket
#' 
#' - Mit dem Paket kann man Daten von OpenStreetMap importieren
#' - Die OSM Daten sind unter [**ODbL licence**](https://www.openstreetmap.org/copyright) zu haben 
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("osmdata")

#' 
## ------------------------------------------------------------------------
library(osmdata)

#' 
## ----eval=F--------------------------------------------------------------
## citation("osmdata")

#' 
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
## ----eval=Ex-------------------------------------------------------------
bb <- getbb('Ladenburg')

#' 
#' - In `bb` sind nun vier Werte gespeichert, die den Rahmen definieren
#' 
#' - Befehl `opq` - eine Overpass Anfrage erstellen
#' 
## ------------------------------------------------------------------------
q <- opq(bbox = bb)

#' 
#' <!--
#' - Als Ergebnis bekommt man aber noch keine Daten
#' -->
#' 
#' ## Die Grenze von Mannheim 
#' 
#' - Erst mit dem Argument `format_out=polygon` Befehl `getbb` erhält man das Polygon:
#' 
## ----eval=Ex-------------------------------------------------------------
bb_poly <- getbb(place_name = "Ladenburg", 
                 format_out = "polygon")


#' 
#' - Das Ergebnis ist sind zwei Vektoren mit den Longitude und Latitude Koordinaten.
#' 
## ----echo=F--------------------------------------------------------------
bb_poly[1:4,]

#' 
#' 
#' 
#' ## Das Paket für simple feature (`sf`) 
#' 
#' > Simple Features for R
#' 
#' - Das Paket `sf` ist ein Paket um geometrische Operationen durchzuführen. 
#' 
## ------------------------------------------------------------------------
library(sf)

#' 
#' - [**Vignette für das Paket `sf`**](https://cran.r-project.org/web/packages/sf/vignettes/sf3.html)
#' 
#' ![](figure/rsimplefeatures.png)
#' 
#' ## Die Funktion `st_linestring`
#' 
#' > Create simple feature from a numeric vector, matrix or list
#' 
## ------------------------------------------------------------------------
library(sf)
ls <- st_linestring(bb_poly)
sfc <- st_sfc(ls)

#' 
## ----echo=F,eval=F-------------------------------------------------------
## # https://github.com/r-spatial/sf
## ?st_linestring

#' 
#' 
#' 
## ----echo=F--------------------------------------------------------------
sfc2 <- st_cast(sfc, "MULTILINESTRING")
ab <- st_geometrycollection(sfc)

#' 
#' 
#' ## Den `linestring` plotten
#' 
#' 
## ------------------------------------------------------------------------
library(tmap)
qtm(sfc)

#' 
#' 
#' 
#' ## Einrichtungen (amenity)
#' 
#' 
#' ### [**OSM map features**](https://wiki.openstreetmap.org/wiki/Map_Features)
#' 
#' - Alle benannten Objekte findet man, wenn man OSM map features in eine Suchmaschine eingibt. 
#' 
#' - Achtung, wenn man bspw. alle Objekte mit dem Schlüssel `amenity` für eine Stadt heraussucht, bekommt man einen recht großen Datensatz
#' 
## ----eval=F--------------------------------------------------------------
## q <- add_osm_feature (q, key = 'amenity')
## osmdata_xml(q, '../data/Ladenburg_amenity.osm')

#' 
#' 
#' ## Was dahinter steckt
#' 
## ----echo=F,eval=F-------------------------------------------------------
## dat <- sf::st_read ('../data/Ladenburg_amenity.osm',
##                     layer = 'points',
##                     quiet = TRUE)

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## nrow(dat)
## ?osmdata_sf

#' 
#' ## Die Funktion `osmdata_sf`
#' 
#' - Die Funktion `osmdata_sf` gibt ein `osmdata` ObjeKt im `sf` Format.
#' 
#' 
## ----shop_bakery---------------------------------------------------------
library(magrittr)
dat1 <- opq(bbox = 'Ladenburg') %>%
    add_osm_feature(key = 'shop', value = 'bakery') %>%
    osmdata_sf ()

#' 
## ------------------------------------------------------------------------
unlist(lapply(dat1,nrow))

#' 
#' ## Alles in eine Karte plotten
#' 
#' ### [**Der Start mit dem Paket `tmap`](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html)
#' 
## ----eval=F--------------------------------------------------------------
## library(tmap)
## tm_shape(sfc)
## tm_bubbles(dat, size=2)

#' 
#' 
#' 
#' ## Beispiel Fahrradparkplätze
#' 
#' - [**OSM map features**](https://wiki.openstreetmap.org/wiki/Map_Features#Highway)
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
#' ## Die Daten plotten
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
## ----eval=F--------------------------------------------------------------
## dat_bar <- sf::st_read ('../data/Mannheim_bar.osm',
##                         layer = 'points', quiet = TRUE)

#' 
#' ## Bus stations in Amsterdam
#' 
## ----eval=F--------------------------------------------------------------
## q <- opq (bbox = 'Amsterdam')
## q <- add_osm_feature (q, key ="amenity",
##                       value = 'bus_station')
## osmdata_xml (q, 'data/Amsterdam_bus_station.osm')

#' 
## ----eval=F--------------------------------------------------------------
## dat_bus <- sf::st_read ('../data/Amsterdam_bus_station.osm',
##                         layer = 'points', quiet = TRUE)
## nrow(dat_bus)

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
## ----eval=F--------------------------------------------------------------
## dat_bus <- sf::st_read ('../data/Amsterdam_bus_pubtrans.osm',
##                         layer = 'points', quiet = TRUE)
## nrow(dat_bus)

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
## ----echo=F,eval=F-------------------------------------------------------
## load("../data/osf_Amsterdam_tramstop.RData")

#' 
#' 
## ----echo=F--------------------------------------------------------------
library(knitr)
# head(dat3$osm_points)
# nrow(dat3$osm_points)
# names(dat3$osm_points)

#' 
## ----eval=F--------------------------------------------------------------
## dat3$osm_points$geometry

#' 
#' ## Plotting the result
#' 
## ----echo=F,eval=F-------------------------------------------------------
## library(ggmap)
##   # Amsterdam:
## AMmap <- qmap("Rotterdam")
## # geocode failed with status OVER_QUERY_LIMIT, location = "Amsterdam"

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
#' <!--
#' ![](figure/tramhighway_amsterdam.pdf)
#' -->
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
## ----eval=F--------------------------------------------------------------
## # https://rdrr.io/cran/osmdata/man/osmdata_sp.html
## ?osmdata_sp

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## library(osmdata)
## library(osmplotr)
## bbox <- get_bbox (c (-0.13, 51.51, -0.11, 51.52))
## dat_B <- extract_osm_objects (key = 'building', bbox = bbox)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## bbox <- osmplotr::bbox ("Mannheim")
## dat_B <- extract_osm_objects (key = 'building', bbox = bbox)

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
#' 
#' 
#' 
#' - [**`osmplotr` tutorial](https://ropensci.org/tutorials/osmplotr_tutorial/)
#' 
#' - [**Geocomputation with R**](https://bookdown.org/robinlovelace/geocompr/)
#' 
#' - [**osmar - JOS**](https://www.theoj.org/joss-papers/joss.00305/10.21105.joss.00305.pdf)
#' 
#' 
#' 
#' <!--
#' https://www.r-bloggers.com/how-to-quickly-enrich-a-map-with-natural-and-anthropic-details/
#' https://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/introduction2Talk.html
#' https://geostat-course.org/aggregator/sources/3?page=1
#' https://gis.stackexchange.com/questions/115911/converting-osm-file-to-shapefile-or-data-frame-in-r
#' https://forum.osm.org/viewtopic.php?id=53336
#' https://hub.docker.com/r/robinlovelace/geocompr/
#' 
#' https://gis.stackexchange.com/questions/264380/getting-buildings-that-house-specific-amenities-using-r
#' -->
#' 
## ----echo=F, eval=FALSE, include=FALSE, r,echo=F-------------------------
## dat <- osmdata_sf("../data/4290854847.xml")
## dat <- osmdata_xml("https://www.openstreetmap.org/api/0.6/node/4290854847")
## 
## # https://www.r-bloggers.com/r-and-the-web-for-beginners-part-ii-xml-in-r/
## library(XML)
## dat <- xmlParse("../data/4290854847.xml")
## xmltop = xmlRoot(dat)
## plantcat <- xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue))
## plantcat_df <- data.frame(t(plantcat),row.names=NULL)

#' 

#' 
## ----child = 'using_javascript.Rmd'--------------------------------------

#' 
## ----setup_usingjavascript1, include=FALSE-------------------------------
knitr::opts_chunk$set(echo = T,cache=T,warning=F)
htmlpres <- F
library(knitr)

#' 
#' 
#' ## Beispiel zu Campingplätzen
#' 
#' - Die Daten stammen von:
#' 
#' <http://www.openstreetmap.de/>
#' 
#' - Dabei wird die Overpass API genutzt:
#' 
#' <http://wiki.openstreetmap.org/wiki/Overpass_API>
#' 
## ----echo=F,eval=T-------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/data/CampSites_Germany.csv"

#' 
## ----eval=F--------------------------------------------------------------
## url <- "https://raw.githubusercontent.com/Japhilko/
## GeoData/master/2015/data/CampSites_Germany.csv"

#' 
## ----eval=T--------------------------------------------------------------
CampSites <- read.csv(url)

#' 
#' 
#' ## Überblick über Daten zu Campingplätzen
#' 
## ----echo=F,eval=T-------------------------------------------------------
kable(CampSites[1:8,1:4])

#' 
#' 
#' ## Notwendige Pakete
#' 
#' [magrittr](https://cran.r-project.org/web/packages/magrittr/index.html) - für den Pipe Operator in R:
#' 
## ----warning=F-----------------------------------------------------------
library("magrittr")

#' 
#' 
#' [leaflet](https://rstudio.github.io/leaflet/) - um  interaktive Karten mit der JavaScript Bibliothek 'Leaflet' zu erzeugen
#' 
## ----warning=F-----------------------------------------------------------
library("leaflet")

#' 
#' ## Eine erste interaktive Karte
#' 
## ----eval=htmlpres-------------------------------------------------------
leaflet()%>%
  addTiles()

#' 
#' ![Hallo Leaflet](figure/FirstLeaflet.PNG)
#' 
#' ## Auf eine Stadt zoomen
#' 
## ----eval=htmlpres-------------------------------------------------------
leaflet() %>%
  addTiles() %>%
  addMarkers(lng=8.456597, lat=49.48738,
             popup="Wo wir sind")

#' 
#' ![](figure/leafletMZESMA.PNG)
#' 
#' ## Eine interaktive Karte
#' 
## ----eval=htmlpres-------------------------------------------------------
m <- leaflet() %>%
  addTiles() %>%  
  addMarkers(lng=CampSites$lon, 
             lat=CampSites$lat, 
             popup=CampSites$name)
m

#' 
#' ## [Stamen als Hintergrundkarte](https://rstudio.github.io/leaflet/basemaps.html)
#' 
## ----eval=htmlpres-------------------------------------------------------
m %>% addProviderTiles("Stamen.Toner")

#' 
#' ![Eine Stamen Karte als Hintergrund](figure/InteractiveStamen.PNG)
#' 
#' ## CartoDB als Hintergrund
#' 
## ----eval=htmlpres-------------------------------------------------------
m %>% addProviderTiles("CartoDB.Positron")

#' 
#' ![CartoDB als Hintergrund](figure/CartoDBInteractive.PNG)
#' 
#' - [CartoDB](https://carto.com/attribution)
#' 
#' - [Info zu Map Tiles](https://www.mapbox.com/help/how-web-maps-work/)
#' 
#' 
#' ## [Mehr Hintergründe](http://leaflet-extras.github.io/leaflet-providers/preview/index.html)
#' 
#' 
## ----eval=htmlpres-------------------------------------------------------
m %>% addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")

#' 
#' ![Lichter der Nacht](figure/LightsInteractive.PNG)
#' 
#' 
#' 
#' 
#' ## Mehr Informationen hinzufügen
#' 
## ----eval=htmlpres-------------------------------------------------------
popupInfo <- paste(CampSites$name,"\n",CampSites$website)

#' 
## ----eval=htmlpres-------------------------------------------------------
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=CampSites$lon, 
             lat=CampSites$lat, 
             popup=popupInfo)
m

#' 
#' Das Ergebnis ist hier:
#' 
#' <http://rpubs.com/Japhilko82/CampSitesHL>
#' 
#' ## Die resultierende Karte
#' 
#' ![Campingplätze in Deutschland](figure/Germany_Campsites.PNG)
#' 
#' ## Popups in einer interactiven Karte
#' 
#' ![Camping Mannheim](figure/Camping_Mannheim.PNG)
#' 
#' Ich hab die Ergebnisse hochgeladen:
#' 
#' <http://rpubs.com/Japhilko82/Campsites>
#' 
#' ## Wie man auf Rpubs publizieren kann
#' 
#' ![Publizieren auf Rpubs](figure/PublishCampSitesGermany.PNG)
#' 
#' 
#' ## Ein weiteres Beispiel - Weltkulturerbe
#' 
## ----cache=T-------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/whcSites.csv"

whcSites <- read.csv(url) 

#' 
#' 
#' 
#' 
#' ## Eine interaktive Karte erstellen
#' 
## ----eval=htmlpres-------------------------------------------------------
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=whcSites$lon, 
             lat=whcSites$lat, 
             popup=whcSites$name_en)
m

#' 
#' ## Die Karte zeigen
#' 
#' ![Weltkulturerbestätten](figure/WHCPopUps.PNG) 
#' 
#' ## Farbe hinzu
#' 
## ----eval=htmlpres-------------------------------------------------------
whcSites$color <- "red"
whcSites$color[whcSites$category=="Cultural"] <- "blue"
whcSites$color[whcSites$category=="Mixed"] <- "orange"

#' 
#' ## Eine Karte mit Farbe erzeugen
#' 
## ----eval=htmlpres-------------------------------------------------------
m1 <- leaflet() %>%
  addTiles() %>%  
  addCircles(lng=whcSites$lon, 
             lat=whcSites$lat, 
             popup=whcSites$name_en,
             color=whcSites$color)
m1

#' 
#' ## Die Karte zeigen
#' 
#' ![Karte Weltkulturerbe](figure/WHCcircles.PNG) 
#' 
#' ## [Die Karte abspeichern](http://www.r-bloggers.com/interactive-mapping-with-leaflet-in-r-2/)
#' 
#' ![Als Website speichern](figure/snapshot2.png)
#' 
#' 
#' ## Das Paket `mapview` - Beispieldatensatz Franken
#' 
## ----eval=htmlpres-------------------------------------------------------
library(mapview)

mapview(franconia)

#' 
#' ![](figure/franconia.PNG)
#' 
#' 
#' ## GADM und `mapview`
#' 
## ----eval=htmlpres-------------------------------------------------------
mapview(leaflet::gadmCHE)

#' 
#' ## Das Paket `mapview`
#' 
#' <!--
#' folgendes stammt aus dem Helpfile
#' -->
#' 
## ----eval=htmlpres-------------------------------------------------------
library(mapedit)
library(magrittr)

lf <- mapview()
drawing <- lf %>%
  editMap()

#' 
#' ![](figure/editmap.PNG)
#' 
#' 
#' ## Das Paket `mapview`
#' 
## ------------------------------------------------------------------------
load("../data/spatsamp_68239.RData")

#' 
## ----eval=htmlpres-------------------------------------------------------
library(mapview)
mapview(spatsamp)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## library(sf)
## locations_sf <- st_as_sf(locations, coords = c("lon", "lat"), crs = 4326)

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## install.packages("lwgeom")

#' 
#' 
#' 
#' 
#' 
#' ## Das Paket `leaflet`
#' 
## ------------------------------------------------------------------------
library("tmaptools")
gc_tma <- geocode_OSM("Mannheim, GESIS")

#' 
#' 
#' 
## ----eval=htmlpres-------------------------------------------------------
library(leaflet)
library(magrittr)
m <- leaflet() %>%
addTiles() %>%
addMarkers(lng=8.463061 , lat=49.485736 , popup="GESIS Mannheim")
m

#' 
#' 
#' ## Das Paket `geojsonR`
#' 
#' - JavaScript Object Notation
#' 
#' <!--
#' https://cran.r-project.org/web/packages/geojsonR/vignettes/the_geojsonR_package.html
#' 
#' ma:geojsonr
#' 
#' https://wiki.openstreetmap.org/wiki/Overpass_turbo/GeoJSON
#' https://github.com/tyrasd/osmtogeojson
#' 
#' https://www.compose.com/articles/how-to-transform-and-use-openstreetmap-data-into-geojson-using-gdal/
#' -->
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("geojsonR")
## citation("geojsonR")

#' 
#' ## Wo bekomme ich ein geojson
#' 
#' - Ein [**OSM map feature**](https://wiki.openstreetmap.org/wiki/Map_Features) heraus suchen 
#' - z.B. `key=highway`, `value=bus_stop`
#' - Auf [**Overpass Turbo**](https://overpass-turbo.eu/) gehen und das Objekt herunterladen
#' 
## ------------------------------------------------------------------------
bus_stops <- geojsonio::geojson_read("../data/Amsterdam_bus_stop.geojson",
  what = "sp")

#' 
#' 
#' ## Die Punkte plotten
#' 
## ------------------------------------------------------------------------
sp::plot(bus_stops)

#' 
#' <!--
#' ## Eine direkte Abfrage
#' 
## ----eval=F--------------------------------------------------------------
## # http://overpass-api.de/query_form.html
## firstpart <- "http://overpass-api.de/api/interpreter?data="
## gcs <- geojsonio::geojson_read(paste0(firstpart,"node['name'='Gielgen'](50.7,7.1,50.8,7.2);out;",
##                                what="sp",method="web"))
## 
## 
## 
## gcs <- geojsonio::geojson_read("http://nominatim.openstreetmap.org/search?format=json&addressdetails=1&extratags=1&q=Amsterdam+Niederlande+Rozengracht+1",what="sp")

#' -->
#' ## [Das Paket `lawn`](https://cran.r-project.org/web/packages/lawn/index.html)
#' 
#' - [**Vignette**](https://cran.r-project.org/web/packages/lawn/vignettes/lawn_vignette.html) für das Paket `lawn`
#' 
#' - Mit dem Paket `lawn` kann die Javascript-Bibliothek turf.js in R eingebunden werden. 
#' - Weitere genutzte Javascript Bibliotheken (geojson-random und geojsonhint), werden verwendet um GeoJSON-Objekte zufällig zu erzeugen bzw. um die GeoJSON Objekte einzufärben.
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("lawn")
## citation("lawn")

#' 
#' 
## ------------------------------------------------------------------------
library(lawn)

#' 
#' 
#' ## Ein zufälliges Beispiel Objekt erstellen
#' 
#' - Mit der Funktion `gr_polygon` kann ein Beispielobjekt erzeugt werden. 
#' - Anschließend kann man sich das Objekt mit der generischen Funktion `view` plotten.
#' 
## ----eval=htmlpres-------------------------------------------------------
a <- gr_polygon(n = 1, vertices = 5, max_radial_length = 5)
view(a)

#' 
## ----eval=htmlpres-------------------------------------------------------
b <- gr_polygon(n = 1)
view(b)

#' 
#' <!--
#' https://github.com/node-geojson/geojson-random
#' 
#' https://wiki.openstreetmap.org/wiki/Overpass_turbo/GeoJSON
#' 
#' https://wiki.openstreetmap.org/wiki/GeoJSON
#' 
#' -->
#' 
#' ## Interaktive Deutschland Karte 
#' 
## ----eval=htmlpres-------------------------------------------------------
gcs <- geojsonio::geojson_read("../data/ddat.geojson")
view(gcs)

#' 
#' ## Das Paket `jsonlite`
#' 
#' - A Robust, High Performance JSON Parser and Generator for R
#' 
## ------------------------------------------------------------------------
library(jsonlite)
geoc <- read_json("../data/ddat.geojson")

#' 
#' <!--
#' https://github.com/Robinlovelace/Creating-maps-in-R/blob/master/R/shp-to-geojson.R
#' -->
#' 
## ------------------------------------------------------------------------
citation("jsonlite")

#' 
#' 
#' ## Das Paket `RJSONIO`
#' 
## ------------------------------------------------------------------------
library("RJSONIO")
con <- url("http://nominatim.openstreetmap.org/search?format=json&
addressdetails=1&extratags=1&q=Amsterdam+Niederlande+Rozengracht+1")
geoc <- fromJSON(paste(readLines(con,warn=F), 
                       collapse = ''))
close(con)

#' 
#' 
#' ## Links und Quellen
#' 
#' - [Rbloggers Artikel zu Leaflet](http://www.r-bloggers.com/the-leaflet-package-for-online-mapping-in-r/)
#' 
#' - [Einführung in Leaflet für R](https://rstudio.github.io/leaflet/)
#' 
#' - [Offline Karten mit RgoogleMaps und leaflet](https://blog.hwr-berlin.de/codeandstats/category/scientific-software/r/)
#' 
#' - [github Ordner für das lwan Paket](https://github.com/ropensci/lawn)
#' 
#' <!--
#' https://github.com/tyrasd/osmtogeojson
#' -->

#' 
## ----child = 'simplefeatures.Rmd'----------------------------------------

#' 
## ----setup_simplefeatures, include=FALSE---------------------------------
knitr::opts_chunk$set(echo = TRUE,fig.height=4,cach=T)
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
plot(bb_poly_ma)

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
#' ## Ein Beispieldatensatz
#' 
#' 
## ------------------------------------------------------------------------
demo(nc, ask = FALSE, echo = FALSE)

#' 
#' ## [Graphiken mit `sf`](https://r-spatial.github.io/sf/articles/sf5.html)
#' 
#' 
## ----message=FALSE, warning=FALSE----------------------------------------
plot(nc)

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
lon <- st_read("../data/london_sport.shp")

#' 
#' 
#' ## Das Shapefile plotten
#' 
## ------------------------------------------------------------------------
plot(lon$geometry)

#' 
#' 
#' <!--
#' https://www.r-spatial.org/r/2018/01/08/sf-0.6-0.html
#' -->
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
#' ## Die Vignetten für das Paket `sf`
#' 
#' https://r-spatial.github.io/sf/reference/st_as_sf.html
#' 
#' https://r-spatial.github.io/sf/reference/st_read.html
#' 
#' https://r-spatial.github.io/sf/articles/sf1.html

#' 
