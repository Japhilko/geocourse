#####
# r Kurs
# 

setwd("D:/geocourse/data/")

library(maptools)

plz <- readShapePoly("post_pl.shp")

plot(plz)

plot(plz[1,])

plz@data[1,]

plzbereich <- substr(plz@data$PLZ99,1,2)
plz68 <- plz[plzbereich=="68",]

plot(plz)
plot(plz68,col="red",add=T)


agrep("Freiburg",plz@data$PLZORT99,
      max.distance = 0.7)


save(plz68,file="plz68.RData")

#------------------------------------#
# Lösung Aufgabe A6A

  # funktioniert
ber <- plz[plz$PLZORT99=="Berlin",]
plot(ber)

info <- grep("Berlin",plz@data$PLZORT99,value=T)

unique(info)
ber_names <- c("Berlin (östl. Stadtbezirke)","Berlin-West")
ber <- plz[plz$PLZORT99 %in% ber_names,]

plot(ber)

save(ber, file="plz_ber.RData")

(load("plz_ber.RData"))

library(raster)
getwd()

LUX1 <- getData('GADM', country='LUX', level=1)
plot(LUX1)

?getData

head(LUX1@data)

LUX1@polygons


########################
# 

setwd("D:/geocourse/data/vg250-ew_3112.utm32s.shape.ebenen/vg250-ew_ebenen/")

gem <- readShapePoly("VG250_GEM.shp")
gem <- rgdal::readOGR("VG250_GEM.shp")

head(gem@data)

bla <- substr(gem$AGS,1,2)


setwd("D:/geocourse/data/vg250-ew_3112.utm32s.shape.kompakt/vg250-ew_kompakt/")

gem <- rgdal::readOGR("VG250_F.shp")

head(gem@data$RS)

bla <- substr(gem@data$RS,1,2)

data_path <- "D:/geocourse/data/"

sal <- gem[bla=="10",]
setwd(data_path)
save(sal,file="sal_shapefile.RData")

##########################

install.packages("colourpicker")

plot(sal,col=c("#EE2C2C"))

plot(sal,col=c("#006400"))

#####
# A7

spatsamp <- spsample(plz, 100,type="random")


spatsamp@coords


library(maptools)
data(wrld_simpl)
Africa <- wrld_simpl[wrld_simpl@data$REGION==2,]
plot(Africa)

length(Africa)

?coordinates
Af <- coordinates(Africa)
nrow(coord_dat)

dim(coord_dat)


install.packages("spdep")
library(spdep)
Af_nb <- tri2nb(Af)

?tri2nb

ngb_algeria <- Af_nb[[1]]

Africa@data[1,]

poly2nb(Africa)

# https://cran.r-project.org/web/packages/gdistance/vignettes/gdistance1.pdf
Africa@data[ngb_algeria,]

###############


setwd("D:/github/geocourse/data/")
london_sport <- readOGR ("london_sport.shp","london_sport")

lons <- coordinates(london_sport)

#####
# Lösung Aufgabe A7A
which(london_sport$name=="City of London")
list_london <- poly2nb(london_sport)

list_london[[33]]
london_sport$name[list_london[[33]]]

plot(london_sport)
plot(london_sport[33,],col="red",add=T)
plot(london_sport[list_london[[33]],],col="orange",add=T)

######
# Geokodierung

install.packages("tmaptools")
library(tmaptools)

gc_gesis <- geocode_OSM("Mannheim B2,1")
gc_gesis$coords


?rev_geocode_OSM

geocode_OSM("Mannheim Hauptbahnhof")


library("RJSONIO")
api_adress <- "http://nominatim.openstreetmap.org/search?format="
file_format <- "json"
search_query <- "&addressdetails=1&extratags=1&q="
adress <- "Amsterdam+Niederlande+Rozengracht+1"
link <- paste0(api_adress,file_format,search_query,adress)
link

con <- url(link)
geoc <- fromJSON(paste(readLines(con,warn=F),
                       collapse = ''))
close(con)


setwd("D:/geocourse/data/")

library(sf)

st_layers("Mannheim_Marktplatz.osm")

lines_ma <- st_read("Mannheim_Marktplatz.osm","lines")

plot(lines_ma)

lines_ma_hw <- lines_ma[,c("geometry","highway")]

plot(lines_ma_hw)

######################
# B6 Using Javascript

url <- "https://raw.githubusercontent.com/Japhilko/




GeoData/master/2015/data/CampSites_Germany.csv"

CampSites <- read.csv(url)


install.packages("leaflet")

library(leaflet)
library("magrittr")


leaflet()%>%
  addTiles()


leaflet() %>%
  addTiles() %>%
  addMarkers(lng=49.48738, lat=8.456597,
             popup="GESIS Mannheim")

# https://www.gpskoordinaten.de/

m <- leaflet() %>%
  addTiles() %>%
  addMarkers(lng=CampSites$lon,
             lat=CampSites$lat,
             popup=CampSites$name,
             clusterOptions = markerClusterOptions()) 
m


m %>% addMarkers()


?addMarkers

########################################################
#

setwd("D:/geocourse/data/")

datzen <- read.csv2("Zensus11_Datensatz_Bevoelkerung.csv")

head(datzen)
head(datzen$AGS_12)

options(scipen=999)

table(nchar(datzen$AGS_12))

datzen2 <- datzen[nchar(datzen$AGS_12)>8,]


table(nchar(datzen2$AGS_12))

  # führende Null

table(substr(datzen$AGS_12,1,1))

table(nchar(datzen$AGS_12))

datzen$AGS_12[nchar(datzen$AGS_12)==11] <- paste0("0",datzen$AGS_12[nchar(datzen$AGS_12)==11]) 

table(nchar(datzen$AGS_12))

# ls()

setwd("D:/geocourse/data/vg250-ew_3112.utm32s.shape.ebenen/vg250-ew_ebenen")

map <- rgdal::readOGR("VG250_GEM.shp","VG250_GEM")
ind <- match(map$RS_0,datzen$AGS_12)
map@data$BIL_5.8 <- datzen$BIL_5.8[ind]
str(map@data$BIL_5.8)

map@data$BIL_5.8 <- as.numeric(as.character(map@data$BIL_5.8))
sp::spplot(map,"BIL_5.8")
