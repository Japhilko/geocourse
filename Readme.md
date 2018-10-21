---
title: "Geodaten downloaden und visualisieren"
author: "Jan-Philipp Kolb"
date: "22 Oktober 2018"
output:
  html_document: 
    keep_md: yes
  pdf_document: default
  ioslides_presentation:
    keep_md: yes
  beamer_presentation: default
  slidy_presentation:
    keep_md: yes
---




Dieser Workshop beschäftigt sich mit der Erfassung und Verarbeitung von räumlichen Informationen (Geodaten) im wissenschaftlichen Kontext.

## Erste Schritte


### __(A1) Einleitung__





Im ersten Abschnitt geht es um ein paar Vorbereitungen, die Ziele des Kurses werden vorgestellt. Datenquellen werden vorgestellt ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/A1_Intro.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A1_Intro.pdf) 


- [Regionale Information](http://rpubs.com/Japhilko82/gesis_mannheim) - wo sind wir, wo können wir später Mittag essen gehen?

### __(A2) Das Paket [`ggmap`](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)__ zur Erzeugung verschiedener Kartentypen. 

Das Paket `ggmap` bietet einen guten Einstieg. Es lassen sich relativ leicht Hintergrundkarten erzeugen ([Browser](https://github.com/Japhilko/geocourse/blob/master/slides/A2_ggmap.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/ggmap.pdf | [rcode](https://github.com/Japhilko/geocourse/blob/master/slides/A2_ggmap.R)

### __(A3) Der Download von (sozial-)wissenschaftlichen Daten__

Zur georgraphischen Visualisierung sind neben Karten auch inhaltliche Daten notwendig ( [Browser](https://github.com/Japhilko/geocourse/blob/master/slides/A4_tmap.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A3_DataPUF.md) | 
[pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A3_DataPUF.pdf) | [rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/A3_DataPUF.R)).


### __(A4) Thematische Karten mit dem R-Paket `tmap`__

Zur Erzeugung von schnellen thematischen Karten kann man das Paket `tmap` verwenden ( [Browser](https://github.com/Japhilko/geocourse/blob/master/slides/A4_tmap.md) | 
[pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A4_tmap.pdf) | [rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/A4_tmap.R))


### __(A5) Choroplethen erzeugen__

Eine Choroplethenkarte (auch Flächenkartogramm oder Flächenwertstufenkarte) ist eine thematische Karte, bei der die Gebiete im Verhältnis zur Verteilungsdichte des thematischen Objektes eingefärbt ist ([**Wikipedia**](https://de.wikipedia.org/wiki/Choroplethenkarte)). Diese Karten können mit dem Paket `choroplethr` erzeugt werden ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/A5_Choroplethen.md)| 
[pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A5_Choroplethen.pdf) | [rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/A5_Choroplethen.R)


### __(A6) Die Nutzung von Shapefiles__

Viele Daten werden im Shapefile Format von ESRI angeboten. Das Format sowie Möglichkeiten die Daten zu importieren werden hier vorgestellt ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/A6_Shapefiles.md)| 
[pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A6_Shapefiles.pdf) | [rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/A6_Shapefiles.R).

<!--
- Aufgabe: [Zensus bnisse und Karte miteinander verbinden und einfärben](https://github.com/Japhilko/GeoData/blob/master/2017/tutorial/Aufgabe_Verbindung.Rmd)

- Aufgabe: [Deutschlands Gemeinden](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)
-->

### __(A7) Das R-Paket `spdep` - Nachbarschaft und Distanz__ 

In diesem Abschnitt geht es darum Nachbarn zu finden ([Browser](https://github.com/Japhilko/geocourse/blob/master/slides/A7_spdep.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A7_spdep.pdf) |
[rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/A7_spdep.R))

### __(A8) Rasterdaten importieren und verarbeiten__

In diesem Abschnitt wird vorgestellt, wie man Rasterdaten importieren, bearbeiten und visualisieren kann ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/A8_Rasterdaten.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/A8_Rasterdaten.pdf) |
[rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/A8_Rasterdaten.R))

## __(B) Das OpenStreetMap Projekt und komplexere Schritte__


###  __(B1) Openstreetmap__ 

Was ist das Openstreetmap Projekt? In diesem Abschnitt wird das Openstreetmap Projekt und der Download der Daten gezeigt ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/B1_OpenStreetMap.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/B1_OpenStreetMap.pdf) |
[rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/B1_OpenStreetMap.R)).

### __(B2) Geokodierung__ 

Wie werden Adressen geokodiert? Was ist reverse Geokodierung? - ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/B2_Geokodierung.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/B2_Geokodierung.pdf) |
[rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/B2_Geokodierung.R))


### __(B3) Das Arbeiten mit OSM API`s__

Das Beispiel der [*main OSM API*](https://github.com/Japhilko/geocourse/blob/master/slides/B3_osm_mainapi.md) - ([pdf](https://github.com/Japhilko/geocourse/blob/master/slides/B3_osm_mainapi.pdf))


### __(B4) Die Nutzung der Overpass API__



- **Beispiel Hostels in Madrid** ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)),
- Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam
- Beispiel: [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)
- **Aufgabe:** [Darstellung von OSM Daten mit tmap](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_osmar.Rmd)



### __(B5) Das `osmdata` Paket__ 

- ([Github](slides/osmdata.md))

### __(B4) Interaktive Karten mit Javascript Bibliotheken__ 

- [Github](slides/using_javascript.md) | [pdf](slides/using_javascript.pdf)
| [rcode](rcode/using_javascript.R)
- Beispiel - [Campingplätze](http://rpubs.com/Japhilko82/Campsites)

<!--
## Räumliche Analysen/Statistik
-->

### __(B4) Simple Features__ 

- [Github](slides/simplefeatures.md) | [pdf](slides/simplefeatures.pdf)
| [rcode](rcode/simplefeatures.R)


<!--
https://training.gesis.org/?site=pDetails&pID=0x2BD6733444514AEDAA955BC3754CA39C
-->
