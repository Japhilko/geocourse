# Jan-Philipp Kolb
# Mon Mar 05 20:32:34 2018

library("leaflet")
library("tmaptools")


grap_path <- "D:/github/geocourse/slides/figure/"

## Geocoding
gc_tma <- tmaptools::geocode_OSM("Firenze")


m <- leaflet() %>%
  addTiles() %>%  
  addMarkers(lng=gc_tma$coords["x"], lat=gc_tma$coords["y"], popup="Firenze")
m  



library(ggmap)

setwd(grap_path)
pdf("firstpic_firenze.pdf")
firenze <- qmap("Firenze",zoom=16, maptype = "satellite")
dev.off()