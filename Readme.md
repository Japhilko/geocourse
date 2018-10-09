---
title: "Geodaten downloaden und visualisieren"
author: "Jan-Philipp Kolb"
date: "22 Oktober 2018"
output: 
  html_document: 
    keep_md: yes
---





Dieser Workshop beschäftigt sich mit der Erfassung und Verarbeitung von räumlichen Informationen (Geodaten) im wissenschaftlichen Kontext.

## Erste Schritte


### __(A1) Einleitung__ ([Github](slides/Intro.md) | [pdf](slides/Intro.pdf)) - [Regional information](http://rpubs.com/Japhilko82/mapFirenze)

### __(A2) Das Paket [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)__ zur Erzeugung verschiedener Kartentypen. ([Browser](slides/ggmap.md) | [pdf](slides/ggmap.pdf) | [rcode](slides/ggmap.R) )

Aufgabe: [Nutzung von  `ggmap`](exercises/Aufgabe_Nutzung_ggmap.Rmd)


### __(A3) Thematische Karten mit dem R-Paket `tmap`__ ([Browser](slides/tmap.md) | [pdf](slides/tmap.pdf) | 
[pdf](slides/tmap.pdf) | [rcode](rcode/tmap.R))


### __(A4) Choroplethen erzeugen__ ([Github](slides/Choroplethen.md))


### __(A5) Die Nutzung von Shapefiles__ ([Github](slides/Shapefiles.md))

Aufgabe: [Zensus Ergebnisse und Karte miteinander verbinden und einfärben](https://github.com/Japhilko/GeoData/blob/master/2017/tutorial/Aufgabe_Verbindung.Rmd)

Aufgabe: [Deutschlands Gemeinden](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)


Aufgabe: [Darstellung von Eurostat Daten mit `choroplethr`](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_choroplethr.Rmd)

### __(A6) Geokodierung__ ([Github](slides/Geokodierung.md))

## OpenStreetMap 

### __Openstreetmap__ [Github](slides/OpenStreetMap.md)

<!--
### __Overpass__ ([Github](slides/Overpass.md))
-->

### __(B2) Die Overpass API und das Arbeiten mit XML-Dateien__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/OpenStreetMap.md)| [pdf](slides/OpenStreetMap.pdf))
  

### __Das `osmdata` Paket__ ([Github](slides/osmdata.md))

Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam

**Beispiel Hostels in Madrid** ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)), [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)

**Aufgabe:** [Darstellung von OSM Daten mit tmap](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_osmar.Rmd)

## Interaktive Karten

### __(C1) Interaktive Karten mit Javascript Bibliotheken__ ([Github](slides/using_javascript.md) | [pdf](slides/using_javascript.pdf)
| [rcode](rcode/using_javascript.R))
Beispiel - [Campingplätze](http://rpubs.com/Japhilko82/Campsites)

## Räumliche Analysen/Statistik

### __(D1) Das R-Paket `spdep` - Nachbarschaft und Distanz__ ([Browser](slides/spdep.md) | [pdf](slides/spdep.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesH1_spdep.R))

Aufgabe: [Distanzberechnung](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Distanzberechnung.Rmd)

### __Simple Features__ ([Github](slides/simple_features.md) | [pdf](slides/simple_features.pdf)
| [rcode](rcode/simple_features.R))
