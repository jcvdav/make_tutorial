draft.html: draft.Rmd results/img/time_series.png results/img/first_year.png results/tab/reg_table.html
	Rscript -e "rmarkdown::render('draft.Rmd', quiet = T)"

results/img/time_series.png: scripts/01_figure_1.R data/clean_fish_data.rds
	Rscript scripts/01_figure_1.R

results/img/first_year.png: scripts/02_figure_2.R data/clean_fish_data.rds
	Rscript scripts/02_figure_2.R

results/tab/reg_table.html: scripts/03_regression.R data/clean_fish_data.rds
	Rscript scripts/03_regression.R

data/clean_fish_data.rds: scripts/00_clean_data.R data/raw_fish_data.rds
	Rscript scripts/00_clean_data.R