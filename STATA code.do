//Poverty project data analysis

********************************************************************************

***Setting a working directory - all files should be in Poverty code folder

cd "/Users/ZMatsenaZingoni/Documents/UCLA/Poverty code"

***Import the household wealth data 
***this is the HH PHIA project dataset but with only centroidid and wealth quintile

import delimited "HH wealth data.csv",clear

*Number of clusters/EAs in the final sample (n=438)
codebook centroidid 

***Tabulate the wealth quintile variable and check for missing
*labels for wealthquintile 1"Lowest" 2"Second" 3"Middle" 4"Fourth" 5"Highest"

tabulate wealthquintile, missing

***Exclude (drop) those households with missing wealth data

drop if wealthquintile==99

*** Count/Number of HH in the final sample (n=12,812)
count   

*Number of clusters/EAs in the final sample (n=437)
codebook centroidid 

***Create dummy variable for wealthquintiles
**this is to create separate binary variables for the wealth quintiles
* labels: WQ1"Lowest" WQ2"Second" WQ3"Middle" WQ4"Fourth" WQ5"Highest"

tabulate wealthquintile, gen(WQ)
tab1 WQ*

*Wealth score range

summarize wealthscorecont,detail

***Cluster(centroidid) level WQ1 estimates
*** This gives the ultra-poverty estimates at the PHIA cluster levels

***Generate a HH count variable
gen HHID=1

***Aggregate the individual household data into cluster

collapse (mean) wealthscorecont (sum) HHID WQ1 WQ2 WQ3 WQ4 WQ5, by(centroidid)

***Calculation the ultra wealth percentage
gen WQ1prop=(WQ1/HHID)*100
replace WQ1prop=round(WQ1prop, 0.01)

sum WQ1prop, detail //0-71.4% mean (19%) and median(17%) 

gen PovertyWQ4=WQ2 +WQ3+ WQ4+ WQ5

***save this dataset

save "WQ1 data.dta",replace
export delimited using "WQ1 data.csv",replace

***Read in the PHIA geolocations data linked to districts

import delimited "geolocations.csv", clear

***Merge WQ1 and geolocations datasets using centroids and keep the merged data

merge 1:1 centroidid using "WQ1 data.dta"
keep if _merge==3
drop _merge

***save this dataset 
save "WQ1_2 data.dta", replace

***Export as csv to use in ArcGIS for Figure 1B and 1C (Output file)

export delimited using "WQ1_2 data.csv"

***Aggregate the household data into district

collapse (mean) WQ1pro, by(id_1 name_1)

summarize WQ1pro, detail

save "District poverty.dta"

*Export as csv to use in ArcGIS for Figure 1A (Output file)

export delimited using "WQ1 district.csv"

***LISA map dataset for geographic accessibility to secondary and tertiary health care

import delimited "GA SecondTert.csv", clear

tabulate lisa_cl_secter

***Lee's bivariate test for WQ1 and GA

import delimited "Lees.csv", clear

tabulate geoda_esti
tabstat geoda_esti, stats(mean p50 min max)
tabulate assoc_cat 

