# Clean and merge weather data set files

# Clear environment
rm(list = ls())

# Load packages
require("data.table")
require("fixest")

# Load data
reg_dat <- fread("../data/analysis/baseline.csv")

# Regress population on precipitation and export results
feols(population ~ precipitation, reg_dat) |>
  esttex(file = "../paper/results/tables/baseline_estimates.tex")
