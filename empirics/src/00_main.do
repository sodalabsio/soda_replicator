********************
* SCRIPT: 00_main.do
* PURPOSE:  This script runs all data preparation steps and
*            generates tables and figures for the paper: 
********************

//-----------------------------------------------------------------------------------//
// 1. Set global paths
//-----------------------------------------------------------------------------------//

* Set global path to working directory
global path "[PATH]/empirics" 
cd "$path"

* Set global path to the Rscript executable
// global rpath "/Library/Frameworks/R.framework/Resources/bin/R"
global RSCRIPT_PATH "" // set RSCRIPT_PATH or let rscript find it automatically (default)



//-----------------------------------------------------------------------------------//
// 2. Set Stata options
//-----------------------------------------------------------------------------------//

// set seed 42

clear all
set more off
set maxvar 32767 // default is 5000 (set max dependent on Stata license)
set matsize 11000 // default is 800 (set max dependent on Stata license)
cap log close

version 15.0

//-----------------------------------------------------------------------------------//
// 3. Install packages
//-----------------------------------------------------------------------------------//

* Install all required Stata packages
local ssc_packages "reghdfe regsave rscript duplicates rowranks findname gsort sumup"

if !missing("`ssc_packages'") {
	foreach pkg in `ssc_packages' {
	* install using ssc, but avoid re-installing if already present
		capture which `pkg'
		if _rc == 111 {
		  dis "Installing `pkg'"
		  quietly ssc install `pkg', replace
		}
	}
}

* Install all required R packages
rscript using "$path/code/00_setup_R.R", rversion(3.6)

//-----------------------------------------------------------------------------------//
// 4. Data Preparation
//-----------------------------------------------------------------------------------//

* 4.1 Data Cleaning Step 1 in R 
rscript using "$path/src/dataprep/01_MyDataCleaningRscript.R", args("$path")   rversion(3.6)

* 4.2 Data Cleaning Step 2 in Stata
do "$path/src/dataprep/02_MyDataCleaningStataDo.do"


//-----------------------------------------------------------------------------------//
// 5. Analysis
//-----------------------------------------------------------------------------------//

* 5.1 Data Analysis Step 1 in Stata
do "$path/src/analysis/01_MyAnalysisStataDo.do"

* 5.2 Data Analysis Step 1 in R
rscript using "$path/src/analysis/01_MyAnalysisRscript.R", args("$path") rversion(3.6) 

//-----------------------------------------------------------------------------------//
// 6. Tables & Figures
//-----------------------------------------------------------------------------------//

* 6.1 Create figures 
 

* 6.2 Create tables
 