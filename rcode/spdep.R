#' ---
#' title: "R-Paket spdep"
#' author: "Jan-Philipp Kolb"
#' date: "22 Februar 2017"
#' output: 
#'   beamer_presentation:
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: tango
#'     fig_caption: no
#'     keep_tex: yes
#'     theme: CambridgeUS
#'   ioslides_presentation: 
#'     keep_md: yes
#' ---
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
