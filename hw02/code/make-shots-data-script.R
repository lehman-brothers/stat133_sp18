## title: make shots data script 
## description: data for shots made and missed by golden state warriors starters
## input(s): csv files with raw shot data from the nba
## output(s): txt files with summaries for each individual starter

library('dplyr')
library('tidyverse')
library('tibble')


# andre iguodala 
iguodala <- read.csv("C:/Users/Daniel/Desktop/school/spring_2018/stat_133/hw-stat133/hw02/data/andre-iguodala.csv", stringsAsFactors = FALSE)
iguodala$name <- 'Andre Iguodala'
iguodala$shot_made_flag <- as.character(iguodala$shot_made_flag)
iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "missed shot"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "made shot"
iguodala <- mutate(iguodala, minute = (period*12) - minutes_remaining)
iguodala

iguodala_summary <- summary(iguodala)
sink(file = "../output/andre-iguodala.txt")
iguodala_summary
sink()


# draymond green 
green <- read.csv("C:/Users/Daniel/Desktop/school/spring_2018/stat_133/hw-stat133/hw02/data/draymond-green.csv", stringsAsFactors = FALSE)
green$name <- 'Draymond Green'
green$shot_made_flag <- as.character(green$shot_made_flag)
green$shot_made_flag[green$shot_made_flag == "n"] <- "missed shot"
green$shot_made_flag[green$shot_made_flag == "y"] <- "made shot"
green <- mutate(green, minute = (period*12) - minutes_remaining)
green

green_summary <- summary(green)
sink(file = "../output/draymond-green.txt")
green_summary
sink()


# kevin durant 
durant <- read.csv("C:/Users/Daniel/Desktop/school/spring_2018/stat_133/hw-stat133/hw02/data/kevin-durant.csv", stringsAsFactors = FALSE)
durant$name <- 'Kevin Durant'
durant$shot_made_flag <- as.character(durant$shot_made_flag)
durant$shot_made_flag[durant$shot_made_flag == "n"] <- "missed shot"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "made shot"
durant <- mutate(durant, minute = (period*12) - minutes_remaining)
durant

durant_summary <- summary(durant)
sink(file = "../output/kevin-durant.txt")
durant_summary
sink()


# klay thompson
thompson <- read.csv("C:/Users/Daniel/Desktop/school/spring_2018/stat_133/hw-stat133/hw02/data/klay-thompson.csv", stringsAsFactors = FALSE)
thompson$name <- 'Klay Thompson'
thompson$shot_made_flag <- as.character(thompson$shot_made_flag)
thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "missed shot"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "made shot"
thompson <- mutate(thompson, minute = (period*12) - minutes_remaining)
thompson

thompson_summary <- summary(thompson)
sink(file = "../output/klay-thompson.txt")
thompson_summary
sink()


# stephen curry
curry <- read.csv("C:/Users/Daniel/Desktop/school/spring_2018/stat_133/hw-stat133/hw02/data/stephen-curry.csv", stringsAsFactors = FALSE)
curry$name <- 'Stephen Curry'
curry$shot_made_flag <- as.character(curry$shot_made_flag)
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "missed shot"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "made shot"
curry <- mutate(curry, minute = (period*12) - minutes_remaining)
curry

curry_summary <- summary(curry)
sink(file = "../output/stephen-curry.txt")
curry_summary
sink()


shots_data <- rbind(curry, thompson, durant, iguodala, green)
shots_data
write.csv(shots_data, "../data/shots-data.csv")


shots_data_summary <- summary(shots_data)
sink(file = "../output/shots-summary.txt")
shots_data_summary
sink()
