# Create analysis data by merging cleaned input data sets

# Clear environment
rm(list = ls())

# Load package
require("data.table")

# Load data
input_data <- list.files("../data/interim", "[.]csv$", full.names = T) |>
  lapply(fread)

# Join based on city name
input_data <- Reduce(function(x, y) x[y, nomatch = NULL, on = c("country", "city")], input_data)

# Write to analysis file storage
fwrite(input_data, "../data/analysis/baseline.csv")
