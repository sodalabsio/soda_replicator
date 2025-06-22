********************
* SCRIPT: 0X_MyFinalDatasetCreationDo.do
* PURPOSE:  This script merges and appends individual dataset to the final dataset 
* OUTPUT: [FILENMAE.dta] 
********************
* 1. Open base dataset
* 2. Merge dataset1 
* 3. Merge dataset2
* 4. Save final dataset
********************
global path "[PATH]/empirics/" 
cd "$path"
set more off

//-----------------------------------------------------------------------------------//
// 1. Load base dataset (i.e. panel with full i and t dimensions)
//-----------------------------------------------------------------------------------//

use $path/input/intermediate/BASEPANELFILE.dta, clear


//-----------------------------------------------------------------------------------//
// 2. Merge dataset1 
//-----------------------------------------------------------------------------------//

  merge 1:1 id time using $path/input/intermediate/dataset1.dta

  *IMPORTANT Conduct Post-merge analysis
  *tab _merge
  *Explain _merge==1 // _merge==2 
  *use `assert` and `if` for merge checks  
  *drop if _merge==2; drop _merge 


//-----------------------------------------------------------------------------------//
// 3. Merge dataset2 
//-----------------------------------------------------------------------------------//

  merge 1:1 id time using $path/input/intermediate/dataset2.dta

  *IMPORTANT Conduct Post-merge analysis
  *tab _merge
  *Explain _merge==1 // _merge==2 
  *use `assert` and `if` for merge checks  
  *drop if _merge==2; drop _merge 


//-----------------------------------------------------------------------------------//
// 4. Save final dataset
//-----------------------------------------------------------------------------------//


save $path/output/FINALDATASET.dta, replace