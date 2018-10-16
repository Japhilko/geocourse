---
title: "Geodaten downloaden und visualisieren"
author: "Jan-Philipp Kolb"
date: "22 Oktober 2018"
output:
  html_document:
    keep_md: yes
  slidy_presentation:
    keep_md: yes
  beamer_presentation: default
  ioslides_presentation: 
    keep_md: yes
---




Dieser Workshop beschäftigt sich mit der Erfassung und Verarbeitung von räumlichen Informationen (Geodaten) im wissenschaftlichen Kontext.

## Erste Schritte


### __(A1) Einleitung__





- Was ist das Ziel dieses Kurses und welche Datenquellen werden wir verwenden ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/Intro.Rmd) | [pdf](slides/Intro.pdf)) 


- [Regionale Information](http://rpubs.com/Japhilko82/gesis_mannheim) - wo sind wir, wo können wir später Mittag essen gehen?

### __(A2) Das Paket [`ggmap`](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)__ zur Erzeugung verschiedener Kartentypen. 

Das Paket `ggmap` bietet einen guten Einstieg. Es lassen sich relativ leicht Hintergrundkarten erzeugen ([Browser](https://github.com/Japhilko/geocourse/blob/master/slides/ggmap.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/ggmap.pdf) | [rcode](slides/ggmap.R)  )
- Aufgabe: [Nutzung von  `ggmap`](paste0(coursepath,"exercises/Aufgabe_Nutzung_ggmap.Rmd")`)


### __(A3) Thematische Karten mit dem R-Paket `tmap`__

Zur Erzeugung von schnellen thematischen Karten kann man das Paket `tmap` verwenden ( [Browser](https://github.com/Japhilko/geocourse/blob/master/slides/tmap.md) | [pdf](https://github.com/Japhilko/geocourse/blob/master/slides/tmap.pdf) | 
[pdf](https://github.com/Japhilko/geocourse/blob/master/slides/tmap.pdf) | [rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/tmap.R))


### __(A4) Choroplethen erzeugen__

Eine Choroplethenkarte (auch Flächenkartogramm oder Flächenwertstufenkarte) ist eine thematische Karte, bei der die Gebiete im Verhältnis zur Verteilungsdichte des thematischen Objektes eingefärbt ist ([**Wikipedia**](https://de.wikipedia.org/wiki/Choroplethenkarte)). Diese Karten können mit dem Paket `choroplethr` erzeugt werden ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/Choroplethen.md)| 
[pdf](https://github.com/Japhilko/geocourse/blob/master/slides/Choroplethen.pdf) | [rcode](https://github.com/Japhilko/geocourse/blob/master/rcode/Choroplethen.R)


### __(A5) Die Nutzung von Shapefiles__

Viele Daten werden im Shapefile Format von ESRI angeboten. Das Format sowie Möglichkeiten die Daten zu importieren werden hier vorgestellt ([Github](https://github.com/Japhilko/geocourse/blob/master/slides/Shapefiles.md)).

- Aufgabe: [Zensus Ergebnisse und Karte miteinander verbinden und einfärben](https://github.com/Japhilko/GeoData/blob/master/2017/tutorial/Aufgabe_Verbindung.Rmd)

- Aufgabe: [Deutschlands Gemeinden](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)

- Aufgabe: [Darstellung von Eurostat Daten mit `choroplethr`](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_choroplethr.Rmd)

- Aufgabe: [Deutschlands Gemeinden](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)


### __(A6) Das R-Paket `spdep` - Nachbarschaft und Distanz__ 

- [Browser](slides/spdep.md) | [pdf](slides/spdep.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesH1_spdep.R)
- Aufgabe: [Distanzberechnung](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Distanzberechnung.Rmd)

### __(A7) Rasterdaten importieren und verarbeiten__

- [](slides/Rasterdaten.Rmd)

## __(B) Das OpenStreetMap Projekt und komplexere Schritte__


###  __(B1) Openstreetmap__ [Github](slides/OpenStreetMap.md)

- Was ist das Openstreetmap Projekt 

- [Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/OpenStreetMap.md)| [pdf](slides/OpenStreetMap.pdf)

<!--
### __Overpass__ ([Github](slides/Overpass.md))
-->


### __(B2) Geokodierung__ 

- [Github](slides/Geokodierung.md)


### __(B3) Das Arbeiten mit OSM API`s__

- Beispiel [*main OSM API*](slides/osm_mainapi.Rmd)
- Die Nutzung der Overpass API 
- **Beispiel Hostels in Madrid** ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)),
- Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam
- Beispiel: [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)
- **Aufgabe:** [Darstellung von OSM Daten mit tmap](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_osmar.Rmd)



### __(B4) Das `osmdata` Paket__ 

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
