######################################################
#               create fish data                     #
######################################################
# 
# This function creates a fake dataset with fish types
# and fish counts. We'll build on it to generate other
# version of of the data later on.
#
######################################################

get_data <- function(seed = 20, years = c(2015:2020), fish = c("red fish", "blue fish")) {
  # How many years do we have?
  n_years <- length(years)
  n_fish <- length(fish)
  n <- n_years * n_fish * 4
  
  set.seed(seed)
  data <- expand.grid(year = years,
                      transect = 1:4,
                      fish = fish)
  
  data$count <- rpois(n = n, lambda = 10)
  
  saveRDS(object = data, file = here::here("data", "raw_fish_data.rds"))
}
