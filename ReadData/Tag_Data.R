#A function to tag the data with relevant information


#Author: Martinus van den Berg

#A table with the major roadwork dates

rm(list = ls())

base_folder <- "~/Viadukaduk/Data/"

require("tidyverse")
require("readxl")

Ingrepen <- read_xlsx(paste0(base_folder, "Ingrepen.xlsx"))

All_Data <- readRDS(paste0(base_folder, "All_Data.Rds"))

All_Data %>%
  filter(Sensor == "VDK 00") %>%
  ggplot(aes(x = timestamp, y = noise.in.dBA..ICS43432...Noise.)) + geom_line() +
  geom_smooth(method = "loess", span = 0.1)




