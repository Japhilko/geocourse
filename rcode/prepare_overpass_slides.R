# Prepare Overpass slides
# Jan-Philipp Kolb
# Wed Aug 29 11:10:15 2018

setwd("D:/Daten/GitHub/geocourse/slides")

(load("../data/overpass_building_kindergarten_Mannheim.RData"))


# https://github.com/r-spatial/sf/issues/336

man_map = get_map(location = unname(st_bbox(dat_osm)))
ggmap(man_map)

ggplot(dat_osm) + geom_sf()

ggmap(man_map) + geom_sf(data = dat_osm)

plot(st_transform(dat_osm, 3857)[1], col = 0, bgMap = man_map)

plot(st_transform(dat_osm, 3857)[1])

# plot(st_transform(dat_osm, 3857)[1], bgMap = MA_map)


