# ===================================================================
# Title: Lab 06 Scipt File
# Description:
#   Using sink commands, manipulating and exporting data/images, 
#   and using the piper operation in dplyr 
# Input(s): data file 'nba2018.csv'
# Output(s): nba2018-players.csv, warriors.csv, lakers.csv, data-structure.txt
#            summary-warriors.txt, summary-lakers.txt, scatterplot-height-weight.png
#            scatterplot-height-weightHIRES.png, weight_hist.jpeg, weight_hist.pdf
#            points_salary.pdf, height_weight_by_position.pdf
# Author: Rocky Lubbers
# Date: 10-3-2018
# ===================================================================

# packages
library(readr)    # importing data
library(dplyr)    # data wrangling
library(ggplot2)  # graphics

# exporting some data tables
nba = read_csv("../data/nba2018-players.csv")
warriors = arrange(filter(nba, team == 'GSW'), salary)
write.csv(GSW, file = "../output/warriors.csv", row.names = FALSE)
lakers = arrange(filter(nba, team == 'LAL'), desc(experience))
write_csv(lakers, "../output/lakers.csv")

#exporting R output
sink(file = '../output/data-structure.txt')
summary(str(nba))
sink()

sink(file = '../output/summary-warriors.txt')
summary(warriors)
sink()

sink(file = '../output/summary-lakers.txt')
summary(lakers)
sink()

png(filename = "../images/scatterplot-height-weight.png")
plot(nba$height, nba$weight, 
     xlab = 'Height', ylab = 'Height')
dev.off()

png(filename = "../images/scatterplot-height-weightHIRES.png", width = 1920, height = 1080)
plot(nba$height, nba$weight, pch = 20, 
     xlab = 'Height', ylab = 'Height')
dev.off()

jpeg(filename = "../images/weight_hist.jpeg", width = 600, height = 400)
hist(nba$weight)
dev.off()

pdf(file= "../images/weight_hist.pdf", width = 7, height = 5)
hist(nba$weight)
dev.off()

## exporting ggplots
gg_pts_salary = ggplot(data = nba) + geom_point(aes(x=points,y=salary))
ggsave("../images/points_salary.pdf", gg_pts_salary, width = 7, height = 5)

gg_ht_wt_positions = ggplot(data = nba) + geom_point(aes(x=points, y=salary)) + facet_wrap(~position)
ggsave("../images/height_weight_by_position.pdf", gg_ht_wt_positions, width = 6, height = 4)

# pipe operations
nba %>% filter(team == 'LAL')

warriors %>% filter(position == 'PG') %>% select(player, salary)

nba %>% filter(experience > 10 & salary <= 10000000) %>% select(player, age, team)

nba %>% filter(experience == 0 & age == 20) %>% select(player, team, height, weight) %>% slice(1:5)

nba = mutate(nba, min_per_game = minutes/games)
gsw_mpg = data.frame(
          nba %>% filter(team == 'GSW') %>% select(player, experience, min_per_game) %>% arrange(desc(min_per_game)))

nba %>% group_by(team) %>%select(points3) %>% summarise(avg3point = mean(points3)) %>% arrange(avg3point) %>% slice(1:5)

nba %>% filter(position == 'PG') %>% filter(experience == 5 | experience == 10) %>% 
  summarise(avg_age = mean(age), sd_age = sd(age))