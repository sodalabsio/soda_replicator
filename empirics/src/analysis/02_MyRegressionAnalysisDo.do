********************
* SCRIPT: 02_MyRegressionAnalysisDo.do
* PURPOSE:  This script runs regression analysis for the main results and export results
* OUTPUT: [table1.tex] or [table1.csv] 
********************
* 1. Load final dataset 
* 2. OLS Regression and result export using outreg2
* 3. OLS Regression and result export using regsave
********************
global path "[PATH]/empirics/" 
cd "$path"
set more off

//-----------------------------------------------------------------------------------//
// 1. Load final dataset  
//-----------------------------------------------------------------------------------//

use $path/output/FINALDATASET.dta, clear


//-----------------------------------------------------------------------------------//
// 2. OLS Regression and result export using outreg2
//-----------------------------------------------------------------------------------//

TABLE 1. [TABLE CAPTION]


* Column 1
reg y x1, robust
regsave using "`tmpfile'", ci pval addlabel(outcome, "y" , fe, " ", spec, "ols") replace
* Column 2
reg y x1 x2, robust
regsave using "`tmpfile'", ci pval addlabel(outcome, "y" , fe, " ", spec, "ols") append
* Column 3
reg y x1 x2 x3, robust
regsave using "`tmpfile'", ci pval addlabel(outcome, "y" , fe, " ", spec, "ols") append
 
use "`tmpfile'", clear
outsheet using "$path/output/results/table1.csv", comma replace

//-----------------------------------------------------------------------------------//
// 3. OLS Regression and result export using regsave
//-----------------------------------------------------------------------------------//

 TABLE 1. [TABLE CAPTION]
* Temporary file to save regression results
capture: tempfile drop tmpfile
tempfile tmpfile


* Column 1
reg y x1, robust
regsave using "`tmpfile'", ci pval addlabel(outcome, "y" , fe, " ", spec, "ols") replace
* Column 2
reg y x1 x2, robust
regsave using "`tmpfile'", ci pval addlabel(outcome, "y" , fe, " ", spec, "ols") append
* Column 3
reg y x1 x2 x3, robust
regsave using "`tmpfile'", ci pval addlabel(outcome, "y" , fe, " ", spec, "ols") append
 
use "`tmpfile'", clear
outsheet using "$path/output/results/table1.csv", comma replace