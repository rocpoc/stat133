Workout 01
================
Rocky Lubbers
10/1/18

``` r
salary_rank = data.frame(arrange(summarise(group_by(nba2018, team),
          salary = sum(salary)), desc(salary)))

ggplot(salary_rank, aes(x=reorder(team, salary), y=salary)) +
 geom_bar(stat='identity') + coord_flip() + xlab("Team") + ylab("Salary (in millions)") + 
  ggtitle("NBA Teams Ranked by Total Salary")  + theme(plot.title = element_text(hjust = 0.5)) +
  geom_hline(yintercept = mean(salary_rank$salary), color = 'red', alpha = 0.6, size = 2)
```

![](workout01-rocky-lubbers-files/salary%20barchart-1.png)

``` r
points_rank = data.frame(arrange(summarise(group_by(nba2018, team),
          points = sum(points)), desc(points)))

ggplot(points_rank, aes(x=reorder(team, points), y=points)) +
 geom_bar(stat='identity') + coord_flip() + xlab("Team") + ylab("Points") + 
  ggtitle("NBA Teams Ranked by Total Points")  + theme(plot.title = element_text(hjust = 0.5)) +
  geom_hline(yintercept = mean(points_rank$points), color = 'red', alpha = 0.6, size = 2)
```

![](workout01-rocky-lubbers-files/points%20barchart-1.png)

``` r
nba2018 = mutate(nba2018, missed_fg = field_goals_atts - field_goals)
nba2018 = mutate(nba2018, missed_ft = points1_atts - points1)
nba2018 = mutate(nba2018, rebounds = off_rebounds + def_rebounds)
efficiency = (nba2018$points + nba2018$rebounds + nba2018$assists + nba2018$steals + nba2018$blocks 
       - nba2018$missed_fg - nba2018$missed_ft - nba2018$turnovers) / nba2018$games
nba2018 = mutate(nba2018, efficiency = efficiency)

efficiency_rank = data.frame(arrange(summarise(group_by(nba2018, team),
          efficiency = sum(efficiency)), desc(efficiency)))

ggplot(efficiency_rank, aes(x=reorder(team, efficiency), y=efficiency)) +
 geom_bar(stat='identity') + coord_flip() + xlab("Team") + ylab("Efficiency") + 
  ggtitle("NBA Teams Ranked by Total Efficiency")  + theme(plot.title = element_text(hjust = 0.5)) +
  geom_hline(yintercept = mean(efficiency_rank$efficiency), color = 'red', alpha = 0.6, size = 2)
```

![](workout01-rocky-lubbers-files/efficiency%20barchart-1.png)

``` r
team_offensivity = data.frame(arrange(summarise(group_by(nba2018, team),
          offensive = sum((steals + total_rebounds + fouls + blocks - def_rebounds) / games)), desc(offensive)))

ggplot(team_offensivity, aes(x=reorder(team, offensive), y=offensive)) +
 geom_bar(stat='identity') + coord_flip() + xlab("Team") + ylab("Offensivity Index") + 
  ggtitle("NBA Teams Ranked by 'Offensivity'")  + theme(plot.title = element_text(hjust = 0.5)) +
  geom_hline(yintercept = mean(team_offensivity$offensive), color = 'red', alpha = 0.6, size = 2)
```

![](workout01-rocky-lubbers-files/offensive%20barchart-1.png)

For my own index, I came up with an 'offensivity' equation, which is given by: (steals + total rebounds + fouls + blocks - defensive rebounds) / games played. I chose this because I think it aptly describes how offensive a team plays in their games. Steals, blocks, fouls, and the number of offensive rebounds gives a good calculation of the overall aggressiveness a team plays with, and the numbers associated with it.

Comments and Reflections
========================

-   This was not my first time working with a project with a file structure, I've done just a couple of similar structured projects. This was my first time using relative paths, and now I can see their importance: if someone else downloads your folder or project the code needs to be reproducable on any machine, so having relative paths keeps everything organized. This was my first time writing an R script, and I really enjoyed just writing the code (almost more than markdown/RMD files). Some of the plotting functions were difficult, but nothing struck me as too hard. I think writing the R script code and doing the git/file structure management were fun and easy-ish for me. I worked solely by myself on this assignment. This workout took me around 4 hours to complete start to finish, with most of the first couple sections taking up my time. I really enjoyed having the whole project structure and relative paths and making sure everything works with each other!
