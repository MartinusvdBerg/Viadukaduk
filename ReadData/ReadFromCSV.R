#A simple script to load in the data from the project google drive
#
# Author: Martinus van den Berg
#Dates of modification:
#- 22/03/2021

require("tidyverse")
require("readxl")
base_folder <- "~/Viadukaduk/Data/"

# require("googledrive") #Load a package to query the google drive, this is a goal for a later date.

#Gather the files from the current folder
files <- list.files(base_folder, all.files = T, full.names = T, recursive = T)

All_Data <- NULL
for(file in files) {
  if(!grepl("*.csv", file)) {
    next #Skip if not a csv file
  }

  dat_in <- as_tibble(read.csv(file))


  All_Data <- bind_rows(All_Data, #Store all in a single Tibble
  dat_in %>%
    mutate(timestamp = as.POSIXct(timestamp)) %>% #Set the timestamp to a POSIX version
    add_column(Sensor = str_extract(file, "VDK.{3}")) #Append a string to identify the sensor
  )
}

saveRDS(All_Data, paste0(base_folder, "All_Data.Rds"))
