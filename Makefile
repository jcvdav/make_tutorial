# Makefile for the make_tutorial project.
# Orchestrates the full analysis pipeline: raw data → clean data → figures/table → report.
# Usage:
#   make            # Build all figures (default target)
#   make draft.html # Render the full HTML report
#   make figures    # Build all figures only

# Default target: build all figures
figures: results/img/time_series.png results/img/first_year.png

# Render the R Markdown report; depends on both figures and the regression table
draft.html: draft.Rmd results/img/time_series.png results/img/first_year.png results/tab/reg_table.html
	Rscript -e "rmarkdown::render('draft.Rmd', quiet = T)"

# Plot fish abundance over time
results/img/time_series.png: scripts/01_figure_1.R data/clean_fish_data.rds
	Rscript scripts/01_figure_1.R

# Plot fish abundance for the most recent year
results/img/first_year.png: scripts/02_figure_2.R data/clean_fish_data.rds
	Rscript scripts/02_figure_2.R

# Run regression and produce the results table
results/tab/reg_table.html: scripts/03_regression.R data/clean_fish_data.rds
	Rscript scripts/03_regression.R

# Clean and process raw fish data
data/clean_fish_data.rds: scripts/00_clean_data.R data/raw_fish_data.rds
	Rscript scripts/00_clean_data.R