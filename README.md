# Poverty-project
The files shared provides a guide of how the data used to plot some of the Figures presented in the manuscript were generated. 

SOURCE DATA FILES

1. Household wealth dataset (HH wealth data.csv): This file contains the wealth quintile and wealth scores for each of the households. The column variable labels are:
   
householdid: unique household identification number

centroidid: cluster location identification number

wealthscorecont: numeric wealth score for each household

wealthquintile: five wealth quintile categories for each household defined as 1"Lowest" 2"Second" 3"Middle" 4"Fourth" 5"Highest

2. Cluster-level wealth percentage (WQ1 data.csv): This is an output file after aggregating the HH wealth data.csv and it contains the percentage of ultra-poverty estimates at each cluster in addition to other variables. This data file is merged with the geolocations and becomes a data source for the ultra-poverty Emperical Bayesian Kringing (EBK) with a output file name WQ1_2 data.csv. Also, once converted into a shapefile, it becomes a data source for the hot spot mapping in SaTScan using the household counts per cluster. The column variable labels are:
   
centroidid: cluster location unique identification number

wealthscorecont: the average wealth scores per cluster

HHID: The total number of households per cluster

WQ1: The total number of households per cluster which are poorest

WQ2: The total number of households per cluster which are poor

WQ3: The total number of households per cluster which are od middle wealth

WQ4: The total number of households per cluster which are rich

WQ5: The total number of households per cluster which are the richest

WQ1Prop: The percentage of household per cluster with are ultra-poor

PovertyWQ4: The total number of households per cluster which are not ultra-poor

3. District-level wealth percentage (WQ1 district.csv): The output file will contain the percentage of ultra-poverty estimates at each district in Malawi. This data file is used for the cholopleth mapping of the ultra-poverty at the district level. The column variable labels are:
   
ID_1: Malawi district code

NAME_1: Malawi district names

WQ1Prop: The percentage of household per district with are ultra-poor.

4. Ultra-poverty Empirical Bayesian Kriging raster file (Raster.tif): The kriged ultra-poverty at the cluster level (raster map) will provide the source data for the Lee's statistics after partitioning the kriged ultra poverty estimates into a high resolution of 9208 communities in Malawi. This step will generate a new file that has 9208 wealth percentages for each spatial polygon with a file name WQ1_partitionedEBK.csv.

5. The geographic accessibility for secondary and tertiary health care facilities (GA SecondTert.csv): This file contains the geographic accessibility to secondary and tertiary health care facilities in Malawi and its associated univariate local indicators of spatial association (LISA) estimates. The column variable labels are:
   
   OBJECTID:The EA simple unique identifier
   
   EACODE:The EA long unique identifier
   
   SecTer_in_60: Number of secondary and tertiary health care facilities accessible in 60 minutes.
   
   SecTer_in_120: Number of secondary and tertiary health care facilities accessible in 120 minutes.
   
   SecTer_in_180: Number of secondary and tertiary health care facilities accessible in 180 minutes.
   
   LISA_I_secter: LISA indices
   
   LISA_CL_secter: LISA cluster classifications
   
   LISA_P_secter: LISA P-values for significance
   
   MORAN_STD_secter: Standardized geographic accessibility values
   
   MORAN_LAG_secter: Lagged geographic accessibility values

7. The Lee's statistic file (Lees.csv):

ACKNOWLEDGMENTS 

This script was developed by Zvifadzo Matsena Zingoni, Ph.D., as part of a project analyzing socio-spatial equity analysis of access to healthcare during her post-doctoral fellowship. Special thanks to the PHIA for providing the data necessary for this analysis.

