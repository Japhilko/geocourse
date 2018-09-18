#' ---
#' title: "Einleitung und Motivation"
#' author: "Jan-Philipp Kolb"
#' date: "22 Oktober 2018"
#' output:
#'   beamer_presentation:
#'     colortheme: beaver
#'     fonttheme: professionalfonts
#'     highlight: null
#'   slidy_presentation:
#'     highlight: espresso
#'     keep_md: yes
#' ---
#' 
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,message=F,warning=F,cache=T)

#' 
#' <!--
#' In this paper, various approaches to download and process geodata, e.g., from OSM are shown. 
#' The data on OSM is released under the Open Database License (ODbL) 1.0. That allows multiple uses of the data \citep{schmidt2013extraction}. The study of \cite{barrington2017world} shows that the data quality of OSM is already sufficient in many countries to use it for scientific and analytic purposes.
#' See for example the Simulation of Urban MObility (SUMO) project (\citealt{behrisch2011sumo}). Much more research, carried out in various countries, is listed at \cite{wiki:research}.
#' 
#' The focus is on the most important APIs, which are listed in the individual chapters below. The significant advantage of using these specific APIs is that we can obtain data free of charge. Short examples are used to describe how the data can be imported into R and processed. 
#' In the next section (Background Maps - Download via Map Tile Servers), hints on the download of static maps from so-called map tile servers are presented. These maps can be used as background information for geographic visualization and may be used to highlight positions of so called points of interest (poi). I discuss an example where I am interested in public transportation in Amsterdam.  A prerequisite for this kind of visualisation is the availability of coordinates for points of interest. In the third chapter (Geocoding - Using the Google Maps and Nominatim API) the functionality of the Google Maps and OSM Nominatim API is used to realize geocoding. It is shown, how the Nominatim API can be used to search OSM data by name and address (\citealt{wiki:nominatim}).  
#' If it is the target to get coordinates for many points of interest, it can be useful to utilize the \href{http://wiki.openstreetmap.org/wiki/Overpass_API}{Overpass API}. This API is perfect to download data on very particular topics. Some functions of the \CRANpkg{osmdata} package, which also uses the Overpass API, are described in the fourth chapter (Map Features - Using the Overpass API). 
#' The usage of the main OSM-API is presented in the fifth chapter (Geodata - Using the main OpenStreetMap API). In the \CRANpkg{osmar}-package the main OSM API (\citealt{at:osmar}) is used. A summary follows at the end.
#' -->
#' 
#' - Es werden Möglichkeiten für den Download, den Import, die Verarbeitung und die Visualisierung von Geodaten vorgestellt. 
#' 
#' <!--
#' Die Daten auf OSM werden unter der Open Database License (ODbL) 1.0 freigegeben. Das ermöglicht eine Mehrfachverwendung der Daten \citep{schmidt2013extraction}. Die Studie von \cite{barrington2017world} zeigt, dass die Datenqualität von OSM in vielen Ländern bereits ausreichend ist, um sie für wissenschaftliche und analytische Zwecke zu nutzen.
#' Siehe zum Beispiel das Projekt Simulation of Urban MObility (SUMO) (\citealt{behrisch2011sumo}). Viel mehr Forschung, die in verschiedenen Ländern durchgeführt wird, ist unter \cite{wiki:research} aufgeführt.
#' -->
#' 
#' - Die wichtigsten APIs werden vorgestellt
#' 
#' <!--
#' Der wesentliche Vorteil der Verwendung dieser spezifischen APIs besteht darin, dass wir Daten kostenlos beziehen können. Anhand kurzer Beispiele wird beschrieben, wie die Daten in R importiert und verarbeitet werden können. 
#' Im nächsten Abschnitt (Hintergrundkarten - Download über Map Tile Server) werden Hinweise zum Download von statischen Karten von sogenannten Map Tile Servern gegeben. Diese Karten können als Hintergrundinformationen für die geografische Visualisierung verwendet werden und können verwendet werden, um Positionen von sogenannten Points of Interest (Poi) hervorzuheben. Ich diskutiere ein Beispiel, bei dem ich mich für den öffentlichen Verkehr in Amsterdam interessiere.  Voraussetzung für diese Art der Visualisierung ist die Verfügbarkeit von Koordinaten für Points of Interest. Im dritten Kapitel (Geocoding - Using the Google Maps and Nominatim API) wird die Funktionalität der Google Maps and OSM Nominatim API zur Realisierung der Geocodierung genutzt. Es wird gezeigt, wie die Nominatim API verwendet werden kann, um OSM-Daten nach Name und Adresse zu suchen (\citealt{wiki:nominatim}).  
#' Wenn es das Ziel ist, Koordinaten für viele interessante Punkte zu erhalten, kann es nützlich sein, die \href{http://wiki.openstreetmap.org/wiki/Overpass_API}{Overpass API} zu verwenden. Diese API ist perfekt, um Daten zu sehr speziellen Themen herunterzuladen. Einige Funktionen des Pakets \CRANpkg{osmdata}, das auch die Overpass API verwendet, werden im vierten Kapitel (Map Features - Using the Overpass API) beschrieben. 
#' Die Verwendung der wichtigsten OSM-API wird im fünften Kapitel (Geodaten - Verwendung der wichtigsten OpenStreetMap-API) vorgestellt. Im \CRANpkg{osmar}-Paket wird die Haupt OSM-API (\citealt{at:osmar}) verwendet. 
#' -->
#' 
#' <!--
#' 
#' -->
#' ## Start
#' 
## ----echo=F,eval=F-------------------------------------------------------
## library(ggmap)
## qmap("Firenze",zoom=18, maptype = "satellite")

#' 
#' http://rpubs.com/Japhilko82/gesis_mannheim
#' 
#' ![](figure/Amsterdam_osmplotr_highways.pdf)
#' 
#' 
#' ## Outline
#' 
#' - Spatial Turn - why this course
#' - Research questions
#' - Available data
#' - Neogeograpy
#' - Realisation
#' 
#' 
#' 
#' <!--
#' ## Motivation - recent phenomena
#' 
#' - The spatial representation helps to understand (current) phenomena.
#' 
#' ![US presidential primary elections in Florida](figure/FloridaPresPrim.png)
#' 
#' Source: <http://www.arilamstein.com/blog/2016/03/21/mapping-election-results-r-choroplethr/>
#' 
#' -->
#' 
#' 
#' 
#' ## [Laws of Spatial Sience](http://de.slideshare.net/rheimann04/big-social-data-the-spatial-turn-in-big-data)
#' 
#' [Tobler's law](https://en.wikipedia.org/wiki/Tobler's_first_law_of_geography)
#' 
#' > everything is related to everything else, but near things are more related than distant things.
#' 
#' ## [Spatial Turn](https://de.wikipedia.org/wiki/Spatial_turn)
#' 
#' > Spatial turn is a term used to describe an intellectual movement that places emphasis on place and space in social science and the humanities.
#' 
#' [Englisches Wikipedia](https://en.wikipedia.org/wiki/Spatial_turn)
#' 
#' 
#' ## Regional/geographical differences in the perception of...
#' 
#' - ... measures to promote climatic change
#' - ... big infrastructure projects
#' 
#' <!--
#' ## Nice output - example [Wind Map](http://hint.fm/wind/)
#' 
#' <http://hint.fm/wind/>
#' 
#' <!--
#' ![pic](http://www.flowjustflow.com/wp-content/gallery/hint-fm/high-res-3600.jpg)
#' -->
#' 
#' <!--
#' ![Wind map USA](figure/windfm.PNG)
#' -->
#' 
#' 
#' ## Availability of data - Example Census Atlas
#' 
#' <https://atlas.zensus2011.de/>
#' 
#' 
#' 
#' ## Verfügbarkeit der Daten - Beispiel [Fahrradunfälle in Berlin](http://michael-hoerz.de/maps/berlin-bike/)
#' 
#' <http://www.sowirdberlin.de/>
#' ![](https://asset0.torial.com/system/portfolio_item_images/production/2014/07/21/m5we1vmq6_preview_image_9678.jpg)
#' 
#' 
#' 
#' ## Heterogener Datenbestand - Beispiel <http://names.mappinglondon.co.uk/>
#' 
#' ![](http://mappinglondon.co.uk/wp-content/uploads/2011/11/surnames1.png)
#' 
#' 
#' ## Motivation - Warum die Darstellung in Karten
#' 
#' - Darstellung in Karten ermöglicht besseres Verständnis bspw. sozialwissenschaftlicher Phänomene.
#' 
#' - Attraktiver Output
#' 
#' - Durch die INSPIRE Richtlinie und *Collaborative Mapping* wächst der verfügbare Bestand an Geodaten.
#' 
#' - Daten sind oft frei verfügbar im Internet (z.B. durch die Nutzung von APIs)
#' - Die Daten sind allerdings oft wenig oder gar nicht strukturiert (z.B. Internet Dokumente), heterogen und
#' - meistens nicht für die Nutzung zur räumlichen Visualisierung vorgesehen, beinhalten aber implizit  geographische Informationen (Web 2.0)
#' - Oftmals sind wenig oder keine Metadaten vorhanden
#' 
#' 
#' ## Übersicht - [warum R](http://www.edureka.co/)
#' 
#' 
#' 
#' ![](http://d287f0h5fel5hu.cloudfront.net/blog/wp-content/uploads/2013/06/bar-learn-r-img11.png)
#' 
#' ## [R Nutzer rund um die Welt](http://blog.revolutionanalytics.com/)
#' 
#' 
#' ![](http://revolution-computing.typepad.com/.a/6a010534b1db25970b0191035099d8970c-pi)
#' 
#' ## [Wo sind die aktivsten Nutzer?](http://spatial.ly/)
#' 
#' ![](http://spatial.ly/wp-content/uploads/2013/06/r_activity.png)
#' 
#' 
#' ## Was ist das Ziel - Straßen in Berlin
#' 
#' Dargestellt werden OpenStreetMap Daten, die mit der Overpass API heruntergeladen wurden.
#' 
#' ![](https://raw.githubusercontent.com/Japhilko/GeoData/master/data/figure/streets_Berlin2.png)
#' 
#' 
#' <!--
#' ## [Openstreetmap Daten](https://github.com/Japhilko/OSMshinyApp/)
#' 
#' ![](figure/shinyApp.PNG)
#' -->
#' 
#' ## Links mit Beispielen
#' 
#' - Shiny App zu [Indikatoren](https://japhilko.shinyapps.io/Choropleths/) für Europa
#' 
#' - Räumliche Visualisierung in den USA - [Walmarts in den USA](https://rpubs.com/Radcliffe/walmart)
#' - [Race Gap Police USA](http://www.nytimes.com/interactive/2014/09/03/us/the-race-gap-in-americas-police-departments.html?_r=0) - [Wahl USA](http://fivethirtyeight.com/)
#' 
#' - Zeit Artikel zum Zustand der [Eisenbahnbrücken](http://detektor.fm/digital/datenjournalismus-interaktive-karte-zeigt-marode-deutsche-bahn-bruecken) 
#' 
#' - [Fahrradunfälle](http://michael-hoerz.de/maps/berlin-bike/) in Berlin
#' 
#' - [Verteilung Fußballfans](http://interaktiv.morgenpost.de/beta-fussballkarte/#7/51.258/10.756)
#' 
#' - [Plastiktüten im Meer](http://news.nationalgeographic.com/news/2014/07/140715-ocean-plastic-debris-trash-pacific-garbage-patch/)
#' 
#' 
#' Datenquellen: 
#' 
#' - [Pegelstände](https://www.pegelonline.wsv.de/gast/start) in Deutschland
#' - [driven by data](http://driven-by-data.net/)
#' 
#' Resourcen
#' 
#' - Andreas Plank - [Grafiken und Statistik in R](http://www.chironomidaeproject.com/fileadmin/downloads/Formeln_in_R.pdf)
#' 
#' 
#' 
#' <!--
#' ## Verschiedene Kartentypen
#' 
#' - [Create and integrate maps in your R workflow with the cartography package](https://rgeomatic.hypotheses.org/842)
#' 
#' 
#' - [Das Paket cartography](https://cran.r-project.org/web/packages/cartography/vignettes/cartography.html)
#' 
#' -->
