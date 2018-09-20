# Jan-Philipp Kolb
# Wed Sep 19 11:22:48 2018
# Neue Spatial Pakete


######################
# Paket spData

library(spData)
library(spdep)

library(rgdal)
boston.tr <- readOGR(system.file("shapes/boston_tracts.shp",
                                 package="spData")[1])
boston_nb <- poly2nb(boston.tr)


######################
# mapedit

#install.packages("mapedit")
#install.packages("mapview")

library(mapedit)
library(mapview)
library(magrittr)

lf <- mapview()

# draw some polygons that we will select later
drawing <- lf %>%
  editMap()

####################
# FedData

# install.packages("FedData")

library(FedData)

#####################
# further packages

# 2018-09-19  maptools	Tools for Handling Spatial Objects
# 2018-09-10	BalancedSampling	Balanced and Spatially Balanced Sampling
# 2018-09-10	CARBayes	Spatial Generalised Linear Mixed Models for Areal Unit Data
# 2018-09-10	spagmix	Artificial Spatial and Spatiotemporal Densities on Bounded Windows
# 2018-09-09	gstat	Spatial and Spatio-Temporal Geostatistical Modelling, Prediction and Simulation
# 2018-08-31	adespatial	Multivariate Multiscale Spatial Analysis
# 2018-08-29	IsoriX	Isoscape Computation and Inference of Spatial Origins using Mixed Models
# 2018-08-29	SpNetPrep	Linear Network Preprocessing for Spatial Statistics
# 2018-08-27	georob	Robust Geostatistical Analysis of Spatial Data
# 2018-08-24	krige	Geospatial Kriging with Metropolis Sampling
# 2018-08-24	STMotif	Discovery of Motifs in Spatial-Time Series
# 2018-08-20	shp2graph	Convert a SpatialLinesDataFrame Object to an 'igraph'-Class Object
# 2018-08-19	geogrid	Turn Geospatial Polygons into Regular or Hexagonal Grids
# 2018-08-16	AST	Age-Spatial-Temporal Model
# 2018-08-16	mapedit	Interactive Editing of Spatial Data in R
# 2018-08-14	vapour	Lightweight Access to the 'Geospatial Data Abstraction Library' ('GDAL')
# 2018-08-09	FedData	Functions to Automate Downloading Geospatial Data Available from Several Federated Data Sources

