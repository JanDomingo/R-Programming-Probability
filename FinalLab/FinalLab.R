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

#4

x1_v = vector()
x2_v = vector()
n = 1000
x_vals = vector()
m = 2 #mean
v = 2 #variance
s = sqrt(v) #standard deviation

#The following i, ii, and iii are the steps for the Box-Muller Method
#i Generates two uniform variates
for (i in 1:n) {
  u1 = runif(1)
  u2 = runif(2)

#ii Convert Variates to z scores
z1 = sqrt(-2*log(u1))*cos(2*pi*u2)
z2 = sqrt(-2*log(u1))*sin(2*pi*u2) 

#iii Inverse normal transformation to x variates
x1 = s * z1 + m
x2 = s * z2 + m

x1_v = c(x1_v, x1)
x2_v = c(x2_v, x2)
}

x_vals = c(x1_v, x2_v)

#(a) The mean, variance, and median of the combined variates of x1_v and x2_v
mean(x_vals)
var(x_vals)
median(x_vals)

#(b) Histogram of these combined variates and an overly with the true density
hist(x_vals, freq = FALSE, xlab="Normal Variates", ylim=c(0,0.30))	#Creates histogram with density values
lines((x, y, col = "red"))
lines(x,y,col = "red") #Overlay the true density curve over the graph


