######################################################
#                make figure 1                       #
######################################################
# 
# Let's make a time-series of average count per species
#
######################################################

# Load packages
library(here)
library(tidyverse)

# Read-in the data
fish_data <- readRDS(here("data", "clean_fish_data.rds"))

# Create figure 1
p <- ggplot(data = fish_data,
            mapping = aes(x = year, y = count, fill = fish, group = fish)) +
  stat_summary(geom = "line", fun = "mean") +                                     # Add lines that follow the mean
  stat_summary(geom = "errorbar", fun.data = mean_se, width = 0.1) +              # Add errorbars of +- 1 SD
  stat_summary(geom = "point", fun = "mean", size = 4, shape = 21) +              # Add average points
  scale_fill_brewer(palette = "Set1", direction = -1) +                           # Change colors
  theme_minimal() +                                                               # Change theme
  labs(x = "Year", y = "Count (Mean +- SD)")                                      # Change axis


# Export the plot
ggsave(filename = here("results", "img", "time_series.png"),
       plot = p,
       width = 6,
       height = 4)
