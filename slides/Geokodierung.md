Inhalt dieses Abschnitts
------------------------

-   Das Konzept der Geokoordinaten erklÃ¤ren
-   MÃ¶glichkeiten vorstellen, die Geokodierung mit R durchzufÃ¼hren

Geokodierung
------------

### [Wikipedia - Geocoding](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes)

> Geocoding (…) uses a description of a location, most typically a
> postal address or place name, to find geographic coordinates from
> spatial reference data …

Geokodierung mit dem Paket `ggmap`
----------------------------------

-   Einer der ersten AnsÃ¤tze Geokodierung mit R durchzufÃ¼hren
-   Wenn Geokodierung mit R durchgefÃ¼hrt wird dieses Paket wohl am
    hÃ¤ufigsten verwendet.
-   Das fÃ¼hrt auch dazu, dass im Internet zahlreiche
    Anwendungsbeispiele zu finden sind.

<!-- -->

    library(ggmap)
    geocode("Heidelberg")

    Information from URL : http://maps.googleapis.com/maps/api/geocode/json?address=Heidelberg&sensor=false
           lon      lat
    1 8.672434 49.39875

Latitude und Longitude
----------------------

![](figure/definition-of-latitude-longitude.jpg)

[http://modernsurvivalblog.com](http://modernsurvivalblog.com/survival-skills/basic-map-reading-latitude-longitude/)

Die Distanz zwischen zwei Punkten
---------------------------------

    mapdist("Q1, 4 Mannheim","B2, 1 Mannheim")

    mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="walking")

### Eine andere Distanz bekommen

    mapdist("Q1, 4 Mannheim","B2, 1 Mannheim",mode="bicycling")

Geokodierung mit dem Paket `tmaptools`
--------------------------------------

-   Beim Paket `tmaptools` wird die Nominatim API zur Geokodierung
    verwendet.
-   Diese Funktion hat den Vorteil, dass eine Projektion ausgewÃ¤hlt
    werden kann, in der die Geokodierungen zurÃ¼ck gegeben werden.

<!-- -->

    library("tmaptools")

Koordinaten verschiedener Orte in Deutschland
---------------------------------------------

    cities <- c("Hamburg","Koeln","Dresden","Muenchen")

    lat <- vector()
    lon <- vector()
    for (i in 1:length(cities)){
      gc <- geocode_OSM(cities[i])
      lat[i] <- gc$coords[1]
      lon[i] <- gc$coords[2]
    }

Welche Koordinaten hat der Norden
---------------------------------

    Dat <- data.frame(cities,lon,lat)
    kable(Dat)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">cities</th>
<th style="text-align: right;">lon</th>
<th style="text-align: right;">lat</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Hamburg</td>
<td style="text-align: right;">53.55034</td>
<td style="text-align: right;">10.000654</td>
</tr>
<tr class="even">
<td style="text-align: left;">Koeln</td>
<td style="text-align: right;">50.93836</td>
<td style="text-align: right;">6.959974</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Dresden</td>
<td style="text-align: right;">51.04933</td>
<td style="text-align: right;">13.738144</td>
</tr>
<tr class="even">
<td style="text-align: left;">Muenchen</td>
<td style="text-align: right;">48.13711</td>
<td style="text-align: right;">11.575382</td>
</tr>
</tbody>
</table>

Geokodierung - verschiedene Punkte von Interesse
------------------------------------------------

Punkte in der Karte
-------------------

    MA_map <- qmap("Mannheim")

    MA_map +
    geom_point(aes(x = x, y = y),
    data = ListPOI)

Punkte in der Karte
-------------------

    MA_map +
    geom_point(aes(x = x, y = y),col="red",
    data = ListPOI)

Reverse Geokodierung
--------------------

> Reverse geocoding is the process of back (reverse) coding of a point
> location (latitude, longitude) to a readable address or place name.
> This permits the identification of nearby street addresses, places,
> and/or areal subdivisions such as neighbourhoods, county, state, or
> country.

Quelle: [Wikipedia](https://en.wikipedia.org/wiki/Reverse_geocoding)

    revgeocode(c(48,8))

Daten einlesen
--------------

-   Hier wird ein Beispieldatensatz eingelesen, den ich Ã¼ber rÃ¤umliche
    Stichproben und reverse geocoding erzeugt habe.

<!-- -->

    load("../data/addr_list_t_68239.RData")
    head(addr_list_t)

    ## [1] "Lilienstraße 32A, 68535 Edingen-Neckarhausen, Germany"
    ## [2] "Waldspitze 6, 68239 Mannheim, Germany"                
    ## [3] "Holzweg 51, 68239 Mannheim, Germany"                  
    ## [4] "Kloppenheimer Str. 247, 68239 Mannheim, Germany"      
    ## [5] "Mallaustraße 121, 68219 Mannheim, Germany"            
    ## [6] "Holzweg 33A, 68239 Mannheim, Germany"

Die erste Adressen geokodieren
------------------------------

    geocode_OSM(addr_list_t[1])

    ## $query
    ## [1] "Lilienstraße 32A, 68535 Edingen-Neckarhausen, Germany"
    ## 
    ## $coords
    ##         x         y 
    ##  8.584601 49.445360 
    ## 
    ## $bbox
    ##         min       max
    ## x  8.584494  8.584708
    ## y 49.445276 49.445443

Alle Adressen geokodieren
-------------------------

    gc_list <- list()

    for (i in 1:length(addr_list_t)){
      gc_list[[i]] <- geocode_OSM(addr_list_t[i])
    }

Geokodierung mit dem R-Paket `opencage`
---------------------------------------

-   Um dieses Paket zu nutzen muss man sich vorher bei der API
    registrieren

<!-- -->

    library(opencage)

    gc_info<-opencage_forward(placename = 
                                  "Amsterdam, Van Woustraat")

-   Hinweise, wie das Paket genutzt erden kann sind im [**opencage
    Tutorial**](https://ropensci.org/tutorials/opencage_tutorial/) zu
    finden.

Das Paket [`geonames`](https://github.com/ropensci/geonames)
------------------------------------------------------------

<!--
https://cran.r-project.org/web/packages/geonames/README.html
-->
    install.packages("geonames")

-   Ein Account ist notwendig um die meisten Funktionen des Paketes
    `geonames`zu nutzen.

<!-- -->

    library(geonames)

    options(geonamesUsername="myusername")

    MAwiki<-GNfindNearbyWikipedia(postalcode=68239,country="DE",
                                  radius=10)

WikipediaeintrÃ¤ge in der NÃ¤he
-------------------------------

<table>
<thead>
<tr class="header">
<th style="text-align: left;">elevation</th>
<th style="text-align: left;">feature</th>
<th style="text-align: left;">lng</th>
<th style="text-align: left;">distance</th>
<th style="text-align: left;">countryCode</th>
<th style="text-align: left;">rank</th>
<th style="text-align: left;">lang</th>
<th style="text-align: left;">title</th>
<th style="text-align: left;">lat</th>
<th style="text-align: left;">wikipediaUrl</th>
<th style="text-align: left;">summary</th>
<th style="text-align: left;">thumbnailImg</th>
<th style="text-align: left;">geoNameId</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">102</td>
<td style="text-align: left;">city</td>
<td style="text-align: left;">8.46711</td>
<td style="text-align: left;">0.1738</td>
<td style="text-align: left;">DE</td>
<td style="text-align: left;">98</td>
<td style="text-align: left;">en</td>
<td style="text-align: left;">Quadratestadt</td>
<td style="text-align: left;">49.48848</td>
<td style="text-align: left;">en.wikipedia.org/wiki/Quadratestadt</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">103</td>
<td style="text-align: left;">landmark</td>
<td style="text-align: left;">8.46212</td>
<td style="text-align: left;">0.1986</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">90</td>
<td style="text-align: left;">en</td>
<td style="text-align: left;">Reiss Engelhorn Museum</td>
<td style="text-align: left;">49.48888</td>
<td style="text-align: left;">en.wikipedia.org/wiki/Reiss_Engelhorn_Museum</td>
<td style="text-align: left;">The Reiss Engelhorn Museum, or (rem for short), is a museum in Mannheim, Germany. They have an exhibition area of , and house around 1.2 million objects. They are one of the largest publicly-owned museums in southern Germany (…)</td>
<td style="text-align: left;"><a href="http://www.geonames.org/img/wikipedia/29000/thumb-28652-100.jpg" class="uri">http://www.geonames.org/img/wikipedia/29000/thumb-28652-100.jpg</a></td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">103</td>
<td style="text-align: left;">landmark</td>
<td style="text-align: left;">8.4616</td>
<td style="text-align: left;">0.2423</td>
<td style="text-align: left;">DE</td>
<td style="text-align: left;">13</td>
<td style="text-align: left;">en</td>
<td style="text-align: left;">Klapsmühl’ am Rathaus</td>
<td style="text-align: left;">49.4891</td>
<td style="text-align: left;">en.wikipedia.org/wiki/Klapsm%C3%BChl%E2%80%99_am_Rathaus</td>
<td style="text-align: left;">Klapsmühl’ am Rathaus is a theatre in Baden-Württemberg, Germany.</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">104</td>
<td style="text-align: left;">landmark</td>
<td style="text-align: left;">8.46294</td>
<td style="text-align: left;">0.3178</td>
<td style="text-align: left;">DE</td>
<td style="text-align: left;">84</td>
<td style="text-align: left;">en</td>
<td style="text-align: left;">GESIS – Leibniz Institute for the Social Sciences</td>
<td style="text-align: left;">49.485686</td>
<td style="text-align: left;">en.wikipedia.org/wiki/GESIS_%E2%80%93_Leibniz_Institute_for_the_Social_Sciences</td>
<td style="text-align: left;">The GESIS – Leibniz-Institute for the Social Sciences headquartered in Mannheim with locations in Cologne and Berlin is the largest German infrastructure institute for the Social Sciences. With basic research-based services and consulting covering all levels of the scientific process GESIS supports (…)</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">102</td>
<td style="text-align: left;">city</td>
<td style="text-align: left;">8.4691</td>
<td style="text-align: left;">0.3258</td>
<td style="text-align: left;">DE</td>
<td style="text-align: left;">100</td>
<td style="text-align: left;">en</td>
<td style="text-align: left;">Mannheim</td>
<td style="text-align: left;">49.489</td>
<td style="text-align: left;">en.wikipedia.org/wiki/Mannheim</td>
<td style="text-align: left;">Mannheim (listen, Palatine German: Monnem or Mannem) is a city in the southwestern part of Germany, the third-largest in the German state of Baden-Württemberg after Stuttgart and Karlsruhe. Mannheim is among the twenty largest cities in Germany, with a 2012 population of approximately 295,000 (…)</td>
<td style="text-align: left;">NA</td>
<td style="text-align: left;">2873891</td>
</tr>
</tbody>
</table>

-   [Login fÃ¼r Geonames](http://www.geonames.org/login)

-   [Link um mit den Geodaten zu
    arbeiten](http://www.geonames.org/enablefreewebservice)

-   [Informationen Ã¼ber den
    Download](http://www.geonames.org/export/ws-overview.html)

<!-- -->

    library(osmdata)
    bbox <- getbb("Mannheim")

<!--
x -lon - ost-West Richtung
-->
    erg <- geonames::GNcities(49.649591,8.627236,
                              49.329591,8.307236)

<!--
https://cengel.github.io/rspatial/5_Geocoding.nb.html
http://www.datasciencetoolkit.org/

https://github.com/cengel/ArcGIS_geocoding
-->
Das Paket `googleway`
---------------------

> Accesses Google Maps APIs to Retrieve Data and Plot Maps

    library(googleway)

-   Ein API SchlÃ¼ssel ist notwendig um die meisten Funktionen des
    Paketes zu nutzen.

<!--
Abschnitt zu Geocoding in diesem Task View:

https://cran.r-project.org/web/views/WebTechnologies.html
-->
Das Paket `bbox`
----------------

-   Das Paket `bbox` ist auf github zu finden.

-   Beispieldatensatz laden:

<!-- -->

    load("../data/ddat.RData")

-   Rahmen fÃ¼r das rÃ¤umliche Objekt bestimmen:

<!-- -->

    library(bbox)
    b_box(ddat)

    ## [1]  5.866286 47.273602 15.048632 55.058262

    citation("bbox")

<!--
https://github.com/ropensci/bbox
-->
Links
-----

-   Ãœberblick von Jesse Sadler zur [**Geokodierung mit
    R**](https://www.jessesadler.com/post/geocoding-with-r/)
-   Ein Schummelzettel fÃ¼r
    [**`ggmap`**](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf)
-   Die Vignette zum Paket `tmap` - [**tmap: get
    started**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-getstarted.html)

-   [**latlong.net**](https://www.latlong.net/place/hamburg-germany-8766.html) -
    eine Homepage um Koordinaaten zu bestimmen.
