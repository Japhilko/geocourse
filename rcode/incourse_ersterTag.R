### R Skript erster Tag
# Mon Oct 22 09:57:41 2018

3+3

# install.packages("readstata13")

library(readstata13)

# import von Datensätze
dat <- readstata13::read.dta13()

?read.dta13

?mean

#############################

data_path <- "D:/github/geocourse/data"

getwd()

setwd(data_path)

getwd()

dir()


zen_path <- "D:/GESIS/Vorträge/20171122_userStuttgart/data/"

setwd(zen_path)


bev_dat <- readxl::read_excel("xlsx_Bevoelkerung.xlsx",3)

dim(bev_dat)

bev_dat2 <- bev_dat[1:1000,1:20]

dim(bev_dat2)
DT::datatable(bev_dat[1:1000,1:20])
setwd("D:/github/geocourse/data")

install.packages("xlsx")
library(xlsx)

data_path <- "D:/GESIS/data"
setwd(data_path)

dat <- xlsx::read.xlsx2("Datzen.xlsx",1)

dat <- read.csv2("Datzen.csv")

getwd()
dir()

####################################
# Überblick verschaffen

head(dat)

colnames(dat)

rownames(dat)

View(dat)

###########################


zen_path <- "D:/GESIS/Vorträge/20171122_userStuttgart/data/"
setwd(zen_path)

bev_dat <- readxl::read_excel("xlsx_Bevoelkerung.xlsx",3)

colnames(bev_dat)[1]

head(bev_dat[,1])

table(bev_dat[,1])

bev_dat <- data.frame(bev_dat)

  # Element oben links in der Ecke
bev_dat[1,1]

  # erste Zeile
bev_dat[1,]


bev_dat[,1]

bla <- substr(bev_dat[,1],1,2)

table(bla)

bev_dat$bla <- substr(bev_dat[,1],1,2)

SAL <- bev_dat[bla=="10",]




dim(SAL)

#########################

table(nchar(bla))

table(nchar(bev_dat[,1]))
      
bev_dat[nchar(bev_dat)==7,]

ab <- c("1234567","12345678","12345678")

nchar(ab)

ab[nchar(ab)==7] <- paste0("0",ab[nchar(ab)==7])

with(bspdat,ab[nchar(ab)==7] <- paste0("0",ab[nchar(ab)==7]))
      
##############################

colnames(dat)[1:4]


colnames(dat)[1] <- "ags"

colnames(dat)[colnames(dat)=="X1"] <- "ags"


?read.csv

paste("A","BA")
paste0("A","BA")


# install.packages("tmap")
library(tmap)

data(Europa)

head(Europe)

qtm(Europa)
qtm(Europe)

#####


data(World)

qtm(World)

head(World)

Europe <- World[World$continent=="Europe",]

qtm(Europe)

head(World)


url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Unemployment07a13.csv"
Unemp <- read.csv(url)

head(Unemp)

head(Unemp$GEO)


World$iso_a3

iso_a2<- substr(World$iso_a3,1,2)


ind <- match(iso_a2,Unemp$GEO)



World$Val2007M12 <- Unemp$Val2007M12[ind]

World$Val2013M01 <- Unemp$Val2013M01[ind]

######

agrep("Austia",World$name,value=T)

agrep("Austria",World$name,value=T,max.distance = .2)



grep("Austria",World$name,value=T)

country_names <- c("Germany","France","Austria")
country_names

erg <- vector()

for (i in 1:length(country_names)){
  erg[i] <- grep(country_names[i],World$name)
}

####################

ergl <- list()

for (i in 1:length(country_names)){
  ergl[[i]] <- agrep(country_names[i],World$name)
}


erg


#########

krs_daten <- data.frame(krs=c("A","B"),wert=c(5,6))

gem_daten <- data.frame(krs=sample(c("A","B"),100,replace=T),
                        gem=1:100)

head(gem_daten)

head(krs_daten)

ind <- match(gem_daten$krs,krs_daten$krs)

gem_daten$wert_krs <- krs_daten$wert[ind]

kreis <-c(rep("A",10),rep("B",5))

gem <- sample()


########

grep("Austria",World$name)

agrep()

##################################
# Lösung Aufgabe

url <- "https://raw.githubusercontent.com/Japhilko/
GeoData/master/2015/data/Unemployment07a13.csv"
Unemp <- read.csv(url)
head(Unemp)

Europe <- World[World$continent=="Europe",]

iso2 <- substr(Europe$iso_a3,1,2)

ind <- match(iso2,Unemp$GEO)

Europe$Val2007M12 <- Unemp$Val2007M12[ind]

qtm(Europe,"Val2007M12")

########

str(Europe$Val2007M12)

Europe$Val2007M12 <- as.numeric(Europe$Val2007M12)

  # das Graphikfenster wieder schließen
dev.off()

################################
install.packages("maptools")

library("maptools")

data(wrld_simpl)

plot(wrld_simpl)

str(wrld_simpl)

head(wrld_simpl@data)

wrld_simpl@data$POP2005


gini <- read.csv("https://raw.githubusercontent.com/Japhilko/geocourse/master/data/gini-index_csv.csv")

gini05 <- gini[gini$Year=="2005",]

  # mehrere Jahre
gini_b <- gini[gini$Year%in%c("2005","2004"),]

dim(gini_b)

rm(gini_b)

############################

ab <- c(1,2,3,NA)
!is.na(ab)

############################
gini12 <- gini[gini$Year=="2012",]

ind <- match(gini12$Country.Code,wrld_simpl$ISO3)
length(ind)
ind2 <- ind[!is.na(ind)]
length(ind2)

ginimap <- wrld_simpl[ind2,]

ginimap@data$gini12 <- gini12$Value[!is.na(ind)]

library(sp)
sp::spplot(ginimap,"gini12")

library(colorRamps)
spplot(ginimap,"gini12",
       col.regions=matlab.like(100))

  # mehr Farbverläufe
library(RColorBrewer)
display.brewer.all()

###########################

ginimap@data$farbe <- ginimap@data$gini12/max(ginimap@data$gini12)

plot(ginimap,col=rgb(0,ginimap@data$farbe,0))

farben <- ginimap@data$farbe

spplot(ginimap,"gini12",
       col.regions=farben)

############################################

my.palette <- rgb(seq(0,1,.05),0,0)

spplot(ginimap,"gini12",
       col.regions=my.palette)

############################################

library(RColorBrewer)
my.palette2 <- brewer.pal(n = 9, 
                          name = "OrRd")

spplot(ginimap,"gini12",
       col.regions=my.palette2)


############################################

table(wrld_simpl$REGION)

plot(wrld_simpl[wrld_simpl$REGION==0,])
plot(wrld_simpl[wrld_simpl$REGION==2,])


mymap <- unionSpatialPolygons(wrld_simpl,
                              wrld_simpl$REGION)


plot(mymap,col="royalblue")
length(mymap)

plot(mymap[1,])
plot(mymap[2,])


url <- "https://raw.githubusercontent.com/Japhilko/GeoData/master/2015/data/Unemployment.csv"
Unemp <- read.csv(url)

ind <- match(Unemp$geo,wrld_simpl$NAME)
ind2 <- ind[!is.na(ind)]
mymap <-  wrld_simpl[ind2,]
mymap@data$Unemp <- Unemp$X2014M10[!is.na(ind)]

spplot(mymap,"Unemp")
