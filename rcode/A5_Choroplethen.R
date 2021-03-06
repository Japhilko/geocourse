#' ---
#' title: "A5 - Choroplethen - `maptools` und `choreplethr`"
#' author: "Jan-Philipp Kolb"
#' date: "22 Oktober 2018"
#' output:
#'   slidy_presentation: 
#'     keep_md: yes
#'   beamer_presentation:
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: tango
#'     fig_caption: no
#'     keep_tex: yes
#'     theme: CambridgeUS
#' ---
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
#' ### Ein Choropleth ist eine Karte, die
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
## ----echo=F--------------------------------------------------------------
gini <- read.csv("../data/gini-index_csv.csv")

#' 
## ----eval=F--------------------------------------------------------------
## link<-"https://raw.githubusercontent.com/Japhilko/geocourse/
## master/data/gini-index_csv.csv"
## gini <- read.csv(link)

#' 
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
#' ## Das Paket `colorRamps` verwenden
#' 
## ------------------------------------------------------------------------
library(colorRamps)
spplot(ginimap,"gini12",col.regions=matlab.like(100))

#' 
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
#' ### US Amerikanischer Community Survey
#' 
## ----warning=F,message=F,echo=T------------------------------------------
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
#' ## Das R-Paket `choroplethrMaps`
#' 
## ------------------------------------------------------------------------
library(ggplot2);library(choroplethrMaps)
data(country.map)
ggplot(country.map, aes(long, lat, group=group))+ 
  geom_polygon()

#' 
#' ## Eine Karte für die USA
#' 
## ------------------------------------------------------------------------
data(state.map)
ggplot(state.map,aes(long,lat,group=group))+geom_polygon()

#' 
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
