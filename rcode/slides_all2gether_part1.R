#' ---
#' title: "Geodaten - erster Teil"
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
#'   slidy_presentation: 
#'     keep_md: yes
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

#' 
#' 
## ----child = 'Intro.Rmd'-------------------------------------------------

#' 
#' 
## ----setupIntro, include=FALSE-------------------------------------------
knitr::opts_chunk$set(echo = TRUE,message=F,warning=F,cache=T)

#' 
#' ## Das Thema Geodatenlandschaft
#' 
#' 
#' <!--
#' Background Maps - Download via Tile Servers
#' -->
#' 
#' 
#' 
#' <!--
#' ## Inhalt dieses Abschnitts
#' 
#' 
#' Einerseits die Daten vorstellen, die vorhanden sind
#' 
#' Zensus, IÖR Daten
#' 
#' Andererseits neue Entwicklungen in R vorstellen
#' 
#' -->
#' 
#' 
#' ![](figure/BildRatSWDBericht.png)
#' 
#' 
#' ## R-Pakete - Zum Download von Geo-Information
#' 
#' ### [Das Paket `ggmap`](https://sites.google.com/site/davidkahle/ggmap)
#' 
#' 
#' - David Kahle and Hadley Wickham: `ggmap` - Spatial Visualization with `ggplot2`
#' 
#' 
#' ![](figure/Rgeopackages.PNG)
#' 
#' 
#' ## [Worum geht es?](http://blog.revolutionanalytics.com/2012/07/making-beautiful-maps-in-r-with-ggmap.html)
#' 
#' 
#' ### Weine probieren im Napa Valley?
#' 
#' 
#' 
#' ![](figure/Wine_nappa.png)
#' 
#' 
#' ## Ziel dieses Kurses
#' 
#' ### Vorgestellt werden:
#' 
#' - Möglichkeiten für den Download, den Import, die Verarbeitung und die Visualisierung von Geodaten 
#' <!--
#' Die Daten auf OSM werden unter der Open Database License (ODbL) 1.0 freigegeben. Das ermöglicht eine Mehrfachverwendung der Daten \citep{schmidt2013extraction}. Die Studie von \cite{barrington2017world} zeigt, dass die Datenqualität von OSM in vielen Ländern bereits ausreichend ist, um sie für wissenschaftliche und analytische Zwecke zu nutzen.
#' Siehe zum Beispiel das Projekt Simulation of Urban MObility (SUMO) (\citealt{behrisch2011sumo}). Viel mehr Forschung, die in verschiedenen Ländern durchgeführt wird, ist unter \cite{wiki:research} aufgeführt.
#' -->
#' 
#' - Quellen für Geodaten
#' 
#' - Die wichtigsten Programmierschnittstellen (APIs) um die Daten zu bekommen
#' 
#' - R-Pakete um diese Daten zu verarbeiten und zu visualisieren
#' 
#' ## Motivation
#' 
#' ### Motivation allgemein
#' 
#' - Raumbezug herstellen/nutzen
#' - Sekundäranalyse für bestehenden Daten 
#' - Analysepotentiale der Geokodierung vorstellen
#' - Verbindung von sozial- mit raumwissenschaftlichen Daten
#' 
#' 
#' ### Motivation - Warum die Darstellung in Karten
#' 
#' - Darstellung in Karten ermöglicht besseres Verständnis von sozialwissenschaftlichen Phänomene - Attraktiver Output
#' 
#' - Durch die INSPIRE Richtlinie und *Collaborative Mapping* wächst der verfügbare Bestand an Geodaten.
#' 
#' - Daten sind oft frei verfügbar im Internet (z.B. Nutzung von APIs)
#' - Die Daten sind oft wenig oder gar nicht strukturiert, heterogen und oft nicht zur räumlichen Visualisierung vorgesehen, beinhalten aber implizit  geographische Informationen (Web 2.0)
#' - Oftmals sind wenig oder keine Metadaten vorhanden
#' 
#' ## [Laws of Spatial Sience](http://de.slideshare.net/rheimann04/big-social-data-the-spatial-turn-in-big-data)
#' 
#' ### [Tobler's law](https://en.wikipedia.org/wiki/Tobler's_first_law_of_geography)
#' 
#' > everything is related to everything else, but near things are more related than distant things.
#' 
#' ### [Spatial Turn](https://de.wikipedia.org/wiki/Spatial_turn)
#' 
#' > Spatial turn is a term used to describe an intellectual movement that places emphasis on place and space in social science and the humanities.
#' 
#' <!--
#' [Englisches Wikipedia](https://en.wikipedia.org/wiki/Spatial_turn)
#' -->
#' 
#' <!--
#' 
#' ## Regional/geographical differences in the perception of...
#' 
#' - ... measures to promote climatic change
#' - ... big infrastructure projects
#' 
#' 
#' 
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
#' <!--
#' ## Availability of data - Example Census Atlas
#' -->
#' 
#' ## Ergebnisse des Zensus 2011 zum [**Download**](https://www.zensus2011.de/SharedDocs/Aktuelles/Ergebnisse/DemografischeGrunddaten.html?nn=3065474)
#' 
#' <!--
#' ## Verfügbarkeit von Daten - Beispiel Zensus Atlas
#' 
#' <https://atlas.zensus2011.de/>
#' -->
#' 
#' 
#' ![](figure/zensus2011_logo.jpg)
#' 
#' 
#' ### Gemeindeebene
#' 
#' - Bevölkerung nach Geschlecht, Altersgruppe, Familienstatus, Staatsangehörigkeit und Religion
#' 
#' ###  1 $\text{km}^2$ Raster
#' 
#' - Bevölkerung, Leerstandsquote, Wohnfläche und Haushaltsgröße
#' 
#' ###  100 $\text{m}^2$ Raster
#' 
#' Bevölkerung
#' 
#' ## Zensus Ergebnisse
#' 
#' Beispiel Anteil der Personen aus EU27 Land an Einwohnerzahl pro
#' Gemeinde in Oberfranken
#' 
#' 
#' ![](figure/KRSBamberg_EWZ.pdf)
#' <!--
#' ## Verfügbarkeit der Daten - Beispiel [Fahrradunfälle in Berlin](http://michael-hoerz.de/maps/berlin-bike/)
#' 
#' <http://www.sowirdberlin.de/>
#' ![](https://asset0.torial.com/system/portfolio_item_images/production/2014/07/21/m5we1vmq6_preview_image_9678.jpg)
#' 
#' -->
#' 
#' <!--
#' ## Heterogener Datenbestand - Beispiel <http://names.mappinglondon.co.uk/>
#' 
#' ![](http://mappinglondon.co.uk/wp-content/uploads/2011/11/surnames1.png)
#' -->
#' 
#' <!--
#' ## Übersicht - [warum R](http://www.edureka.co/)
#' 
#' ![](http://d287f0h5fel5hu.cloudfront.net/blog/wp-content/uploads/2013/06/bar-learn-r-img11.png)
#' -->
#' 
#' <!--
#' ## [R Nutzer rund um die Welt](http://blog.revolutionanalytics.com/)
#' 
#' 
#' ![](http://revolution-computing.typepad.com/.a/6a010534b1db25970b0191035099d8970c-pi)
#' 
#' ## [Wo sind die aktivsten Nutzer?](http://spatial.ly/)
#' 
#' ![](http://spatial.ly/wp-content/uploads/2013/06/r_activity.png)
#' -->
#' 
#' ## Openstreetmap Projekt
#' 
#' ![](figure/Buldings_Paris.PNG)
#' 
#' <!--
#' https://hal.inria.fr/hal-01852585/document
#' -->
#' 
#' 
#' 
#' <!--
#' ## [Openstreetmap Daten](https://github.com/Japhilko/OSMshinyApp/)
#' 
#' ![](figure/shinyApp.PNG)
#' -->
#' 
#' 
#' 
#' ## Das Openstreetmap Projekt...
#' 
#' - Durch kollaboratives Mapping ist eine riesige Datenmenge zugänglich. 
#' - Viele Menschen tragen jeden Tag Informationen bei.
#' - ... ermöglicht Zugang zu Big Data der Geographie.
#' - Die wachsende Menge an Geodaten wird von Freiwilligen gesammelt oder über Crowd-sourcing gewonnen.
#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## install.packages("conStruct") # Models Spatially Continuous and Discrete Population Genetic Structure
## install.packages("MazamaSpatialUtils") # Spatial Data Download and Utility Functions - 2018-09-18
## 
## install.packages("spData")
## 
## # 2018-09-18	SPUTNIK	SPatially aUTomatic deNoising for Ims toolKit
## # 2018-09-17	sabre	Spatial Association Between Regionalizations
## # 2018-09-17	spatsoc	Group Animal Relocation Data by Spatial and Temporal Relationship
## # 2018-09-16	mapview	Interactive Viewing of Spatial Data in R
## # 2018-09-16	sparr	Spatial and Spatiotemporal Relative Risk
## # 2018-09-15	spData	Datasets for Spatial Analysis

#' 
#' 
#' 
#' ## Was ist das Ziel - Straßen in Berlin
#' 
#' Dargestellt werden OpenStreetMap Daten, die mit der Overpass API heruntergeladen wurden.
#' 
#' ![](figure/streets_Berlin2.png)
#' 
#' 
#' 
#' ## Globale Muster der Straßeninfrastruktur
#' 
#' <!--
#' Global patterns of current and future road infrastructure
#' -->
#' 
#' ### Studie von Johan Meijer, Mark AJ Huijbregts,  Kees Schotten,  und Aafke Schipper
#' 
#' ![](figure/GRIP_globalroads.PNG)
#' 
#' <!--
#' @article{meijer2018global,
#'   title={Global patterns of current and future road infrastructure},
#'   author={Meijer, Johan and Huijbregts, Mark AJ and Schotten, Kees and Schipper, Aafke},
#'   journal={Environmental Research Letters},
#'   year={2018},
#'   publisher={IOP Publishing}
#' }
#' -->
#' 
#' 
#' 
#' ## Links mit Beispielen
#' 
#' - Shiny App zu [**Indikatoren**](https://japhilko.shinyapps.io/Choropleths/) für Europa
#' 
#' - Räumliche Visualisierung in den USA - [**Walmarts in den USA**](https://rpubs.com/Radcliffe/walmart)
#' - [**Race Gap Police USA**](http://www.nytimes.com/interactive/2014/09/03/us/the-race-gap-in-americas-police-departments.html?_r=0) - [**Wahl USA**](http://fivethirtyeight.com/)
#' 
#' - Zeit Artikel zum Zustand der [**Eisenbahnbrücken**](http://detektor.fm/digital/datenjournalismus-interaktive-karte-zeigt-marode-deutsche-bahn-bruecken) 
#' 
#' - [**Fahrradunfälle**](http://michael-hoerz.de/maps/berlin-bike/) in Berlin
#' 
#' - [**Verteilung Fußballfans**](http://interaktiv.morgenpost.de/beta-fussballkarte/#7/51.258/10.756)
#' 
#' - [**Plastiktüten im Meer**](http://news.nationalgeographic.com/news/2014/07/140715-ocean-plastic-debris-trash-pacific-garbage-patch/)
#' 
#' 
#' ### Datenquellen: 
#' 
#' - Datensätze zu [**Pegelständen**](https://www.pegelonline.wsv.de/gast/start) in Deutschland
#' - Viele Datensätze auf [**driven by data**](http://driven-by-data.net/)
#' 
#' ### Resourcen
#' 
#' - Andreas Plank - [**Grafiken und Statistik in R**](http://www.chironomidaeproject.com/fileadmin/downloads/Formeln_in_R.pdf)
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
#' 
#' 
#' https://nowosad.github.io/post/world-pop-change/
#' 
#' http://development-frontiers.com/tutorials/
#' 
#' https://m.xkcd.com/2048/
#' 
#' -->

#' 
## ----child = 'ggmap.Rmd'-------------------------------------------------

#' 
## ----setup_ggmap, include=FALSE------------------------------------------
knitr::opts_chunk$set(echo = TRUE,message=F,warning=F,cache=T,fig.height=4)
Ex <- F

#' 
## ----echo=F,warning=F----------------------------------------------------
library(knitr)

#' 
#' 
#' 
#' ## Inhalt dieses Abschnitts
#' 
#' Arten von räumlichen Daten: 
#' 
#' - [**Straßenkarten**](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf) 
#' - [**Satelliten Bilder**](http://www.mostlymuppet.com/tag/maps/)
#' - [**Physische Daten und Karten**](http://gis.stackexchange.com/questions/3083/what-makes-a-map-beautiful/45518#45518)
#' - [**Abstrakte Karten**](http://www.designfaves.com/2014/03/abstracted-maps-reveal-cities-personalities)
#' - ...
#' 
#' Das R-paket [**`ggmap`**](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf) wird im folgenden genutzt um verschiedene Kartentypen darzustellen.
#' 
#' Mit [**`qmap`**](http://www.inside-r.org/packages/cran/ggmap/docs/qmap) kann man eine schnelle Karte erzeugen.
#' 
#' ## Installieren des Paketes
#' 
#' - Zur Erstellung der Karten brauchen wir das Paket `ggmap`:
#' 
## ----eval=F--------------------------------------------------------------
## devtools::install_github("dkahle/ggmap")
## devtools::install_github("hadley/ggplot2")
## install.packages("ggmap")

#' 
#' ## Paket ggmap - Hallo Welt
#' 
#' - Um das Paket zu laden verwenden wir den Befehl `library`
#' 
## ----message=F,warning=F-------------------------------------------------
library(ggmap)

#' 
#' Und schon kann die erste Karte erstellt werden:
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap("Mannheim")

#' 
## ----echo=F,message=F,warning=F,cache=T,eval=F---------------------------
## MA_map <- qmap("Mannheim")

#' 
#' 
#' ![](figure/Mannheim_ggmap.pdf)
#' 
#' ## Karte für eine Sehenswürdigkeit
#' 
## ----eval=Ex-------------------------------------------------------------
qmap("Berlin Brandenburger Tor")

#' 
#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## pdf("figure/BBT_ggmap.pdf")
## BBT
## dev.off()
## 
## png("figure/BBT_ggmap.png")
## BBT
## dev.off()

#' 
#' 
#' ![](figure/BBT_ggmap.pdf)
#' 
#' ## Karte für einen ganzen Staat
#' 
## ----message=F,eval=Ex---------------------------------------------------
qmap("Germany")

#' 
## ----eval=F,echo=F-------------------------------------------------------
## germany <- qmap("Germany")
## save(germany,file="../data/germany.RData")
## 
## pdf("figure/germany.pdf")
## germany
## dev.off()
## 
## png("figure/germany.png")
## germany
## dev.off()

#' 
#' - Wir brauchen ein anderes *zoom level*
#' 
#' ![](figure/germany.pdf)
#' 
#' 
#' ## Ein anderes *zoom level*
#' 
#' - level 3 - Kontinent / level 10 - Stadt / level 21 - Gebäude
#' 
## ----message=F,eval=Ex---------------------------------------------------
qmap("England", zoom = 6)

#' 
## ----echo=F--------------------------------------------------------------
# https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf

#' 
#' ![](figure/EnglandMap.PNG)
#' 
#' 
#' ## Hilfe bekommen wir mit dem Fragezeichen
#' 
## ----eval=F--------------------------------------------------------------
## ?qmap

#' 
#' Verschiedene Abschnitte in der Hilfe:
#' 
#' - Description
#' - Usage
#' - Arguments
#' - Value
#' - Author(s)
#' - See Also
#' - Examples
#' 
#' <!--
#' ## Ein anderes *zoom level*
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap("Hamburg", zoom = 12)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## ham_map_z12 <- qmap("Hamburg", zoom = 12)
## save(ham_map_z12,file="../data/ham_map_z12.RData")
## 
## pdf("figure/ham_map_z12.pdf")
## ham_map_z20
## dev.off()
## 
## png("figure/ham_map_z12.png")
## ham_map_z12
## dev.off()
## 

#' 
#' ![](figure/ham_map_z12.pdf)
#' -->
#' 
#' ## Ganz nah dran
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Mannheim', zoom = 20)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## ham_map_z20 <- qmap('Mannheim', zoom = 13)
## save(ham_map_sat,file="../data/ham_map_sat.RData")
## 
## pdf("figure/ham_map_z20.pdf")
## ham_map_z20
## dev.off()
## 
## png("figure/ham_map_z20.png")
## ham_map_z20
## dev.off()

#' 
#' ![](figure/ham_map_z20.pdf)
#' 
#' 
#' ## `ggmap` - maptype satellite
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Hamburg', zoom = 14, maptype="satellite")

#' 
## ----eval=F,echo=F-------------------------------------------------------
## ham_map_sat <- qmap('Hamburg', zoom = 14, maptype="satellite")
## save(ham_map_sat,file="../data/ham_map_sat.RData")
## 
## pdf("figure/ham_map_sat.pdf")
## ham_map_sat
## dev.off()
## 
## png("figure/ham_map_sat.png")
## ham_map_sat
## dev.off()
## 

#' 
#' ![](figure/ham_map_sat.pdf)
#' 
#' 
#' ## `ggmap` - maptype satellite zoom 20
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Hamburg', zoom = 20, maptype="hybrid")

#' 
## ----eval=F,echo=F-------------------------------------------------------
## ham_map <- qmap('Hamburg', zoom = 20, maptype="hybrid")
## save(ham_map,file="../data/ham_map.RData")
## 
## pdf("figure/ham_map.pdf")
## ham_map
## dev.off()
## 
## png("figure/ham_map.png")
## ham_map
## dev.off()
## 

#' 
#' ![](figure/ham_map.pdf)
#' 
#' 
#' ## Terrain/physical maps
#' 
#' - Aus Physischen Karten kann man Informationen über Berge, Flüsse und Seen ablesen. 
#' 
#' - Farben werden oft genutzt um Höhenunterschiede zu visualisieren
#' 
## ----eval=F--------------------------------------------------------------
## qmap('Arequipa', maptype="terrain")

#' 
#' 
#' ## Eine physische Karte von Arequipa
#' 
#' ![](figure/Areqipa.pdf)
#' 
#' <!--
#' ### `ggmap` - terrain map
#' 
## ----message=F,cache=T,eval=F--------------------------------------------
## qmap('Donnersberg', zoom = 14, maptype="terrain")

#' 
## ----echo=F,eval=F-------------------------------------------------------
## btg_map <- qmap('Berchtesgarden', maptype="terrain")

#' -->
#' 
#' 
#' <!--
## ----eval=F,echo=F-------------------------------------------------------
## Schriesheim <- qmap('Schriesheim', zoom = 14,
##  maptype="terrain")
## 
## save(Schriesheim,file="../data/Schriesheim.RData")
## 
## pdf("figure/Schriesheim.pdf")
## Schriesheim
## dev.off()
## 
## png("figure/Schriesheim.png")
## Schriesheim
## dev.off()

#' -->
#' <!--
#' ![](figure/Schriesheim.pdf)
#' -->
#' 
#' ## Abstrahierte Karten ([http://www.designfaves.com](http://www.designfaves.com/2014/03/abstracted-maps-reveal-cities-personalities))
#' 
#' 
#' ![New York](figure/NYabstracted.jpg)
#' 
#' 
#' - Abstraktion wird genutzt um nur die essentiellen Informationen einer Karte zu zeigen. 
#' 
#' - Bsp. U-Bahn Karten - wichtig sind Richtungen und wenig Infos zur Orientierung
#' 
#' - Im folgenden werden Karten vorgestellt, die sich gut als Hintergrundkarten eignen.
#' 
#' ## ggmap - maptype watercolor
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Los Angeles', zoom = 14,
##  maptype="watercolor",source="stamen")

#' 
#' ![](figure/lastamen.png)
#' 
#' <!--
#' ## ggmap - source stamen
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Mannheim', zoom = 14,
##  maptype="toner",source="stamen")

#' 
#' 
#' ## ggmap - maptype toner-lite
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Mannheim', zoom = 14,
##  maptype="toner-lite",source="stamen")

#' 
#' ## ggmap - maptype toner-hybrid
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Mannheim', zoom = 14,
##  maptype="toner-hybrid",source="stamen")

#' 
#' 
#' ## ggmap - maptype terrain-lines
#' 
## ----message=F,eval=F----------------------------------------------------
## qmap('Mannheim', zoom = 14,
##  maptype="terrain-lines",source="stamen")

#' -->
#' 
#' ## Graphiken speichern
#' 
#' ![RstudioExport](figure/RstudioExport.PNG)
#' 
#' 
#' ## ggmap - ein Objekt erzeugen
#' 
#' - `<-` ist der Zuweisungspfeil um ein Objekt zu erzeugen
#' - Dieses Vorgehen macht bspw. Sinn, wenn mehrere Karten nebeneinander gebraucht werden.
#' 
## ----warning=F,message=F,eval=F------------------------------------------
## MA_map <- qmap('Mannheim',
##                zoom = 14,
##                maptype="toner",
##                source="stamen")

#' 
#' 
#' <!--
#' ## 
#' 
## ------------------------------------------------------------------------
library(ggmap)

#' 
## ----eval=F--------------------------------------------------------------
## ?qmap

#' 
## ----triermap,eval=F-----------------------------------------------------
## triermap <- qmap(location = "Trier", zoom = 14,scale=2)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## pdf("figure/triermap.pdf")
## triermap
## dev.off()

#' 
#' -->
#' 
#' ## [Eine Karte für die USA](https://blog.dominodatalab.com/geographic-visualization-with-rs-ggmaps/)
#' 
## ----USAMap,eval=F,echo=F------------------------------------------------
## usa_center = as.numeric(geocode("United States"))
## USAMap = ggmap(get_googlemap(center=usa_center, scale=2,
##                              zoom=4), extent="normal")
## USAMap

#' 
## ----eval=F,echo=F-------------------------------------------------------
## pdf("figure/USAMap.pdf")
## USAMap
## dev.off()

#' 
#' - Mit dem Befehl `OSM_scale_lookup` bekommt man heraus, welchen Wert man für `scale` angeben muss.
#' 
## ----eval=F--------------------------------------------------------------
## OSM_scale_lookup(zoom = 10)
## qmap(location = "Trier", zoom = 10, source = "osm",
##      scale=575000)

#' 
#' 
#' ## Cheatsheet
#' 
#' - Cheatsheet zu [data visualisation](https://www.rstudio.com/wp-content/uploads/2015/04/ggplot2-cheatsheet.pdf)
#' 
#' <https://www.rstudio.com/>
#' 
#' ![Cheatsheet](figure/ggplot2-cheatsheet.png)
#' 
#' 
#' ## Resourcen und Literatur
#' 
#' 
#' - Artikel von [**David Kahle und Hadley Wickham**](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf) zur Nutzung von `ggmap`.
#' 
#' 
#' - [**Schnell eine Karte bekommen** ](http://rpackages.ianhowson.com/cran/ggmap/man/get_map.html)
#' 
#' 
#' - [**Karten machen mit R**](http://www.kevjohnson.org/making-maps-in-r-part-2/)
#' 
#' 
#' 

#' 
## ----child = 'tmap.Rmd'--------------------------------------------------

#' 
## ----setup_tmap, include=FALSE-------------------------------------------
knitr::opts_chunk$set(echo = TRUE,warning=F,cache=T,fig.height=4)

#' 
#' 
## ----echo=F,warning=F,message=F------------------------------------------
library(knitr)
library(DT)
Ex <- T

#' 
#' ## Das Paket [tmap](https://cran.r-project.org/web/packages/tmap/index.html)
#' 
#' 
#' - Mit dem Paket [**tmap**](http://twitter.com/sharon000/status/593028906820599808/photo/1?ref_src=twsrc%5Etfw) kann man thematische Karten erzeugen
#' - Die folgenden Beispiele sind auf der [**Vignette**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-nutshell.html) des Paketes basiert.
#' 
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("tmap")

#' 
#' 
## ----warning=F,message=F-------------------------------------------------
library(tmap)

#' 
#' 
#' 
#' 
#' ## Schnelle thematische Karte
#' 
#' - Mit dem Befehl [**qtm**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-nutshell.html) kann man eine schnelle thematische Karte erzeugen
#' 
#' - Beispiel aus der [**Vignette**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-nutshell.html) zum Paket `tmap`
#' 
## ----cache=T-------------------------------------------------------------
data(Europe)
qtm(Europe)

#' 
#' 
#' ## Der Europa-Datensatz
#' 
## ----echo=F--------------------------------------------------------------
EUR <- Europe@data

#' 
#' 
## ----echo=F,eval=F-------------------------------------------------------
## # http://rstudio.github.io/DT/
## datatable(Europe@data[,1:4], class = 'cell-border stripe',rownames = FALSE,
##           options = list(pageLength = 10, autoWidth = TRUE)
##           )
## # to see the options http://datatables.net/reference/option/

#' 
## ----echo=F--------------------------------------------------------------
kable(Europe@data[1:10,1:4])

#' 
#' ## Um mehr Farbe in die Karte zu bekommen
#' 
#' - Visualisierung von  [**Natural Earth**](http://www.naturalearthdata.com/) Daten
#' 
#' <!--
#' <http://www.naturalearthdata.com/>
#' -->
## ----cache=T,eval=Ex-----------------------------------------------------
qtm(Europe, fill="gdp_cap_est")

#' 
#' 
#' ## Eine Karte mit Text 
#' 
## ----eval=Ex-------------------------------------------------------------
qtm(Europe, fill="gdp_cap_est", text="iso_a3")

#' 
#' ## Dieses Schema passt besser:
#' 
#' ### [**Bevölkerungsdichte**](https://en.wikipedia.org/wiki/Population_density)
#' 
## ----eval=Ex-------------------------------------------------------------
qtm(Europe, fill="gdp_cap_est", text="iso_a3", 
    text.size="AREA", root=5, fill.title="GDP per capita", 
    fill.textNA="Non-European countries", theme="Europe")

#' 
#' <!--
## ----cache=T,eval=Ex-----------------------------------------------------
qtm(Europe, fill="pop_est_dens", 
    fill.title="Population density")

#' -->
#' ## Themen des Europa-Datensatzes
#' 
#' - [**ISO Klassifikation**](http://userpage.chemie.fu-berlin.de/diverse/doc/ISO_3166.html)
#' - Ländername
#' - Ist das Land Teil Europas? 
#' - Fläche, Bevölkerung, Bevölkerungsdichte, 
#' - [**Bruttoinlandsprodukt**](https://en.wikipedia.org/wiki/Gross_domestic_product)
#' - Bruttoinlandsprodukt [**zu Kaufkraftparitäten**](https://en.wikipedia.org/wiki/List_of_countries_by_GDP_%28PPP%29_per_capita)
#' - Ökonomie, Einkommensgruppe
#' 
#' ## Der Europa Datensatz - Variablen und was dahinter steckt
#' 
#' 
## ----echo=F,eval=Ex------------------------------------------------------
library(XML)
info <- colnames(Europe@data)

info_df <- data.frame(Europe@data)
kable(info_df[1:8,1:5])

#' 
#' <!--
#' ## Die ISO Kodierung: 
#' 
#' 
## ----echo=F,cache=T,eval=Ex----------------------------------------------
link <- "http://userpage.chemie.fu-berlin.de/diverse/doc/ISO_3166.html"
Tab <- readHTMLList(link)

Tab <- strsplit(x = Tab[[1]],split = "\n")

Tab3 <- Tab[[3]] 

Tab4 <- Tab3[-c(1:7)]
Tab4

#' -->
#' 
#' ## Die Variable `continent`
#' 
## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="continent")

#' 
#' 
#' ## Die Variable `part`
#' 
## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="part",fill.title="Teil von Europa")

#' 
#' ## Die Variable `area`
#' 
## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="area") # Russia is huge

#' 
#' 
#' ## Bevölkerung
#' 
## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="pop_est",fill.title="Population") 

#' 
#' <!--
#' ## Bevölkerungsdichte
#' 
## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="pop_est_dens",
    fill.title="Population density") 

#' -->
#' 
#' ## Ökonomie
#' 
## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="economy") 

#' 
#' ## Einkommensgruppe
#' 
## ----cache=T-------------------------------------------------------------
qtm(Europe, fill="income_grp",fill.title="Income group") 

#' 
#' 
#' 
#' ## Der Welt-Datensatz im Paket `tmap`
#' 
## ----echo=F,eval=F-------------------------------------------------------
## data(World)
## datatable(World@data)

#' 
## ----echo=F,eval=T-------------------------------------------------------
data(World)
kable(World@data[1:15,])

#' 
#' 
#' ## Welt - Länder nach Einkommensgruppe
#' 
## ----cache=T-------------------------------------------------------------
qtm(World, fill="income_grp",fill.title="Income group") 

#' 
#' ## Ein Datensatz zu den Provinzen in den Niederlanden (R-Paket `tmap`)
#' 
## ----echo=F,eval=F-------------------------------------------------------
## data(NLD_prov)
## NLD_df <- NLD_prov@data
## NLD_df[,6] <- round(NLD_df[,6])
## 
## datatable(NLD_df[,1:6], class = 'cell-border stripe',rownames = FALSE,
##           options = list(pageLength = 10, autoWidth = TRUE)
##           )

#' 
## ----echo=F,eval=T-------------------------------------------------------
data(NLD_prov)
NLD_df <- NLD_prov@data

kable(head(NLD_df))
        

#' 
#' ## Niederlande - Bevölkerung in den Provinzen
#' 
## ----cache=T-------------------------------------------------------------
qtm(NLD_prov, fill="population",fill.title="population") 

#' 
#' ## Anteile berechnen
#' 
## ----cache=T-------------------------------------------------------------
pop <- NLD_prov@data$population
pop

#' 
## ----cache=T-------------------------------------------------------------
popmen <- NLD_prov@data$pop_men
popmen

#' 
#' 
## ----cache=T-------------------------------------------------------------
prop <- popmen/pop
prop

#' 
#' ## Exkurs: Barplot vom Männeranteil
#' 
## ----cache=T,eval=F------------------------------------------------------
## barplot(prop)

#' 
#' ### Barplot mit Farbe
#' 
## ----warnings=F,cache=T--------------------------------------------------
barplot(prop,col="blue")

#' 
#' ## Niederlnade - Anteil Männer
#' 
#' Information in Datensatz einspeisen
#' 
## ----cache=T-------------------------------------------------------------
NLD_prov@data$proportion <- prop

#' 
## ----cache=T-------------------------------------------------------------
qtm(NLD_prov, fill="proportion",fill.title="proportion") 

#' 
#' <!--
#' ## Niederlande - Anteil der Personen 65 plus
#' 
#' (kleiner Trick notwendig - Die Daten hatten sich verändert)
#' 
## ----cache=T-------------------------------------------------------------
ant <- runif(length(NLD_prov),.18,.28)
NLD_prov@data$pop_65plus <- 
  round(NLD_prov@data$population*ant)
pop65plus <- NLD_prov@data$pop_65plus
prop65plus <- pop65plus/pop
NLD_prov@data$proportion65plus <- prop65plus

#' 
#' ## Den Anteil der über 65-jährigen visualisieren
#' 
## ----cache=T-------------------------------------------------------------
qtm(NLD_prov, fill="proportion",fill.title="proportion") 

#' 
#' -->
#' ## Ein Datensatz zu den Gemeinden in den Niederlanden
#' 
## ----cache=T-------------------------------------------------------------
data(NLD_muni)

#' 
#' 
## ----echo=F,eval=F-------------------------------------------------------
## NLD_df <- NLD_muni@data
## NLD_df[,6] <- round(NLD_df[,6])
## 
## datatable(NLD_df[,1:6], class = 'cell-border stripe',rownames = FALSE,
##           options = list(pageLength = 10, autoWidth = TRUE)
##           )

#' 
## ----echo=F,eval=T-------------------------------------------------------
NLD_df <- NLD_muni@data
NLD_df[,6] <- round(NLD_df[,6])

kable(NLD_df[,c("name","province","population")])

#' 
#' ## Bevölkerung der Gemeinden in den Niederlanden
#' 
#' 
## ----cache=T-------------------------------------------------------------
qtm(NLD_muni, fill="population") 

#' 
#' 
#' 
#' ## Zwei Karten
#' 
## ----eval=T--------------------------------------------------------------
tm_shape(Europe) +
    tm_fill(c("pop_est", "economy"), 
        title=c("Population", "Economy"))

#' 
#' 
#' ## Räumliche Daten zur Flächennutzung
#' 
## ----dataland,echo=F,eval=F----------------------------------------------
## data(land)
## info_df <- land@data[1:100,]
## datatable(info_df)

#' 
## ------------------------------------------------------------------------
data(land)
data(World)

#' 
#' 
## ----echo=F,eval=T-------------------------------------------------------
data(land)
info_df <- land@data[sample(1:length(land),10,replace=T),]
kable(info_df[,c(2,3)])

#' 
## ----eval=F,echo=F-------------------------------------------------------
## ?land

#' 
#' 
#' ## Weltweite Flächennutzung
#' 
## ------------------------------------------------------------------------
tm_shape(land,  relative=FALSE) +
    tm_raster("trees", title="Anteil Waldfläche")

#' 
#' 
#' ## Räumliche Daten zu Metropolregionen
#' 
## ------------------------------------------------------------------------
data(metro)

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## info_df <- metro@data[1:100,]
## datatable(info_df)

#' 
## ----eval=T,echo=F-------------------------------------------------------
data(metro)

info_df <- metro@data[1:10,]
kable(info_df)

#' 
#' 
#' ## Nur ein Land visualisieren
#' 
## ------------------------------------------------------------------------
tm_shape(Europe[Europe$name=="Austria", ]) +
    tm_polygons()

#' 
#' 
#' ## Beispieldaten laden
#' 
#' ### Datenquelle Eurostat
#' 
#' - Daten zur Arbeitslosigkeit in Europa 
#' 
## ------------------------------------------------------------------------
url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Unemployment07a13.csv"

Unemp <- read.csv(url) 

#' 
#' ## Überblick über die Daten
#' 
## ----warning=F,echo=F----------------------------------------------------
kable(Unemp[1:10,])

#' 
#' 
#' ## Nutzung des Paketes `tmap` mit eigenen Daten
#' 
## ----warning=F-----------------------------------------------------------
library("tmap")
data(Europe)

#' 
#' ### Die Daten matchen
#' 
## ------------------------------------------------------------------------
iso_a2<- substr(Europe@data$iso_a3,1,2)
ind <- match(iso_a2,Unemp$GEO)
Europe@data$Val2007M12 <- Unemp$Val2007M12[ind]
Europe@data$Val2013M01 <- Unemp$Val2013M01[ind]

#' 
#' ## Eine Karte erzeugen
#' 
## ------------------------------------------------------------------------
qtm(Europe,c("Val2007M12","Val2013M01"))

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## ## Weltweite Flächennutzung
## 
## data(land)
## data(World)
## pal8 <- c("#33A02C", "#B2DF8A", "#FDBF6F", "#1F78B4", "#999999", "#E31A1C", "#E6E6E6", "#A6CEE3")
## tm_shape(land, ylim = c(-88,88), relative=FALSE) +
##     tm_raster("cover_cls", palette = pal8, title="Global Land Cover", legend.hist=TRUE, legend.hist.z=0) +
## tm_shape(World) +
##     tm_borders() +
## tm_layout_World(inner.margins=0,
##     legend.text.size=1,
##     legend.title.size=1.2,
##     legend.position = c("left","bottom"),
##     legend.bg.color = "white", legend.bg.alpha=.2,
##     legend.frame="gray50",
##     legend.width=.2, legend.height=.6,
##     legend.hist.height=.2,
##     legend.hist.bg.color="gray60", legend.hist.bg.alpha=.5)

#' 
#' 
#' 
#' ## Kleine und viele Karten
#' 
## ----cache=T-------------------------------------------------------------
tm_shape(Europe[Europe$continent=="Europe",]) +
    tm_fill("part", thres.poly = 0) +
    tm_facets("name", free.coords=TRUE)

#' 
#' 
#' 
## ----cache=T,eval=F,echo=F-----------------------------------------------
## # ## Die Entwicklungsversion des Paketes `tmap`
## devtools::install_github("mtennekes/tmap/pkg", ref = "45855fa")

#' 
#' 
#' 
## ----cache=T,eval=F,echo=F-----------------------------------------------
## ## Informationen herunterladen
## 
## 
## library(tmap)
## bb_schloss <- bb(q="Mannheim Schloss")
## buildings_schloss <- read_osm(bb_schloss, buildings=osm_poly("building"))
## 
## tm_shape(buildings_schloss$buildings, bbox=bb_schloss) +
##   tm_polygons(col = "darkolivegreen3")

#' 
#' ## tmap zitieren
#' 
## ------------------------------------------------------------------------
citation("tmap")

#' 
#' 
#' 

#' 
## ----child = 'Choroplethen.Rmd'------------------------------------------

#' 
## ----setup_ch, include=FALSE---------------------------------------------
knitr::opts_chunk$set(message=F,warning=F,cache=T,fig.height=4)
library(knitr)
sol <- F

#' 
#' 
#' ## Inhalt dieses Abschnitts
#' 
#' - Der Beispieldatensatz `wrld_simpl` im Paket `maptools` wird vorgestellt.
#' - Es wird gezeigt, wie man Daten aus anderen Quellen mit Kartendaten verbinden kann.
#' - Mit dieser Verbindung ist es dann möglich thematische Karten - so genannte Choroplethen - zu erstellen
#' - Zudem wird das Paket `choroplethr` vorgestellt.
#' 
#' 
#' ## Was ist ein Choropleth
#' 
#' Ein Choropleth ist eine Karte, die
#' 
#' - geografische Grenzen zeigt.
#' - bei denen Bereiche basierend auf Metriken eingefärbt werden.
#' 
#' Choroplethen sind nützlich für die Visualisierung von Daten, wo geografische Grenzen eine natürliche Einheit der Aggregation sind. 
#' 
#' 
#' 
#' ## Das Paket `maptools`
#' 
#' - Datensatz wrld_simpl aus dem Paket `maptools`
#' - Polygone für fast alle Staaten der Erde
#' 
## ----eval=F,echo=F-------------------------------------------------------
## install.packages("acs")
## install.packages("choroplethr")
## install.packages("choroplethrMaps")

#' 
#' 
## ------------------------------------------------------------------------
library(maptools)
data(wrld_simpl)

#' 
## ----echo=F--------------------------------------------------------------
kable(head(wrld_simpl@data[,c("ISO2","NAME","AREA","POP2005")]))

#' 
#' ## Hallo Welt
#' 
## ------------------------------------------------------------------------
plot(wrld_simpl)

#' 
#' 
#' ## [Daten zum Gini Index](https://datahub.io/core/gini-index#data)
#' 
#' - Daten von [**datahub.io**](https://datahub.io/core/gini-index#data)
#' - Statistisches Maß zur Darstellung von [Ungleichverteilungen](https://de.wikipedia.org/wiki/Gini-Koeffizient)
#' 
## ------------------------------------------------------------------------
gini <- read.csv("../data/gini-index_csv.csv")

#' 
## ----echo=F--------------------------------------------------------------
kable(head(gini))

#' 
#' ## Der Gini Index im Jahr 2012
#' 
#' - Für das Jahr 2012 sind am meisten Beobachtungen vorhanden. 
#' 
## ------------------------------------------------------------------------
gini12 <- gini[gini$Year==2012,]
summary(gini12$Value)

#' 
#' ## Exkurs: der Befehl `match`
#' 
## ------------------------------------------------------------------------
vec_a <- c("A",2,6,1,"C")
vec_b <- c(1,"C",2)

match(vec_a,vec_b)

#' 
#' 
#' 
#' ## Die Daten matchen
#' 
#' - WIr matchen die Gini-Daten mit den Kartendaten
#' 
## ------------------------------------------------------------------------
ind <- match(gini12$Country.Code,wrld_simpl$ISO3)

#' 
#' - Wir nehmen die Länder raus, für die keine Daten vorhanden sind:
#' 
## ------------------------------------------------------------------------
ind2 <- ind[!is.na(ind)]

#' 
#' - Eine neue Karte wird erstellt:
#' 
## ------------------------------------------------------------------------
ginimap <- wrld_simpl[ind2,]

#' 
#' - Die Gini-Daten werden in den Datenslot geschrieben
#' 
## ------------------------------------------------------------------------
ginimap@data$gini12 <- gini12$Value[!is.na(ind)]

#' 
#' 
#' 
#' ## Die Daten plotten
#' 
## ------------------------------------------------------------------------
library(sp)
spplot(ginimap,"gini12")

#' 
#' ## Aufgabe A4A - Eine Choroplethenkarte erzeugen
#' 
#' - Lade Datensatz [**Unemployment Datensatz**](https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/data/Unemployment.csv) herunter
#' - Matche die Daten mit einer passenden Karte
#' - Erzeuge mit der (Variable `X2014M10`) folgende Karte:
#' 
#' 
## ----eval=T,echo=sol-----------------------------------------------------
unemp <-read.csv("https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/data/Unemployment.csv")
library(maptools)
data("wrld_simpl")
unemp <- unemp[-c(1:5),]
ind <- match(unemp$geo,wrld_simpl@data$NAME)
mymap <- wrld_simpl[ind,]
mymap$X2014M10 <- unemp$X2014M10
sp::spplot(mymap,"X2014M10")

#' 
#' 
#' 
#' 
#' 
## ----echo=F,warning=F----------------------------------------------------
library(knitr)
library(DT)
internet <- F
Nint <- !internet
par(mai=c(0,0,0,0))

#' 
#' ## Das Paket `choroplethr`
#' 
#' ### Paket von [**Ari Lamstein**](http://www.arilamstein.com/) - [**`choroplethr`**](https://cran.r-project.org/web/packages/choroplethr/index.html) 
#' 
#' - Vereinfachung der Erstellung von Choroplethen in R
#' 
#' - World Development Indicators [**`WDI`**](https://cran.r-project.org/web/packages/WDI/index.html) (World Bank)
#' 
#' - Die folgenden Beispiele basieren auf der [**Vignette**](https://cran.r-project.org/web/packages/choroplethr/index.html) des `choroplethr`-Paketes
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("choroplethr")

#' 
#' 
#' ## Bevölkerungsschätzungen für den US-Staaten
#' 
#' 
## ----warning=F,message=F,echo=F------------------------------------------
# install.packages("choroplethr")
library("choroplethr")
data(df_pop_state)

#' 
#' `df_pop_state` ist ein Datensatz , der in dem Paket `choroplethr` enthalten ist, es enthält Schätzungen zu den US-Staaten für das Jahr 2012.
#' 
## ----echo=F,eval=internet------------------------------------------------
datatable(df_pop_state,options = list(pageLength = 5))

#' 
## ----echo=F--------------------------------------------------------------
kable(head(df_pop_state))

#' 
#' ## `choroplethr` - [Hallo Welt](http://mirrors.softliste.de/cran/web/packages/choroplethr/vignettes/a-introduction.html) 
#' 
#' Die Karte zeigt die US Bevölkerungsschätzung für die US-Staaten und das Jahr 2012:
#' 
#' Wir bekommen eine Choroplethenkarte mit nur einem Argument:
#' 
## ------------------------------------------------------------------------
state_choropleth(df_pop_state)

#' 
#' 
#' Aber wir können auch einen Titel erstellen und die Legende benennen:
#' 
## ---- fig.width=8, fig.height=6------------------------------------------
state_choropleth(df_pop_state, title="2012 US State Population Estimates", legend="Population")

#' 
#' ## [Nur drei Staaten darstellen](http://mirrors.softliste.de/cran/web/packages/choroplethr/vignettes/b-state-choropleth.html)
#' 
## ------------------------------------------------------------------------
state_choropleth(df_pop_state,
                 title= "2012 Population Estimates",
                 legend= "Population", num_colors = 1,
                 zoom=c("california","washington","oregon"))

#' 
#' 
#' ## US County Chroplethen
#' 
#' ### [Choroplethen der US Counties](http://mirrors.softliste.de/cran/web/packages/choroplethr/vignettes/c-county-choropleth.html)
#' 
#' - [**Vignette des Pakets**](http://mirrors.softliste.de/cran/web/packages/choroplethr/vignettes/c-county-choropleth.html)
#' 
## ----eval=F--------------------------------------------------------------
## # A data.frame containing population estimates for US Counties in 2012.
## ?df_pop_county
## 
## # Create a choropleth of US Counties
## ?county_choropleth

#' 
#' ## Eine Karte der US Counties
#' 
## ------------------------------------------------------------------------
data(df_pop_county)
county_choropleth(df_pop_county)

#' 
#' 
#' ## [Choroplethen Länder](http://mirrors.softliste.de/cran/web/packages/choroplethr/vignettes/d-country-choropleth.html)
#' 
## ----eval=F--------------------------------------------------------------
## data(df_pop_country)
## country_choropleth(df_pop_country,
##               title      = "2012 Population Estimates",
##               legend     = "Population",
##               num_colors = 1,
##               zoom       = c("united states of america",
##                              "mexico", "canada"))

#' 
#' ## [Choroplethen Länder](http://mirrors.softliste.de/cran/web/packages/choroplethr/vignettes/d-country-choropleth.html)
#' 
## ----echo=F--------------------------------------------------------------
data(df_pop_country)
country_choropleth(df_pop_country,
              title      = "2012 Population Estimates",
              legend     = "Population",
              num_colors = 1,
              zoom       = c("united states of america",
                             "mexico", "canada"))

#' 
#' 
#' ## Weltbank Daten
#' 
## ----cache=T,warning=F,message=F, fig.height=4---------------------------
library(WDI) 
choroplethr_wdi(code="SP.POP.TOTL", year=2012, 
                title="2012 Population", 
                num_colors=1)

#' 
#' ## [Lebenserwartung](http://mirrors.softliste.de/cran/web/packages/choroplethr/vignettes/f-world-bank-data.html)
#' 
## ----warning=F,message=F, fig.width=4------------------------------------
choroplethr_wdi(code="SP.DYN.LE00.IN", year=2012,
                title="2012 Life Expectancy")

#' 
#' 
#' ## Ein weiterer Datensatz
#' 
#' > A data.frame containing all US presdiential election results from 1789 to 2012
#' 
## ----cache=T-------------------------------------------------------------
data(df_president_ts)

#' 
#' <!--
#' Mit dem Fragezeichen bekommen wir Hilfe
#' 
## ----eval=F--------------------------------------------------------------
## ?df_president_ts

#' 
#' -->
#' 
#' 
#' D = Democratic; R = Republican; PR = Progressive; 
#' 
## ----echo=F--------------------------------------------------------------
kable(df_president_ts[42:48,c(1,32:38)])

#' 
#' <!--
#' R = Republican; 
#' D = Democratic; 
#' DR = Democratic-Republican; 
#' W = Whig;
#' F = Federalist;
#' GW = George Washington;
#' NR = National Republican;
#' SD = Southern Democrat;
#' PR = Progressive; 
#' AI = American Independent;
#' SR = States' Rights; 
#' PO = Populist; 
#' CU = Constitutional Union; 
#' I = Independent; 
#' ND = Northern Democrat; 
#' KN = Know Nothing;
#' AM = Anti-Masonic;
#' N = Nullifier; 
#' SP = Split evenly
#' -->
#' 
## ----eval=F--------------------------------------------------------------
## # install.packages("choroplethrMaps")
## library("choroplethrMaps")

#' 
#' 
#' ## Resourcen
#' 
## ------------------------------------------------------------------------
citation("choroplethr")

#' 
#' ## Resources / Links
#' 
#' - [**Einführung - Was sind Choroplethen**](https://cran.r-project.org/web/packages/choroplethr/vignettes/a-introduction.html)
#' 
#' 
#' - [**Beschreibung**](http://radar.oreilly.com/2014/01/new-choropleth-package-in-r.html) der Nutzung des  `choroplethr` Paketes
#' 
#' - Die [**US Staaten**](https://cran.r-project.org/web/packages/choroplethr/vignettes/b-state-choropleth.html) plotten mit `choroplethr`
#' 
#' - [**Weltbankdaten in Karten darstellen**](https://cran.r-project.org/web/packages/choroplethr/vignettes/f-world-bank-data.html) mit `choroplethr`
#' 
#' 
#' - [**Revolutions-Blog**](http://blog.revolutionanalytics.com/2014/01/easy-data-maps-with-r-the-choroplethr-package-.html) über das `choroplethr` Paket
#' 
#' 
#' - [**trulia**](http://www.trulia.com/tech/2014/01/15/the-choroplethr-package-for-r/)-blog über das `choroplethr` Paket
#' 
#' - [**Präsentation von Ari Lamstein**](http://www.r-bloggers.com/slides-for-my-upcoming-talk-mapping-census-data-in-r/) über das `choroplethr` Paket

#' 
## ----child = 'Shapefiles.Rmd'--------------------------------------------

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

#' 
## ----child = 'spdep.Rmd'-------------------------------------------------

#' 
#' 
## ----setup_spdep, include=FALSE------------------------------------------
knitr::opts_chunk$set(echo = TRUE,cache=T,eval=T,warning=F)

#' 
#' 
#' ## Das erste Gesetz der Geographie (TFLG)
#' 
#' 
#' > "All things are related, but nearby things are more related than distant things"
#' [Tobler, 1970]
#' 
#' 
#' ## Eine Karte von Afrika
#' 
## ----warning=F,message=F-------------------------------------------------
library(maptools)
data(wrld_simpl)
Africa <- wrld_simpl[wrld_simpl@data$REGION==2,]
plot(Africa)

#' 
#' 
#' ## Das Zentrum eines Polygonzuges
#' 
## ----warning=F,message=F-------------------------------------------------
library(sp)
Af <- coordinates(Africa)
plot(Africa)
points(x=Af[1,1],y=Af[1,2],col="red",pch=20)

#' 
#' ## Die nächsten Nachbarn finden
#' 
## ----warning=F,message=F-------------------------------------------------
library(spdep)
Af_nb <- tri2nb(Af)

#' 
#' Die Nachbarn für das erste Land:
#' 
## ----warning=F,message=F-------------------------------------------------
Af_nb[1]

#' 
#' ## Die Nachbarn finden
#' 
## ----warning=F,message=F-------------------------------------------------
plot(Africa)
plot(Africa[1,],col="red",add=T)
plot(Africa[Af_nb[1][[1]],],col="orange",add=T)

#' 
#' ## Die 10 nächsten Nachbarn finden
#' 
## ----warning=F,message=F-------------------------------------------------
IDs <- row.names(as(Africa, "data.frame"))
Af10_nb <- knn2nb(knearneigh(Af, k = 10), row.names = IDs)
plot(Africa)
plot(Africa[1,],col="red",add=T)
plot(Africa[Af10_nb[1][[1]],],col="orange",add=T)

#' 
#' ## Die Distanz berechnen
#' 
## ----warning=F,message=F-------------------------------------------------
Af <- coordinates(Africa) # get centroid
library(raster)
pointDistance(Af[1:4,], lonlat=TRUE) # compute distance

#' 
#' ## Berechnen/zeichnen einer Distanzmatrix
#' 
## ----Africa Distance,warning=F,message=F---------------------------------
Dist_Af <- pointDistance(Af, lonlat=TRUE)
Af_color <- Dist_Af[,1]
Af_color <- Af_color/max(Af_color)
Af_color <- rgb(Af_color,0,0)
plot(Africa,col=Af_color)

#' 
#' 
#' ## Aufgabe
#' 
#' <!--
#' https://github.com/Robinlovelace/Creating-maps-in-R
#' -->
#' 
## ------------------------------------------------------------------------
library(sf)
lnd <- read_sf("../data/london_sport.shp")

#' 
#' 
#' ## Links
#' 
#' - [Raster, CMSAF and solaR](https://procomun.wordpress.com/2011/06/17/raster-cmsaf-and-solar/)
#' 
#' <https://procomun.wordpress.com/2011/06/17/raster-cmsaf-and-solar/>
#' 
#' - [Getting rasters into shape from R](https://johnbaumgartner.wordpress.com/2012/07/26/getting-rasters-into-shape-from-r/)
#' 
#' <https://johnbaumgartner.wordpress.com/2012/07/26/getting-rasters-into-shape-from-r/>

#' 
