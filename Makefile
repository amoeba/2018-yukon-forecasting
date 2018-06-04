all: may_forecast may_press_release

may_forecast: data/yukon.csv
	Rscript may_forecast/may_forecast.R

may_press_release: data/yukon.csv may_forecast/predictions.csv may_forecast/press_release/final_preseason_forecast.Rmd
	Rscript -e "rmarkdown::render('may_forecast/press_release/final_preseason_forecast.Rmd', 'all')"
