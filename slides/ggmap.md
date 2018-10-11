Inhalt dieses Abschnitts
------------------------

Arten von rÃ¤umlichen Daten:

-   [**StraÃŸenkarten**](https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/ggmap/ggmapCheatsheet.pdf)
-   [**Satelliten Bilder**](http://www.mostlymuppet.com/tag/maps/)
-   [**Physische Daten und
    Karten**](http://gis.stackexchange.com/questions/3083/what-makes-a-map-beautiful/45518#45518)
-   [**Abstrakte
    Karten**](http://www.designfaves.com/2014/03/abstracted-maps-reveal-cities-personalities)
-   …

Das R-paket
[**`ggmap`**](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)
wird im folgenden genutzt um verschiedene Kartentypen darzustellen.

Mit [**`qmap`**](http://www.inside-r.org/packages/cran/ggmap/docs/qmap)
kann man eine schnelle Karte erzeugen.

Installieren des Paketes
------------------------

-   Zur Erstellung der Karten brauchen wir das Paket `ggmap`:

<!-- -->

    devtools::install_github("dkahle/ggmap")
    devtools::install_github("hadley/ggplot2")
    install.packages("ggmap")

Paket ggmap - Hallo Welt
------------------------

-   Um das Paket zu laden verwenden wir den Befehl `library`

<!-- -->

    library(ggmap)

Und schon kann die erste Karte erstellt werden:

    qmap("Mannheim")

![](figure/Mannheim_ggmap.pdf)

Karte fÃ¼r eine SehenswÃ¼rdigkeit
---------------------------------

    qmap("Berlin Brandenburger Tor")

![](figure/BBT_ggmap.pdf)

Karte fÃ¼r einen ganzen Staat
-----------------------------

    qmap("Germany")

-   Wir brauchen ein anderes *zoom level*

![](figure/germany.pdf)

Ein anderes *zoom level*
------------------------

-   level 3 - Kontinent / level 10 - Stadt / level 21 - GebÃ¤ude

<!-- -->

    qmap("England", zoom = 6)

![](figure/EnglandMap.PNG)

Hilfe bekommen wir mit dem Fragezeichen
---------------------------------------

    ?qmap

Verschiedene Abschnitte in der Hilfe:

-   Description
-   Usage
-   Arguments
-   Value
-   Author(s)
-   See Also
-   Examples

<!--
## Ein anderes *zoom level*


```r
qmap("Hamburg", zoom = 12)
```



![](figure/ham_map_z12.pdf)
-->
Ganz nah dran
-------------

    qmap('Mannheim', zoom = 20)

![](figure/ham_map_z20.pdf)

`ggmap` - maptype satellite
---------------------------

    qmap('Hamburg', zoom = 14, maptype="satellite")

![](figure/ham_map_sat.pdf)

`ggmap` - maptype satellite zoom 20
-----------------------------------

    qmap('Hamburg', zoom = 20, maptype="hybrid")

![](figure/ham_map.pdf)

Terrain/physical maps
---------------------

-   Aus Physischen Karten kann man Informationen Ã¼ber Berge, FlÃ¼sse
    und Seen ablesen.

-   Farben werden oft genutzt um HÃ¶henunterschiede zu visualisieren

<!-- -->

    qmap('Arequipa', maptype="terrain")

Eine physische Karte von Arequipa
---------------------------------

![](figure/Areqipa.pdf)

<!--
### `ggmap` - terrain map


```r
qmap('Donnersberg', zoom = 14, maptype="terrain")
```


-->
<!--

-->
<!--
![](figure/Schriesheim.pdf)
-->
Abstrahierte Karten ([http://www.designfaves.com](http://www.designfaves.com/2014/03/abstracted-maps-reveal-cities-personalities))
----------------------------------------------------------------------------------------------------------------------------------

![New York](figure/NYabstracted.jpg)

-   Abstraktion wird genutzt um nur die essentiellen Informationen einer
    Karte zu zeigen.

-   Bsp. U-Bahn Karten - wichtig sind Richtungen und wenig Infos zur
    Orientierung

-   Im folgenden werden Karten vorgestellt, die sich gut als
    Hintergrundkarten eignen.

ggmap - maptype watercolor
--------------------------

    qmap('Los Angeles', zoom = 14,
     maptype="watercolor",source="stamen")

![](figure/lastamen.png)

<!--
## ggmap - source stamen


```r
qmap('Mannheim', zoom = 14,
 maptype="toner",source="stamen")
```


## ggmap - maptype toner-lite


```r
qmap('Mannheim', zoom = 14,
 maptype="toner-lite",source="stamen")
```

## ggmap - maptype toner-hybrid


```r
qmap('Mannheim', zoom = 14,
 maptype="toner-hybrid",source="stamen")
```


## ggmap - maptype terrain-lines


```r
qmap('Mannheim', zoom = 14,
 maptype="terrain-lines",source="stamen")
```
-->
Graphiken speichern
-------------------

![RstudioExport](figure/RstudioExport.PNG)

ggmap - ein Objekt erzeugen
---------------------------

-   `<-` ist der Zuweisungspfeil um ein Objekt zu erzeugen
-   Dieses Vorgehen macht bspw. Sinn, wenn mehrere Karten nebeneinander
    gebraucht werden.

<!-- -->

    MA_map <- qmap('Mannheim', 
                   zoom = 14,
                   maptype="toner",
                   source="stamen")

<!--
## 


```r
library(ggmap)
```


```r
?qmap
```


```r
triermap <- qmap(location = "Trier", zoom = 14,scale=2)
```



-->
[Eine Karte fÃ¼r die USA](https://blog.dominodatalab.com/geographic-visualization-with-rs-ggmaps/)
--------------------------------------------------------------------------------------------------

-   Mit dem Befehl `OSM_scale_lookup` bekommt man heraus, welchen Wert
    man fÃ¼r `scale` angeben muss.

<!-- -->

    OSM_scale_lookup(zoom = 10)
    qmap(location = "Trier", zoom = 10, source = "osm",
         scale=575000)

Cheatsheet
----------

-   Cheatsheet zu [data
    visualisation](https://www.rstudio.com/wp-content/uploads/2015/04/ggplot2-cheatsheet.pdf)

<https://www.rstudio.com/>

![Cheatsheet](figure/ggplot2-cheatsheet.png)

Resourcen und Literatur
-----------------------

-   Artikel von [**David Kahle und Hadley
    Wickham**](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)
    zur Nutzung von `ggmap`.

-   [**Schnell eine Karte
    bekommen**](http://rpackages.ianhowson.com/cran/ggmap/man/get_map.html)

-   [**Karten machen mit
    R**](http://www.kevjohnson.org/making-maps-in-r-part-2/)
