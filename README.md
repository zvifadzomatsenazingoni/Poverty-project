# Poverty-project
The files shared provides a guide of how the data used to plot some of the Figures presented in the manuscript were generated.

STATA FILES

Input Files

1. Household wealth dataset (HH wealth data.csv): This file contains the wealth quintile and wealth scores for each of the households. The column variable labels are:
householdid: unique household identification number
centroidid: cluster location identification number
wealthscorecont: numeric wealth score for each household
wealthquintile: five wealth quintile categories for each household defined as 1"Lowest" 2"Second" 3"Middle" 4"Fourth" 5"Highest

2. Cluster geolocations (geolocations.csv): This file contains the geospatial data (geolocations) of the cluster site where the data was collected. The column variable labels are:
centroidid: cluster location unique identification number
ID_1: Malawi district code
NAME_1: Malawi district names
longitude: Longitude geocoordinate
latitude: Latitude geocoordinate

Output Files

1. Cluster-level wealth percentage (WQ1 data.csv/ WQ1 data.dta): The output file will contain the percentage of ultra-poverty estimates at each cluster for the 437 clusters in addition to other variables. The column variable labels are:
centroidid: cluster location unique identification number
ID_1: Malawi district code
NAME_1: Malawi district names
longitude: Longitude geocoordinate
latitude: Latitude geocoordinate
HHID: The total number of households per cluster
WQ1: The total number of households per cluster which are poorest
WQ2: The total number of households per cluster which are poor
WQ3: The total number of households per cluster which are od middle wealth
WQ4: The total number of households per cluster which are rich
WQ5: The total number of households per cluster which are the richest
WQ1Prop: The percentage of household per cluster with are ultra-poor
PovertyWQ4: The total number of households per cluster which are not ultra-poor

2. District-level wealth percentage (WQ1 district.csv / District poverty.dta): The output file will contain the percentage of ultra-poverty estimates at each district in Malawi. The column variable labels are:
ID_1: Malawi district code
NAME_1: Malawi district names
WQ1Prop: The percentage of household per district with are ultra-poor.

R FILES

Input files

1. Ultra-poverty Empirical Bayesian Kriging raster file (Raster.tif): The kriged ultra-poverty at the cluster level (raster map.
   
2. Malawi polygon shapefile (ECHOS_prioritization_mdf_fixedgeom.shp): The Malawi high resolution spatial polygon file which raster map will be mapped onto.

Output files

1. The ultra-poverty percentages for each high-resolution spatial polygon (WQ1_partitionedEBK.csv): The file will contain the 9208 wealth percentages for each spatial polygon. The file will also have an EACODE unique identification for each estimate.
   
ACKNOWLEDGMENTS 

This script was developed by Zvifadzo Matsena Zingoni, Ph.D., as part of a project analyzing socio-spatial equity analysis of access to healthcare during her post-doctoral fellowship. Special thanks to the Blower Lab for providing the data and resources necessary for this analysis.

