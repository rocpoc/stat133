#Expenses
phone <- 80
groceries <- 527
transportation <- 20
gym <- 10
rent <- 1500
other <- 83
total <- groceries + gym + other + phone + rent + transportation
semester <- total * 5
year <- total * 10
expenses <- c(phone, transportation, groceries, gym, rent, other)
barplot(expenses)
expenses <- sort(expenses, decreasing=TRUE)
name <- c('rent', 'groceries', 'other', 'phone', 'transportation', 'gym')
barplot(expenses, names.arg = name)

#Pythagoras Formula
c = sqrt(3^2 + 4^2)
n = 5
k = 2
p = 0.5
n_choose_k <- factorial(n)/(factorial(k)*factorial(n-k))
binomial <- n_choose_k * p^k * (1-p)^(n-k)
#binomial <- 0.3125
binomial <- choose(n,k) * p^k * (1-p)^(n-k)
#binomial <- 0.3125

three_sixes <- choose(10,3)*(1/6)^3 * (1-(1/6))^(10-3)
#three_sixes <- 0.1550454
help.search("binomial")

twohead_5toss <- dbinom(2, 5, 1/2, log = FALSE)
#0.3125
threesix_threeroll <- dbinom(3, 3, 1/6, log = FALSE)
#0.00462963

twohead_5toss_35 <- dbinom(2, 5, 0.35, log = FALSE)
#0.3364156
morethan3 <- dbinom(4, 5, 0.35, log = FALSE) + dbinom(5, 5, 0.35, log = FALSE)
#0.0540225



#Installing Packages
install.packages("stringr")
install.packages("RColorBrewer")
install.packages("XML")
x <- 2
3*x^2 + 4*x + 8
x <- -3:3
3*x^2 + 4*x + 8
?+
?^
# Files is food for viewing and organizing documents, like datasets, etc.
# Help is good for viewing documentation and all resources needed for R and RStudio
# When you click the 'house' icon, it sends you back to the home page of all the help menu
# History is good for looking at all the things you have typed into the console without the outputs
# the "To Source" and "To Console" are used for copying the history to the document and console, resspectively
# The Evironment Tab is good for seeing all the stored variables and their associated values in an easy-to-read format

#Review Questions
#example1
#Error due to Var being capitalized

#example 2
# Error with the symbol 2x

#example 3
2

#example 4
#Error because of space between "a number"

#example 5
16
#Error because of the space again (it is not a string)

  
#RStudio working environment 
# The Source pane is used for viewing and editing your files such as scipts, notebooks, and markdown sheets.
# The Console pane is used for interacting with R, and viewing the outputs of the commands you enter in.
# The Environment, History, Connections Pane has a few uses, like keeping track of your environment variables you 
# declared in the console, seeing all of the previously entered in commands into the console, and I believe setting up
# conenctions to remote databases or servers.
# The Files, Plots, Packages, Help, Viewer pane is used for browing your files on disk, viewing the plots you've created,
# seeing/installing new packages, documentation. 
