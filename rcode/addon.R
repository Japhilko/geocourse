#' ---
#' title: "Addon Information"
#' author: "Jan-Philipp Kolb"
#' date: "22 August 2018"
#' output: beamer_presentation
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

#' 
#' ## 
#' 
#' - [Mapping the Prevalence of Alzheimer Disease Mortality in the USA](https://www.r-bloggers.com/mapping-the-prevalence-of-alzheimer-disease-mortality-in-the-usa/)
#' 
#' ## Addon zu AGS Karten
#' 
## ----eval=F,echo=F-------------------------------------------------------
## VG250 <- readOGR ("VG250_L.shp","VG250_L")

#' 
#' 
#' ## Adressenliste erstellen
#' 
## ----eval=F--------------------------------------------------------------
## addr_list <- spatsamp$adress
##   # Adressen raus nehmen, die NA sind
## addr_list <- as.character(addr_list[!is.na(addr_list)])
## addr_list2 <- strsplit(x = addr_list,split = " ")
## addr_list2b <- unlist(lapply(addr_list2,length))
## ind_ua <- which(addr_list2b<3)
## addr_list3 <- unlist(lapply(addr_list2,function(x)x[1]))
##   # Adressen rauß nehmen, die Landstraßen
##   # oder Autobahnen sind
## addr_list3 <- tolower(addr_list3)
## ind_str <- grep("^[a-z][1-9]", addr_list3, value = F)
## 
## addr_list_t <- addr_list[-c(ind_str,ind_ua)]

#' 
#' ## 
#' 
## ------------------------------------------------------------------------
#sp::proj4string(poi) <- sp::CRS("+init=epsg:4326")
# res <- spTransform(poi, CRS("+init=epsg:3035"))

#' 
#' 
#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## VG250 <- readOGR ("VG250_F.shp","VG250_F")
## head(VG250@data)

#' 
#' 
#' 
## ------------------------------------------------------------------------
bla <- substr(agsmap$ags,1,2)

plot(agsmap[bla=="11",])

#' 
#' 
#' 
## ------------------------------------------------------------------------
rs <- as.character(VG250@data$RS)
nchar_rs <- nchar(rs)

agsmap <- VG250[nchar_rs==12,]
agsmap$ags <- paste0(substr(as.character(agsmap@data$RS),1,5),substr(as.character(agsmap@data$RS),10,12))

#' 
#' 
#' ## Links
#' 
#' - [ggmap does not work with plot_sf/geom_sf](https://github.com/r-spatial/sf/issues/336)
