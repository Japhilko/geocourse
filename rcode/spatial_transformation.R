# Jan-Philipp Kolb
# Mon Sep 03 09:55:25 2018

###############################################
# Bibliotheken einlesen


library(rgdal)
library(raster)



###############################################
# Daten einlesen

vg250path <- "J:/Work/GESISPanel_DATA/01_post_processing/c01/e_2017/ee/01_wave/data/com/geodata/vg250/"


setwd(vg250path)
VG250 <- readOGR ("VG250_GEM.shp","VG250_GEM")

bla <- substr(VG250@data$AGS_0,1,2)

###############################################

# coordinates(spatsamp) <- c("x", "y")
proj4string(spatsamp) <- CRS("+proj=utm +zone=32
+ellps=GRS80 +units=m +no_defs")

res <- spTransform(spatsamp, CRS("+proj=utm +zone=51 ellps=WGS84"))

###############################################

# http://rspatial.org/spatial/rst/6-crs.html


