# Verify that the files are intact

# Clear environment
rm(list = ls())

# Load package
require("digest")

# Verify md5 checksums
paste0("../data/raw/weather/", c("precipitation", "temperature"), ".csv") |>
  vapply(digest, character(1L), file = T, USE.NAMES = F) |>
  identical(c("9513eb8bfb3179e14419a69497dcb801", "c10360b5e9f39af01427e66015fea3f1"))
