#' ---
#' title: "B1 - Das Arbeiten mit OSM Daten"
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
#'   ioslides_presentation: 
#'     keep_md: yes
#' ---
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
