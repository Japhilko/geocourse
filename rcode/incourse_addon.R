######
# Jan-Philipp Kolb
# 23.10.2018


install.packages("rworldmap")

vignette('rworldmap')

data(countryExData)

  # plot ist eine generische Funktion
plot(1:10)

plot(countriesCoarse)

##############
install.packages("ggmap")

#############

install.packages("osmar")

devtools::install_github("dkahle/ggmap")

install.packages("devtools")
devtools::install_github("hadley/ggplot2")

ls()
##########################
# als stata Datensatz abspeichern

install.packages("readstata13")

readstata13::save.dta13(countryExData,
                        file="countryExData.dta")

getwd()

Dat

dat


library(xlsx)
HHsr<-read.xlsx2(paste0(eurostatpath,"HHsavingRate.xls"),1)

#####################################################

library(jsonlite)
dat<-jsonlite::fromJSON("../data/amsterdam_busstop.geojson")
typeof(dat)

dat

tab_plz <- table(info$addr.postcode)
names(tab_plz)
