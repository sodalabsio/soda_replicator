# Clean and merge weather data set files

# Clear environment
rm(list = ls())

# Load package
require("data.table")

# Load data
weather <- list.files("../data/raw/weather", "[.]csv$", full.names = T) |>
  lapply(fread)

# Drop missing values
weather <- lapply(weather, na.omit)

# Join precipitation and temperature
weather <- weather[[1L]][weather[[2L]], nomatch = NULL, on = c("country", "city")]

# Write to intermediate file storage
fwrite(weather, "../data/intermediate/weather.csv")
