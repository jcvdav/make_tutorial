######################################################
#                  clean data                        #
######################################################
# 
# This script reads in the raw data, cleans it, and
# then exports it ready for analysis and visualization
#
######################################################

# Load packages
suppressPackageStartupMessages({
  library(here)
  library(tidyverse)
})

# Read-in data
raw_fish_data <-
  readRDS(file = here("data", "raw_fish_data.rds"))

# Inspect the data in your preferred way

# Clean the data
clean_fish_data <- raw_fish_data %>% 
  arrange(year, transect, fish) %>%                                        # Arrange by year, transect, and species
  mutate(fish = str_remove_all(fish, "fish"))                              # Remove all mentions of "fish"


# Export the clean data
saveRDS(object = clean_fish_data,
        file = here("data", "clean_fish_data.rds"))
