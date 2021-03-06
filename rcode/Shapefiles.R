#' ---
#' title: "A5 - Shapefiles"
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
## ----setup_shapefiles, include=FALSE-------------------------------------
knitr::opts_chunk$set(echo = T,cache=T,fig.height=4)
library(knitr)
GESIS <- T
athome <- !GESIS

ONB_ex <- T
spatsampI <-F

#' 
#' 
#' ## Worum geht es in diesem Abschnitt
#' 
#' - Was sind Shapefiles
#' - Shapefiles mit Vorwahl- und PLZ-Bereichen importieren
#' - Einzelne Polygonzüge zusammenfassen
#' - Adressen für die gezogenen Punkte bestimmen
#' - Adressdatensatz bereinigen
#' - Entfernung zum Hauptbahnhof bestimmen
#' 
#' 
#' 
#' ## Das shapefile Format ... 
#' 
#' - ... ist ein beliebtes Format räumlicher Vektordaten für geographisches Informationssysteme (GIS).
#' - Es wurde entwickelt und reguliert von [ESRI](http://www.esri.com/)
#' 
#' - (meist) offene Spezifikation um Daten Interoperabilität zwischen Esri und anderen Formaten zu sichern. 
#' 
#' - Es können Punkte, Linien und Polygone beschrieben werden
#' 
#' - Jedes Element hat Attribute, wie bspw. Name oder Temperatur die es beschreiben.
#' 
#' Quelle: <https://en.wikipedia.org/wiki/Shapefile>
#' 
#' 
#' ## Der R Befehl readShapePoly
#' 
#' Um Shape-Dateien zu lesen, ist es notwendig, 
#' die drei Dateien mit den folgenden Dateierweiterungen im gleichen Verzeichnis zu haben:
#' 
#' - .shp
#' - .dbf
#' - .shx
#' 
#' 
#' ## [**Vorwahlbereiche in Deutschland**](http://www.bundesnetzagentur.de/SharedDocs/Downloads/DE/Sachgebiete/Telekommunikation/Unternehmen_Institutionen/Nummerierung/Rufnummern/ONVerzeichnisse/ONBGrenzen/ONB_Grenzen.html)
#' 
#' ### www.bundesnetzagentur.de
#' 
## ----echo=F--------------------------------------------------------------
geodata_path <- "D:/Daten/Daten/GeoDaten/"

#' 
#' - Wir verwenden das Paket maptools` um die Daten einzulesen:
#' 
## ----echo=T,eval=ONB_ex,warning=F----------------------------------------
setwd(geodata_path)
library(maptools)
onb <- readShapePoly("onb_grenzen.shp")

#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd(geodata_path)
## onb <- sf::st_read("onb_grenzen.shp")

#' 
#' - Quelle Ortsnetzbereiche: [**Bundesnetzagentur**](http://www.bundesnetzagentur.de/DE/Sachgebiete/Telekommunikation/Unternehmen_Institutionen/Nummerierung/Rufnummern/ONVerzeichnisse/GISDaten_ONBGrenzen/ONBGrenzen_Basepage.html)
#' 
#' 
#' ## Die Karte zeichnen
#' 
## ----eval=ONB_ex---------------------------------------------------------
plot(onb)

#' 
#' <!--
#' ![onbD](figure/onbGermany.png)
#' -->
#' 
#' ## Der Datenslot
#' 
## ----eval=ONB_ex---------------------------------------------------------
kable(head(onb@data))

#' 
#' <!--
#' |   |VORWAHL |NAME                 |KENNUNG |
#' |:--|:-------|:--------------------|:-------|
#' |0  |04651   |Sylt                 |NA      |
#' |1  |04668   |Klanxbüll            |NA      |
#' |2  |04664   |Neukirchen b Niebüll |NA      |
#' |3  |04663   |Süderlügum           |NA      |
#' |4  |04666   |Ladelund             |NA      |
#' |5  |04631   |Glücksburg Ostsee    |NA      |
#' -->
#' 
#' ## Einen Vorwahlbereich ausschneiden
#' 
## ----eval=ONB_ex---------------------------------------------------------
vwb <- onb@data$VORWAHL
vwb2 <- substr(vwb, 1,2)

#' 
## ----eval=ONB_ex,echo=T--------------------------------------------------
library(lattice)
barchart(table(vwb2),col="royalblue",
         xlab="Häufigkeit")

#' 
#' <!--
#' ![vwb1freq](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/vwb1freq.png)
#' -->
#' 
#' ## Vorwahlbereich ausschneiden
#' 
## ----eval=ONB_ex---------------------------------------------------------
vwb6 <- onb[vwb2=="06",]
plot(vwb6)

#' 
#' <!--
#' ![vwb6](figure/vwb06.PNG)
#' -->
#' ## Shapefiles zusammenfassen
#' 
## ----eval=ONB_ex---------------------------------------------------------
vwb6c <- unionSpatialPolygons(vwb6,
              rep(1,length(vwb6)))
plot(vwb6c,col="royalblue")

#' 
#' <!--
#' ![vwb6c](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/vwb6c.png)
#' -->
#' 
#' 
#' 
#' 
#' ## Wo ist Mannheim?
#' 
## ----eval=ONB_ex---------------------------------------------------------
Com <- vwb6@data$NAME
plot(vwb6)
plot(vwb6[Com=="Mannheim",],col="red",add=T)
plot(vwb6[Com=="Heidelberg",],col="green",add=T)
plot(vwb6[Com=="Kaiserslautern",],col="blue",add=T)

#' 
#' <!--
#' ![Drei Städte](figure/DreiStaedte.PNG)
#' -->
#' 
#' ## Paket `rgdal` - PLZ Datensatz einlesen
#' 
#' ### [**Quelle**](http://arnulf.us/PLZ) für PLZ Shapefiles
#' 
## ----eval=athome,echo=F--------------------------------------------------
data_path <- "D:/GESIS/data/"

#' 
## ----eval=GESIS,echo=F---------------------------------------------------
data_path <- "D:/Daten/Daten/GeoDaten/"

#' 
#' 
## ------------------------------------------------------------------------
library(rgdal)

#' 
#' 
## ------------------------------------------------------------------------
setwd(data_path)
plz <- readOGR ("post_pl.shp","post_pl")

#' 
#' ## Die Daten plotten
#' 
## ------------------------------------------------------------------------
plzbereich <- substr(plz@data$PLZ99,1,2)
plot(plz[plzbereich=="68",])

#' 
#' 
#' ## Die Grenze von Mannheim
#' 
## ------------------------------------------------------------------------
ma_map <- plz[plz$PLZORT99=="Mannheim",]
plot(ma_map)

#' 
#' ## Die PLZ-Bereiche von Mannheim zusammenfassen
#' 
#' - Wir nutzen den Befehl `unionSpatialPolygons` im Paket `maptools`
#' 
## ------------------------------------------------------------------------
library(maptools)
ma_map2 <- unionSpatialPolygons(SpP = ma_map,
                                IDs = rep(1,length(ma_map)))
plot(ma_map2)

#' 
#' 
#' 
#' 
#' 
#' 
#' ## Global Adminastrative Boundaries - [GADM](http://www.gadm.org/) - NUTS level 1
#' 
## ------------------------------------------------------------------------
library(raster)

#' 
#' 
## ----warning=F,message=F,eval=T------------------------------------------
library(raster)
LUX1 <- getData('GADM', country='LUX', level=1)
plot(LUX1)

#' 
#' 
#' 
#' ## Ein Blick auf die Daten
#' 
## ----eval=F,echo=F-------------------------------------------------------
## LUXA <- LUX1[1,]
## plot(LUXA)

#' 
#' Koordinaten im polygon slot
## ----eval=F--------------------------------------------------------------
## LUX1@polygons[[1]]@Polygons[[1]]@coords

#' 
## ----echo=F,eval=T-------------------------------------------------------
head(LUX1@polygons[[1]]@Polygons[[1]]@coords)

#' 
#' ## Der Datenslot
#' 
## ----eval=T--------------------------------------------------------------
head(LUX1@data)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## kable(head(LUX1@data))

#' 
#' ## [GADM](http://www.gadm.org/)- NUTS level 3
#' 
## ----LUX3,warning=F,eval=T-----------------------------------------------
LUX3 <- getData('GADM', country='LUX', level=3)
plot(LUX3)

#' 
#' ## [GADM](http://www.gadm.org/)- NUTS level 4
#' 
## ----LUX4,warning=F,eval=T-----------------------------------------------
LUX4 <- getData('GADM', country='LUX', level=4)
plot(LUX4)

#' 
#' ## [GADM](http://www.gadm.org/)- NUTS level 3
#' 
## ----DEU3,warning=F,eval=F-----------------------------------------------
## DEU3 <- getData('GADM', country='DEU', level=3)
## plot(DEU3)

#' 
#' ![](figure/DEU3.png)
#' 
#' ## Gemeinden in Deutschland
#' 
#' [Bundesamt für Kartographie und Geodäsie (BKG)](http://www.geodatenzentrum.de/geodaten/gdz_rahmen.gdz_div?gdz_spr=deu&gdz_akt_zeile=5&gdz_anz_zeile=1&gdz_unt_zeile=15&gdz_user_id=0)
#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten/vg250_ebenen")

#' 
#' 
## ----cache=F,message=F,warning=F,eval=F----------------------------------
## library(maptools)
## krs <- readShapePoly("vg250_krs.shp")
## plot(krs)

#' 
#' ![Kreise Deutschland](figure/vg250_krs.png)
#' 
#' ## Kreise eines Bundeslandes
#' 
## ----eval=F--------------------------------------------------------------
## fds <- substr(krs@data$AGS,1,2)
## 
## plot(krs[fds=="05",])

#' 
#' ![Kreise NRW](figure/KreiseNRW.png)
#' 
#' ## Andere Quellen
#' 
#' - [**World Port Index**](http://msi.nga.mil/NGAPortal/MSI.portal?_nfpb=true&_pageLabel=msi_portal_page_62&pubCode=0015)
#' 
## ----echo=F,eval=F-------------------------------------------------------
## setwd("D:/Daten/Daten/GeoDaten/WPI_Shapefile")

#' 
#' 
## ----message=F,warning=F,eval=F,echo=T-----------------------------------
## library(rgdal)
## WPI <- readOGR ("WPI.shp","WPI")
## plot(WPI)

#' 
#' ![World Port Index](figure/WPI.png)
#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## git.path <- "C:/Users/kolbjp/Documents/GitHub/GeoData"
## setwd(git.path)

#' 
#' Datenbanken für Karten
#' 
## ----eval=F,echo=F-------------------------------------------------------
## install.packages("mapdata")

#' 
#' 
## ----message=F,warning=F-------------------------------------------------
library(mapdata)

#' 
#' ## Weitere Quellen für Shapefiles
#' 
#' - [**Eurostat Karten**](http://epp.eurostat.ec.europa.eu/portal/page/portal/gisco_Geographical_information_maps/popups/
#' references/administrative_units_statistical_units_1) - in der Regel die Europäischen Mitgliedsstaaten
#' 
#' - [**Open linked data**](https://www.ordnancesurvey.co.uk/business-and-government/products/opendata-products-grid.html) - Ordnance Survey (GB)
#' 
#' ![](figure/OpenLinkedData.PNG)
#' 
#' - [**World Borders Datensatz**](http://thematicmapping.org/downloads/world_borders.php)
#' 
#' - [**National Historical Information System**](https://www.nhgis.org/)
#' 
#' - [**Freie Polygon-Daten für die USA**](http://www.freemapdata.com/html/free_polygon_data.html)
#' 
#' - Überblick über - [**Spatial Data in R**](https://science.nature.nps.gov/im/datamgmt/statistics/r/advanced/spatial.cfm)
#' 
#' <!--
#' - [ggmap und shapefiles](http://www.r-bloggers.com/shapefile-polygons-plotted-on-google-maps-using-ggmap-in-r-throw-some-throw-some-stats-on-that-mappart-2/)
#' -->
