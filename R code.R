#####Poverty project R code

#Load necessary libraries

library(raster)
library(rgdal)

# Setting a working directory

setwd ("/Users/ZMatsenaZingoni/Documents/UCLA/Poverty code")

# Reading the ultra-poverty Malawi raster file generated from EBK in ArcGIS

MWIraster<-raster("Raster.tif") 

#Plotting the raster map

plot(MWIraster)
range(MWIraster)

#Creating a file with a higher resolution

MWIrasterlog<-disaggregate(MWIraster,10)

# Reading the Malawi 9208 polygon shapefile

EAs<-rgdal::readOGR("Shapefile/ECHOS_prioritization_mdf_fixedgeom.shp")

# Creating a raster of the dis-aggregated map with same resolution as the Malawi shapefile. 
# This step may take a few minutes to complete

MWIMeanlog<-rasterize(EAs,MWIrasterlog)

#Extracting the mean ultra-poverty values for each of the Malawi 9208 communities
#This step may take approximately 25 minutes
WQ1<-unlist(lapply(1:9208,calc<-function(i) {mean(extract(MWIrasterlog*(MWIMeanlog==i),EAs[i,])[[1]],na.rm=T)}))

#To join the mean ultra-poverty values to each ID
cbind(EAs$OBJECTID,WQ1)[1:5,]
WQ1<-cbind(EAs$EACODE,WQ1)

#Output file to use for Figure 3 A and B
write.csv(WQ1,"WQ1_partitionedEBK.csv")
