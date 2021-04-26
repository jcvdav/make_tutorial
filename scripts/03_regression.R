######################################################
#                  regress things                   #
######################################################
# 
# Fit a statistically obscene regression
#
######################################################

# Load packages
library(here)
library(modelsummary)
library(tidyverse)

# Read-in the data
fish_data <- readRDS(here("data", "clean_fish_data.rds"))

# Fith the model
model <- lm(count ~ factor(year) + fish, data = fish_data)

# Create table and export it
modelsummary(models = model,
             statistic_vertical = F,                            # Add t-stat on horizontal
             gof_omit = "IC|Adj|Log",                           # Remove goodness of fit measures
             stars = T,                                         # Add "significance stars"
             output = here("results", "tab", "reg_table.html"))   # Export to folder
