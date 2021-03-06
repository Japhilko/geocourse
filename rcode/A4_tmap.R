#' ---
#' title: "A4 - Das R-Paket tmap"
#' author: "Jan-Philipp Kolb"
#' date: "22 Oktober 2018"
#' output:
#'   beamer_presentation: 
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: espresso
#'     keep_tex: yes
#'     theme: CambridgeUS
#'   slidy_presentation: 
#'     keep_md: yes
#' ---
#' 
## ----setup_tmap, include=FALSE-------------------------------------------
knitr::opts_chunk$set(echo = TRUE,warning=F,cache=T,fig.height=4)

#' 
#' 
#' ## Inhalt dieses Abschnitts
#' 
#' - Das Paket `tmap` wird vorgestellt. 
#' - Die Datenquelle `naturalearthdata` wird vorgestellt.
#' - Es wird gezeigt, wie man Karten von Europa, der Welt und einzelnen Ländern erzeugen kann
#' 
#' 
## ----echo=F,warning=F,message=F------------------------------------------
library(knitr)
library(DT)
Ex <- T

#' 
#' ## Das Paket [tmap](https://cran.r-project.org/web/packages/tmap/index.html)
#' 
#' ### Thematische Karten
#' 
#' - Mit dem Paket [**tmap**](http://twitter.com/sharon000/status/593028906820599808/photo/1?ref_src=twsrc%5Etfw) kann man thematische Karten erzeugen
#' - Die olgenden Beispiele basieren auf der [**Vignette**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-nutshell.html) des Paketes .
#' 
## ----eval=F--------------------------------------------------------------
## install.packages("tmap")

#' 
#' 
## ----warning=F,message=F-------------------------------------------------
library(tmap)

#' 
#' 
#' ## Der `Europe` Datensatz
#' 
#' ### Natural Earth
#' 
#' - Datensatz enthält Informationen von  [**Natural Earth**](http://www.naturalearthdata.com/)
#' 
## ------------------------------------------------------------------------
data(Europe)

#' 
#' ![](figure/NaturalEarthData.PNG)
#' 
#' 
#' ## Der Befehl `qtm` aus dem Paket `tmap`
#' 
#' ### Schnelle thematische Karte
#' 
#' - Mit dem Befehl [**qtm**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-nutshell.html) kann man eine schnelle thematische Karte erzeugen
#' 
#' - Beispiel aus der [**Vignette**](https://cran.r-project.org/web/packages/tmap/vignettes/tmap-nutshell.html) zum Paket `tmap`
#' 
## ----cache=T-------------------------------------------------------------
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
## datatable(Europe@data, class = 'cell-border stripe',rownames = FALSE,
##           options = list(pageLength = 10, autoWidth = TRUE)
##           )
## # to see the options http://datatables.net/reference/option/

#' 
#' ### [**Der Europa Datensatz im Paket `tmap`**](http://rpubs.com/Japhilko82/tmap_europe_dataset)
#' <!--
## ----echo=F--------------------------------------------------------------
kable(Europe@data[1:10,1:4])

#' -->
#' 
#' ![](figure/tmap_europe.PNG)
#' 
#' ## Um mehr Farbe in die Karte zu bekommen
#' 
#' ### Entwicklungsstand der Wirtschaft
#' 
#' <!--
#' <http://www.naturalearthdata.com/>
#' -->
## ----cache=T,eval=Ex-----------------------------------------------------
qtm(Europe, fill="economy")

#' 
#' 
#' ## Eine Karte mit Text 
#' 
#' ### Bevölkerung
#' 
## ----eval=Ex-------------------------------------------------------------
qtm(Europe, fill="pop_est", text="iso_a3")

#' 
#' ## Dieses Schema passt besser:
#' 
#' ### [**GDP**](https://en.wikipedia.org/wiki/Population_density)
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
#' 
#' ## Themen des Europa-Datensatzes
#' 
#' ### Verfügbare Variablen im Datensatz
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
#' ## Zwei Karten
#' 
#' ### Bevölkerung und Entwicklungsstand
#' 
## ----eval=T--------------------------------------------------------------
tm_shape(Europe) +
    tm_fill(c("pop_est", "economy"), 
        title=c("Population", "Economy"))

#' 
#' 
#' 
#' ## Der Datensatz `World` im Paket `tmap`
#' 
#' ### [Ähnlich wie der `Europe` Datensatz nur für die ganze Welt](http://rpubs.com/Japhilko82/tmap_World)
#' 
## ----echo=F,eval=F-------------------------------------------------------
## data(World)
## datatable(World@data)

#' 
## ----echo=F,eval=F-------------------------------------------------------
## data(World)
## kable(World@data[1:15,])

#' 
## ------------------------------------------------------------------------
data(World)

#' 
#' ![](figure/tmap_world.PNG)
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
#' <!--
#' ## Niederlande - Anteil der Personen 65 plus
#' 
#' (kleiner Trick notwendig - Die Daten hatten sich verändert)
#' 
## ----cache=T,eval=F------------------------------------------------------
## ant <- runif(length(NLD_prov),.18,.28)
## NLD_prov@data$pop_65plus <-
##   round(NLD_prov@data$population*ant)
## pop65plus <- NLD_prov@data$pop_65plus
## prop65plus <- pop65plus/pop
## NLD_prov@data$proportion65plus <- prop65plus

#' 
#' ## Den Anteil der über 65-jährigen visualisieren
#' 
## ----cache=T,eval=F------------------------------------------------------
## qtm(NLD_prov, fill="proportion",fill.title="proportion")

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
#' 
#' ### [UN - World Urbanization Prospects 2018](https://population.un.org/wup/)
#' 
## ------------------------------------------------------------------------
data(metro)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## info_df <- metro@data[1:100,]
## datatable(info_df)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## info_df <- metro@data[1:10,]
## kable(info_df)

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## DT::datatable(metro@data)

#' 
#' ![](figure/tmapMetroDaten.PNG)
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
#' ## Exkurs: der Befehl `match`
#' 
#' ### Zwei Beispielvektoren erstellen:
#' 
## ------------------------------------------------------------------------
vec_a <- c("A",2,6,1,"C")
vec_b <- c(1,"C",2)

#' 
#' ### Die beiden Vektroen zusammen bringen
#' 
#' - Mit der Funktion `match` kann man schauen, welches Element des ersten Vektors sich im zweiten Vektor wiederfindet.
#' 
## ------------------------------------------------------------------------
match(vec_a,vec_b)

#' 
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
#' ## A4A Übung: Visualisierung von Eurostat Daten
#' 
#' ### Erster Teil
#' 
#' - Verbinde die Statistik zur Sparquote mit den Kartendaten.
#' - Stelle die Daten in einer Karte dar.
#' 
#' ### Zweiter Teil
#' 
#' - Such Daten, in denen der Ländername enthalten ist und versuche diesen Datensatz mit `tmap` zu visualisieren.
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
#' ## Das Paket `tmap` zitieren
#' 
## ------------------------------------------------------------------------
citation("tmap")

#' 
#' 
#' 
