//Poverty project data analysis

********************************************************************************

***Setting a working directory - all files should be in this folder

cd "/Users/ZMatsenaZingoni/Documents/UCLA/Poverty code"

***Import the household wealth data 
***this is the HH PHIA project dataset but with only centroidid and wealth quintile

import delimited "HH wealth data.csv"

***Tabulate the wealth quintile variable and check for missing
*labels for wealthquintile 1"Lowest" 2"Second" 3"Middle" 4"Fourth" 5"Highest"

tabulate wealthquintile, missing

***Exclude (drop) those households with missing wealth data

drop if wealthquintile==99

*** Count/Number of HH in the final sample
count //12,812

*Number of clusters/EAs in the final sample
codebook centroidid

***Create dummy variable for wealthquintiles
**this is to create separate binary variables for the wealth quintiles
* labels: WQ1"Lowest" WQ2"Second" WQ3"Middle" WQ4"Fourth" WQ5"Highest"

tabulate wealthquintile, gen(WQ)
tab1 WQ*

***Cluster(centroidid) level WQ1 estimates
*** This gives the ultra-poverty estimates at the PHIA cluster levels

***Generate a HH count variable
gen ID=1

***Aggregate the individual household data into cluster

collapse (sum) ID WQ1 WQ2 WQ3 WQ4 WQ5, by(centroidid)

***Calculation the ultra wealth percentage
gen WQ1prop=(WQ1/ID)*100
replace WQ1prop=round(WQ1prop, 0.01)
sum WQ1prop //0-71.4%

***save this dataset

save "WQ1 data.dta"

***Read in the PHIA geolocations data linked to districts

import delimited "geolocations.csv", clear

***Merge WQ1 and geolocations datasets using centroids and keep the merged data

merge 1:1 centroidid using "WQ1 data.dta"
keep if _merge==3
drop _merge

***save this dataset 
save "WQ1 data.dta", replace

***Export as csv to use in ArcGIS for Figure 1B and 1C

export delimited using "WQ1 data.csv"

***Aggregate the household data into district

collapse (mean) WQ1pro, by(id_1 name_1)

save "District poverty.dta"

*Export as csv to use in ArcGIS for Figure 1A

export delimited using "WQ1 district.csv"

