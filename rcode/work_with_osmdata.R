# Jan-Philipp Kolb
# Work with osmdata package
# Mon Sep 24 12:23:24 2018

q <- add_osm_feature (q, key = 'amenity')
osmdata_xml(q, '../data/Ladenburg_amenity.osm')


dat <- osmdata_xml(q)

library(osmdata)
q1 <- opq('Amsterdam') %>%
  add_osm_feature(key = 'highway', value = 'cycleway')

q2 <- opq('Amsterdam') %>% add_osm_feature(key = 'building', value = 'residential')

cway_am <- osmdata_sp(q1)

buildings <- osmdata_sp(q2)


sp::plot(cway_am$osm_lines)
sp::plot(buildings$osm_polygons)
