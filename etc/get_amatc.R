library(rnoaa)
library(dplyr)

# Google for this
# GHCND:USW00026617
# https://www.ncdc.noaa.gov/cdo-web/datasets/GHCND/stations/GHCND:USW00026617/detail
nome_station_id <- 'GHCND:USW00026617'

# Get station info just because
ncdc_stations(datasetid = 'GHCND', stationid = nome_station_id)

# Find out what I need to type into `ghcnd` and subseqently filter on to get
# AMATC
datatypes <- ncdc_datatypes(stationid = nome_station_id, limit = 1000)

# Calculate AMATC
all_ghcnd <- ncdc(datasetid = "GHCND", 
                  stationid = 'GHCND:USW00026617', 
                  startdate = '2018-04-01', 
                  enddate = '2018-04-30', 
                  limit = 1000)

all_ghcnd$data %>% 
  filter(datatype == "TAVG") %>% 
  summarize(tavg_mean = round(mean(value), 2))


all_ghcnd <- ncdc(datasetid = "TOBS", 
                  stationid = 'GHCND:USW00026617', 
                  startdate = '2018-04-01', 
                  enddate = '2018-04-30', 
                  limit = 1000)