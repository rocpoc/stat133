# ===================================================================
# Title: Make Teams Table 
# Description: This script includes a few data cleaning processes, 
#   as well as code to write a few new files from the original dataset.
# Input(s): data file 'nba2018.csv'
# Output(s): /output/efficiency-summary.txt, /output/team-summary.txt, /data/nba2018-teams.csv
# Author: Rocky Lubbers
# Date: 10-3-2018
# ===================================================================

library(readr)
nba2018 <- read_csv('../data/nba2018.csv')

# Remove R from Experience
nba2018$experience <- replace(as.character(nba2018$experience), nba2018$experience == "R", "0")
nba2018$experience = as.integer(nba2018$experience)

# Salary in Millions
nba2018$salary = nba2018$salary / 1000000

# Center Factor Relable
levels(nba2018$position) = c('center', 'power_fwd', 'point_guard', 'small_fwd', 'shoot_guard')

# Adding New Variables
library(dplyr)
nba2018 = mutate(nba2018, missed_fg = field_goals_atts - field_goals)
nba2018 = mutate(nba2018, missed_ft = points1_atts - points1)
nba2018 = mutate(nba2018, rebounds = off_rebounds + def_rebounds)
efficiency = (nba2018$points + nba2018$rebounds + nba2018$assists + nba2018$steals + nba2018$blocks 
       - nba2018$missed_fg - nba2018$missed_ft - nba2018$turnovers) / nba2018$games
nba2018 = mutate(nba2018, efficiency = efficiency)

# Sink efficiency summary output to text file
sink("../output/efficiency-summary.txt")
summary(nba2018$efficiency)
sink()

# Team Aggregation
teams = data.frame(
  summarise(group_by(nba2018, team), 
            experience = round(sum(experience), 2),
            salary = round(sum(salary), 2),
            points3 = sum(points3),
            points2 = sum(points2),
            points1 = sum(points1),
            points = sum(points1),
            off_rebounds = sum(off_rebounds),
            def_rebounds = sum(def_rebounds),
            assists = sum(assists),
            steals = sum(steals),
            blocks = sum(blocks),
            turnovers = sum(turnovers),
            fouls = sum(fouls),
            efficiency = sum(efficiency)
            )
  )

sink("../output/teams-summary.txt")
summary(teams)
sink()
write.csv(teams, file = "../data/nba2018-teams.csv")