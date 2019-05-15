# Jan Domingo
# May 16, 2019
#Final: Lab Take-home

#1
#(a) What was the longest game streak until a loss?
p = 20/38 
n = 1000 #Amount of simulations
gamestreak = vector()
largestStreak = 0;

for (i in 1:n) {
  streak = 0
  lose = 0
  while (lose == 0)
  {
    u = runif(1)  #runif(1) generates a random number between 0 and 1
    if (u < p)  #If the random number is lesss than the probability of winning
      lose = 1  #Stops the simulation if lose = 1
    streak = streak + 1
    if (streak > largestStreak)
      largestStreak = streak;
  }
  streak  #Returns the amount of plays until lose
  largestStreak
  
  gamestreak = c(gamestreak, streak)
}

#(b) Plot the histogram of game streak lengths
hist(gamestreak, br=seq(min(gamestreak)-.5, max(gamestreak)+.5), main = "Longest Game Streak per Simulation")

#(c) Average of the game streaks
mean(gamestreak)

#(d) Variance of the game streaks
var(gamestreak)


