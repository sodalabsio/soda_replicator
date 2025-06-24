###########
# SCRIPT: 00_setup_R.R
# PURPOSE: Install required R packages 
###########

rm(list = ls())

# install all required packages (if not available already)
if (!require("pacman")) install.packages("pacman")
pacman::p_load(
  tidyverse, 
  data.table, 
  collapse, 
  haven, 
  lubridate,
  roll, 
  tidyfast,
  sf,
  countrycode,
  geodata,
)

# Load fonts
font_import(prompt = FALSE, pattern = "lmroman*")