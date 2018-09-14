# Work with geojson data
# Fri Sep 14 18:11:23 2018
# Jan-Philipp Kolb


ab <- lawn_polygon(ddat)

# https://blog.exploratory.io/creating-geojson-out-of-shapefile-in-r-40bc0005857d

# https://github.com/Robinlovelace/Creating-maps-in-R/blob/master/R/shp-to-geojson.R

library(geojsonio)
geojson_write(ddat, file = "../data/ddat.geojson")

dland <- geojsonio::geojson_read("../data/ddat.geojson",
                                     what = "sp")

sp::plot(dland)

