# APPENDIX
# Jan Domingo
# May 16, 2019
# Final: Lab Take-home

# ------------------------------------------------------------------------------------------------------------- 

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
    if (u < p)    #If the random number is less than the probability of winning
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

#3
n = 10000 #number of variates
x = 1     #seed value

for (i in 1:n) {
  x = c(x, ((31425*x[i])+100)%%(2^29)) #Linear Congruential Method with custom a(31425), b(100), and m(2^29) values
}

x = x[2:(n+1)]  #Disregards seed value, keeps the other 10000 from for loop
x

u = x/(2^29)  #Transform uniform variates between 0 and 1

#(a) Plot a histogram of your variates
par(mfrow = c(2,1)) #2 rows, 1 column for the graph matrix
hist(u, main ="", xlab="RANDU variiates", ylab="Frequencies") #Histogram of the n RANDU variates


#(b) Draw the empirical CDF of oyur variates against the true CDF of a uniform distribution
plot.ecdf(u, verticals = TRUE, do.p = FALSE, xlab = "u", ylab = "ECDF")
abline(0,1, col="red")

#(c)
ks.test(u, "punif", 0, 1) #Komolgorov-smirnov test of RANDU variates against U(0,1)

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
x <- seq(-4, 8, by=0.001) #Generate a sequence of numbers from -4 to 8
y <- dnorm(x, m, s) #Normalize the values with mean=2 and pop sd=sqrt(2)
hist(x_vals, freq = FALSE, xlab="Normal Variates", ylim=c(0,0.30))	#Creates histogram with density values
lines(x,y,col = "red") #Overlay the true density curve over the graph

#(c) Calculating the empirical rule probabilities
i = 1
length(x_vals[(m-i*s) <= x_vals & x_vals <= (m+i*s)]) / length(x_vals)
i = 2
length(x_vals[(m-i*s) <= x_vals & x_vals <= (m+i*s)]) / length(x_vals)
i = 3
length(x_vals[(m-i*s) <= x_vals & x_vals <= (m+i*s)]) / length(x_vals)

