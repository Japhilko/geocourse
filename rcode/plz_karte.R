#' ---
#' title: "Postleitzahlen Karten"
#' author: "Jan-Philipp Kolb"
#' date: "23 Oktober 2018"
#' output: beamer_presentation
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)
GESIS <- F
athome <- !GESIS

#' 
#' 
#' ## Worum geht es in diesem Abschnitt
#' 
#' - Karte mit PLZ-Bereichen importieren
#' - PLZ-Bereiche zusammenfassen
#' - Eine räumliche Stichprobe ziehen
#' - Adressen für die gezogenen Punkte bestimmen
#' - Adressdatensatz bereinigen
#' - Entfernung zum Hauptbahnhof bestimmen
#' 
#' ## PLZ Datensatz einlesen
#' 
#' - [**Quelle**](http://arnulf.us/PLZ) für PLZ Shapefiles
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
#' ## Der Grenze von Deutschland
#' 
## ------------------------------------------------------------------------
ddat <- maptools::unionSpatialPolygons(SpP = plz,
                                IDs = rep(1,length(plz)))


#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## save(ddat,file="../data/ddat.RData")

#' 
#' 
#' 
#' ## [Räumliche Stichprobe](https://www.rdocumentation.org/packages/sp/versions/1.3-1/topics/spsample)
#' 
## ------------------------------------------------------------------------
# set.seed(323)
set.seed(5)
n <- 1000
spatsamp <- spsample(ddat,n,type="random")

#' 
#' 
#' ## Reverse Geokodierung
#' 
## ------------------------------------------------------------------------
library(ggmap)

#' 
#' 
## ----eval=F--------------------------------------------------------------
## spatlist <- list()
## for (i in 1:n){
##   spatlist[[i]] <- ggmap::revgeocode(c(spatsamp[i,]$x,
##                                        spatsamp[i,]$y))
## }
## 
## spatvec <- unlist(spatlist)
## spatsamp$adress <- spatvec

#' 
## ----eval=F,echo=F-------------------------------------------------------
## plz_place <- "Deutschland"
## save(spatsamp,file=paste0("../data/spatsamp_",plz_place,".RData"))

#' 
## ----echo=F--------------------------------------------------------------
load(paste0("../data/spatsamp_",sampplz,".RData"))

#' 
#' ## Die räumliche Stichprobe plotten
#' 
## ------------------------------------------------------------------------
plot(ddat)
points(spatsamp)

#' 
#' 
#' ## Nur tatsächliche Adressen
#' 
#' - [**Reguläre Ausdrücke**](http://stat545.com/block022_regular-expression.html) in R
#' 
## ------------------------------------------------------------------------
addr_list <- spatsamp$adress
  # Adressen raus nehmen, die NA sind
indna <- which(is.na(addr_list))
addr_list <- as.character(addr_list)
addr_list2 <- strsplit(x = addr_list,split = " ")
addr_list2b <- unlist(lapply(addr_list2,length))
ind_ua <- which(addr_list2b<3)
addr_list3 <- unlist(lapply(addr_list2,function(x)x[1]))
  # Adressen rauß nehmen, die Landstraßen 
  # oder Autobahnen sind
addr_list3 <- tolower(addr_list3)
ind_str <- grep("^[a-z][1-9]", addr_list3, value = F)
ind_str2 <- agrep("unnamed", addr_list3, value = F)


addr_list_t <- addr_list[-c(ind_str,ind_str2,ind_ua,indna)]

#' 
## ----eval=F,echo=F-------------------------------------------------------
## save(addr_list_t,file=paste0("../data/addr_list_t_",plz_place,"_samp1",".RData"))

#' 
#' ## Das Ergebnis plotten
#' 
## ------------------------------------------------------------------------
plot(plz[plz@data$PLZ99==sampplz,])
points(spatsamp,pch=20)
points(spatsamp[ind_str,],pch=20,col="green")
points(spatsamp[ind_ua,],pch=20,col="purple")
points(spatsamp[indna,],pch=20,col="red")

#' 
#' ## Distanzen berechnen
#' 
## ------------------------------------------------------------------------
library("SoDA")

#' 
## ------------------------------------------------------------------------
?geoDist

#' 
