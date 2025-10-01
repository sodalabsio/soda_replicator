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

# Write to interim file storage
fwrite(population, "../data/interim/population.csv")
