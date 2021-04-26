######################################################
#                  make figure 2                     #
######################################################
# 
# Let's make an abundance chart for all the most recent
# transects
#
######################################################

# Load packages
suppressPackageStartupMessages({
  library(here)
  library(tidyverse)
})

# Read-in the data
fish_data <- readRDS(here("data", "clean_fish_data.rds")) %>% 
  filter(year == min(year)) %>%                                             # Keep the data for the first year only
  group_by(transect) %>%                                                    # Group by transect
  summarize(count = sum(count))                                             # And sum abundances across all species

# Create figure 2
p <- ggplot(data = fish_data,
            mapping = aes(x = transect,
                          y = count)) +
  geom_col(fill = "steelblue", color = "black") +                           # Add columns
  theme_minimal() +                                                         # Minimal theme 
  labs(x = "Transect", y = "Abundance (all species)")                       # And axis labels

# Save the figure
ggsave(filename = here("results", "img", "first_year.png"),
       plot = p,
       width = 6,
       height = 4.5)
