---
title: "Geodaten bekommen und visualisieren"
author: "Jan-Philipp Kolb"
date: "22 Februar 2018"
output: 
  html_document: 
    keep_md: yes
---





Dieser Workshop beschäftigt sich mit der Erfassung und Verarbeitung von räumlichen Informationen (Geodaten) im wissenschaftlichen Kontext.

## Erste Schritte


### __(A1) Einleitung__ ([Github](slides/Intro.md)) - [Regional information](http://rpubs.com/Japhilko82/mapFirenze)

- __(A2) Use of R package [ggmap](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)__ zur Erzeugung verschiedener Kartentypen. ([Browser](slides/ggmap.md) | [pdf](slides/ggmap.pdf) | [rcode](slides/ggmap.R) )

- Beispiel: *Points of interest* ([poi](https://rpossib.wordpress.com/2015/09/15/points-of-interest-for-backpackers/)) für Backpacker in Amsterdam

Aufgabe: [Nutzung von  `ggmap`](https://github.com/Japhilko/GeoData/blob/master/2017/tutorial/Aufgabe_Nutzung_ggmap.Rmd)

Datenquellen
---------------------

- __(B1) Politische und thematische Karten mit dem R-Paket [maps](https://cran.r-project.org/web/packages/maps/index.html)__ ([Browser ](slides/maps.md) |  [pdf](https://github.com/Japhilko/GeoData/blob/master/2017/slides/maps.pdf) | [blog](https://rpossib.wordpress.com/2015/09/18/political-maps-with-r/) | [rcode](sildes/maps.R) )

- __(B2) Choroplethen mit dem R-Paket maptools__ ([Browser](slides/maptools.md) | [pdf](slides/maptools.pdf)
| [rcode](slides/maptools.R))

- __(B3) Internetquellen für Geodaten__ ([Browser](slides/polygonSources.md)| [pdf](https://github.com/Japhilko/GeoData/blob/master/2017/slides/polygonSources.pdf)|
[rcode](slides/polygonSources.R))

- __(B4) OpenStreetMap als Datenquelle__ ([Browser](slides/osm_data.md) |
[pdf](https://github.com/Japhilko/GeoData/blob/master/2017/slides/osm_data.pdf) | [rcode](slides/OpenStreetMap.R))

- __(B5) Öffentliche Daten zur freien Verfügung__  ([Browser](slides/DataPUF.md) | 
[pdf](https://github.com/Japhilko/GeoData/blob/master/2017/slides/DataPUF.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesD2_DataPUF.R)
)

Aufgabe: [Deutschlands Gemeinden](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Zensus_Ergebnisse.md)


Verbindung, Editierung und Einfärbung
---------------------

- __(C1) Verbindung von Daten__ ([Browser](slides/Matching.md) | [pdf](slides/Matching.pdf) |
[rcode](slides/Matching.R))
of data sources

- __(C2) Das R-Paket `spplot` und Farbkodierung__  ([Browser](slides/spplot.md)|  [pdf](slides/spplot.pdf) | 
[rcode](slides/spplot.R))

- __(C3) Shapefiles zusammenfassen__ ([Browser](slides/BeispielONB.md) |  [pdf](slides/BeispielONB.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesE3_CombineShapefiles.R)
)


Aufgabe: [Zensus Ergebnisse und Karte miteinander verbinden und einfärben](https://github.com/Japhilko/GeoData/blob/master/2017/tutorial/Aufgabe_Verbindung.Rmd)

- __(C4) Thematische Karten mit dem R-Paket `tmap`__ 
([Browser](slides/tmap.md) | [pdf](slides/tmap.pdf) | 
[pdf](https://github.com/Japhilko/GeoData/blob/master/2017/slides/tmap.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesF1_tmap.R))

- __(C5) Das R-Paket `choroplethr`__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/Choroplethr.md) | 
[pdf](https://github.com/Japhilko/GeoData/blob/master/2017/slides/Choroplethr.pdf) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesF2_choroplethr.R))


Aufgabe: [Darstellung von Eurostat Daten mit `choroplethr`](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_choroplethr.Rmd)


OpenStreetMap und räumliche Statistik
---------------------

- __(D1) Das Arbeiten mit XML-Dateien__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/OpenStreetMap.md)| [pdf](slides/OpenStreetMap.pdf))

- __(D2) Die Nutzung von Programmierschnittstellen__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/UsageAPI.md)| [pdf](slides/UsageAPI.pdf) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesG1_UsageAPI.R))

- __(D3) Das R-Paket `osmar`__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/osmar.md) | [pdf](slides/osmar.pdf) | 
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesG3_osmar.R))

- Beispiel Hostels in Madrid ([Browser](https://github.com/Japhilko/GeoData/blob/master/2016/slides/Madrid_hostels.Rmd)), [Energieerzeugung](https://rpossib.wordpress.com/2015/11/20/use-openstreetmap-date/)

Aufgabe: [Darstellung von OSM Daten mit tmap](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_osmar.Rmd)

- __(D4) Das R-Paket `spdep` - Nachbarschaft und Distanz__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/spdep.md) | [pdf](slides/spdep.pdf) |
[rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesH1_spdep.R))


- __(D5) Interaktive Karten und Präsentation__ ([Browser](https://github.com/Japhilko/GeoData/blob/master/2017/slides/InteractiveMaps.md) | [pdf](slides/InteractiveMaps.pdf)
| [rcode](https://raw.githubusercontent.com/Japhilko/GeoData/master/2016/rcode/slidesH2_Interaktiv.R))
Beispiel - [Campingplätze](http://rpubs.com/Japhilko82/Campsites)

Aufgabe: [Distanzberechnung](https://github.com/Japhilko/GeoData/blob/master/2016/tutorial/Aufgabe_Distanzberechnung.Rmd)
