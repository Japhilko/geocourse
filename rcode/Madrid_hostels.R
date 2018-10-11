#' ---
#' title: "Use Case Backpacker"
#' author: "Jan-Philipp Kolb"
#' date: "23 Oktober 2018"
#' output:
#'   beamer_presentation:
#'     colortheme: beaver
#'     fonttheme: structurebold
#'     highlight: tango
#'     fig_caption: no
#'     keep_tex: yes
#'     theme: CambridgeUS
#'   slidy_presentation: 
#'     keep_md: yes
#' ---
#' 
#' ## Backpacking Routes
#' 
## ----echo=F--------------------------------------------------------------
library(knitr)

#' 
#' 
#' ![pic](http://www.indietraveller.co/wp-content/uploads/2014/11/download-930x473.jpg)
#' 
#' [Source](http://www.indietraveller.co/map-of-where-to-go-backpacking/)
#' 
#' ## The geosmdata2 package
#' 
## ----eval=F--------------------------------------------------------------
## library("devtools")
## # devtools::install_github('Japhilko/GeoData/geosmdata2')

#' 
## ------------------------------------------------------------------------
library(geosmdata2)

#' 
#' 
#' 
#' ## Download Information from OpenStreetMap
#' 
#' [OSM map features](http://wiki.openstreetmap.org/wiki/Map_Features)
#' 
## ----eval=F,cache=T------------------------------------------------------
## place <- "Madrid"
## object <- "hostel"
## obj <- get_osm_nodes(object,place)

#' 
#' 
#' 
## ----echo=F,cache=T------------------------------------------------------
place <- "Madrid"
objectL <- c("hostel","bar","fast_food")
i <- 1
object <- objectL[i]
obj <- get_osm_nodes(object,place)

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## library(XML)
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/BackpackerExample/data")
## saveXML(obj,file=paste(place,"_",object,".RData",sep=""))

#' 
#' 
#' 
#' ## Extract information
#' 
#' The following function extracts the tagged information
#' 
## ----cache=T,message=F,warning=F-----------------------------------------
op <- extract_info_op(obj,object)

#' 
## ----eval=F--------------------------------------------------------------
## github.path <- "C:/Users/kolbjp/Documents/GitHub/GeoData/2015/data"
## setwd(github.path)
## Hostels_Madrid <- op
## write.csv(Hostels_Madrid,file="Hostels_Madrid.csv")

#' 
#' 
#' 
#' ![pic](figure/OSMhostel.PNG) 
#' 
#' 
#' ## Data Overview
#' 
## ----echo=F,cache=T------------------------------------------------------
ind <- is.na(op$addr.city)
op <- op[-ind,]

#' 
## ----warning=F,message=F-------------------------------------------------
colnames(op)

#' 
#' ## Dat Overview II
#' 
## ----echo=F--------------------------------------------------------------
kable(op[,c("name","lat","lon")])

#' 
#' ## Get a map 
#' 
## ----cache=T,message=F,warning=F-----------------------------------------
library(ggmap)
place_map12stamen <- qmap(place, zoom = 12,
                          maptype="toner-lite",
                          source="stamen")
place_map12stamen

#' 
#' ## Plot results
#' 
## ----cache=T,warning=F,message=F-----------------------------------------
place_map12stamen + geom_point(aes(x = lon, y = lat),
                       data = op,size=3,col="red") 

#' 
#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/BackpackerExample/figure")
## png(paste(place,"_",object,".png",sep=""))
## place_map12stamen + geom_point(aes(x = lon, y = lat),
##                        data = op,size=3,col="red")
## dev.off()

#' 
#' 
#' 
#' ## Get other points of interest
#' 
## ----eval=F--------------------------------------------------------------
## place <- "Madrid"
## object <- "bar"
## obj <- get_osm_nodes(object,place)
## op2 <- extract_info_op(obj,object)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/BackpackerExample/data")
## saveXML(obj,file=paste(place,"_",object,".RData",sep=""))

#' 
#' 
## ----cache=T,echo=F------------------------------------------------------
i <- 2

object <- objectL[i]
obj2 <- get_osm_nodes(object,place)

op2 <- extract_info_op(obj2,object)

#' 
#' ## Combine data
#' 
## ----eval=F--------------------------------------------------------------
## op_df1 <- data.frame(op[,c("lat","lon")],objN="hostel")
## op_df2 <-data.frame(op2[,c("lat","lon")],objN="bar")
## 
## op_df <- rbind(op_df1,op_df2)

#' 
#' 
## ----echo=F--------------------------------------------------------------
op_df1 <- data.frame(op[,c("lat","lon")],objN=objectL[1])
op_df2 <-data.frame(op2[,c("lat","lon")],objN=objectL[2])

op_df <- rbind(op_df1,op_df2)

#' 
#' 
## ----cache=T,warning=F,message=F-----------------------------------------
place_map12stamen + geom_point(aes(x = lon, y = lat,col=objN),
                       data = op_df,size=3) 

#' 
#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/BackpackerExample/figure")
## png(paste(place,"_",object,".png",sep=""))
## place_map12stamen + geom_point(aes(x = lon, y = lat,col=objN),
##                        data = op_df,size=3)
## dev.off()

#' 
#' ## Add more Information 
#' 
#' Where to get some fast food
#' 
## ----fast_food,cache=T,message=F,warning=F,echo=F------------------------
i <- 3
object <- objectL[i]
obj <- get_osm_nodes(object,place)
op3 <- extract_info_op(obj,object)

#' 
## ----eval=F,echo=F-------------------------------------------------------
## setwd("J:/Work/Statistik/Kolb/Workshops/2015/Spatial_MA/Folien/BackpackerExample/data")
## saveXML(obj,file=paste(place,"_",object,".RData",sep=""))

#' 
## ----echo=F--------------------------------------------------------------
op_df3 <-data.frame(op3[,c("lat","lon")],objN=objectL[3])

op_df <- rbind(op_df,op_df3)

#' 
## ----cache=T,warning=F,message=F-----------------------------------------
place_map12stamen + geom_point(aes(x = lon, y = lat,col=objN),
                       data = op_df,size=2,alpha=.5) 

