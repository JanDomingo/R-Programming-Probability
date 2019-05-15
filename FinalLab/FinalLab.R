# Jan Domingo
# May 16, 2019
#Final: Lab Take-home

#1
#(a) What was the longest game streak until a loss?
p = 20/38 
n = 1000 #Amount of simulations
gamestreak = vector()
longestStreak = 0

for (i in 1:n) {
  streak = 0
  lose = 0
  while (lose == 0)
  {
    u = runif(1)  #runif(1) generates a random number between 0 and 1
    if (u < p)  #If the random number is less than the probability of winning
      lose = 1  #Stops the simulation if lose = 1
    streak = streak + 1
    if (streak > longestStreak)
      longestStreak = streak
  }
  streak  #Returns the amount of plays until lose
  longestStreak #Returns the longest streak in the simulation
  
  gamestreak = c(gamestreak, streak)
}

#(b) Plot the histogram of game streak lengths
hist(gamestreak, br=seq(min(gamestreak)-.5, max(gamestreak)+.5), main = "Longest Game Streak per Simulation")

#(c) Average of the game streaks
mean(gamestreak)

#(d) Variance of the game streaks
var(gamestreak)

#-------------------------------------------------------------------------------------------------------------

#2 
#(a) What was the longest game streak until 10 black or green spins?
p = 20/38
n = 1000
gamestreak = vector()
longestStreak = 0

for (i in 1:n) {
  streak = 0
  lose = 0
  while (lose <= 10) #This line is different from #1a. Only stops simulation when lose reaches 10
  {
    u = runif(1)  #Generates a random number between 0 and 1
    if (u < p)    #If the random number is less than the proabability of winning
      lose = lose + 1 #Then increase the lose count
    streak = streak + 1
    if (streak > longestStreak)
      longestStreak = streak
  }
  streak #Returns the longest streak until 10 black or green spins
  longestStreak #Returns the longest streak in the simulation
  gamestreak = c(gamestreak, streak)
}

#(b) Plot a histogram of the game streak lengths
hist(gamestreak, br=seq(min(gamestreak)-.5, max(gamestreak)+.5), main = "Longest Game Streak per Simulation")

#(c) Average of the game streaks
mean(gamestreak)

#(d) Variance of the game streaks
var(gamestreak)

#-------------------------------------------------------------------------------------------------------------


