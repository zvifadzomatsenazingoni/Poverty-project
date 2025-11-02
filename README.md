# Socio-spatial equity analysis

The files shared provide a guide of all the analyses done for this project. For national estimates, survey weights were applied.

SOURCE DATA FILES

1. Household wealth dataset (HH wealth data.csv): This file contains the wealth quintile and wealth scores for each of the households. The column variable labels are:
   
      householdid: unique household identification number.

     centroidid: cluster location identification number.

     wealthscorecont: numeric wealth score for each household.

     wealthquintile: five wealth quintile categories for each household defined as 1"Lowest" 2"Second" 3"Middle" 4"Fourth" 5"Highest.

     hhwt001: household survey weights.

2. Cluster-level wealth percentage (WQ1 data.csv): This is an output file after aggregating the HH wealth data.csv and it contains the percentage of ultrapoor households at each cluster in addition to other variables. Once merged with the geolocations, it becomes a data source for the Emperical Bayesian Kriging (EBK) with an output file name WQ1_2 data.csv. Also, once converted into a shapefile, it becomes a data source for the hot spot mapping in SaTScan using the household counts per cluster. The column variable labels are:
   
    centroidid: cluster location unique identification number.

    wealthscorecont: the average wealth scores per cluster.

    HHID: The total number of households per cluster.

    WQ1: The total number of households per cluster that are poorest.

    WQ2: The total number of households per cluster that are poor.

    WQ3: The total number of households per cluster that are of middle wealth.

    WQ4: The total number of households per cluster that are rich.

    WQ5: The total number of households per cluster that are the richest.

    WQ1Prop: The percentage of households per cluster that are ultrapoor.

   PovertyWQ4: The total number of households per cluster that are not ultrapoor. This is the sum of WQ2, WQ3, WQ4 and WQ5.

3. District-level wealth percentage (WQ1 district.csv): The output file will contain the percentage of ultrapoor households at each district in Malawi. This data file is used for the choropleth mapping of the percentage of ultrapoor households at the district level. The column variable labels are:
   
   ID_1: Malawi district code.

   NAME_1: Malawi district names.

   WQ1Prop: The percentage of households per district that are ultrapoor.

4. Ultra-poverty Empirical Bayesian Kriging raster file (Raster.tif): This is the kriged raster map of the percentage of ultrapoor households that will be partitioned into percentages of ultrapoor households per community. The partitioned results will be saved in WQ1_partitionedEBK.csv file. The output file data will be used for the Lee's statistic estimation.

5. The geographic accessibility for secondary and tertiary healthcare facilities (GA SecondTert.csv): This file contains the geographic accessibility to secondary and tertiary healthcare facilities in Malawi and its associated univariate local indicators of spatial association (LISA) estimates. The column variable labels are:
   
   OBJECTID:The spatial unit simple unique identifier.
   
   EACODE:The spatial unit long unique identifier.
   
   SecTer_in_180: Number of secondary and tertiary healthcare facilities accessible in 3 hours of walking.
   
   LISA_I_secter: LISA indices.
   
   LISA_CL_secter: LISA cluster classifications.
   
   LISA_P_secter: LISA P-values for significance.
   
   MORAN_STD_secter: Standardized geographic accessibility values.
   
   MORAN_LAG_secter: Lagged geographic accessibility values.

7. The Lee's statistic file (Lees.csv): This is a bivariate spatial association output file for percentage of wealth households (100 - percentages of household that are ultrapoor) per community and geographic accessibility of secondary and tertiary healthcare facilities. The column variable labels are:

   SOURCE_ID: The spatial unit unique identifier.

   PovertyEBK: The percentage of wealth households in each spatial unit.

   geoDA_esti: The number of secondary and tertiary healthcare facilities accessible in 3 hours of walking.

   P_VALUE: The significance of the cluster classification.

   ASSOC_CAT: The cluster classifications.

CODE FILES

1. STATA code: This is a do file with all the STATA codes for data management and analyses used in this project.

2. R code: This is an R script with all the codes for raster partitioning.


ACKNOWLEDGMENTS 

This script was developed by Zvifadzo Matsena Zingoni, Ph.D., as part of a project analyzing socio-spatial equity analysis of access to healthcare. PHIA data are freely available for registered users at the PHIA project website: https://phiadata.icap.columbia.edu/. Malawi HCF geolocations were obtained from the Ministry of Health in Malawi, and cannot be provided for reasons of confidentiality.

