# Clean the population data set

# Clear environment
rm(list = ls())

# Load package
require("data.table")

# Load data
population <- fread("../data/raw/population/population.csv")

# Subset to Australia
population <- population[country == "Australia",]

# Measure population in thousands
population[, population := population / 1000]

# Write to intermediate file storage
fwrite(population, "../data/intermediate/population.csv")
