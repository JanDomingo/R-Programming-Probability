#R Code for Lab 3

#1
#(a)

#This function calculates the probability of a "double six" showing up in 24 pair rolls for n amount of times
dieSim = function(n) {
  success = 0 #"Double six" roll counter
  for (i in 1:n) {
    rolls = replicate(24, sum(sample(1:6,2,replace=TRUE)))
    if (sum(rolls == 12) > 0) {
      success = success + 1 #increment counter if at least one double six appears)
    }
  }
  return (success/n)
}

prob1000 = dieSim(1000) #Calculates the probability of "double six" occurring in 24 die pair rolls, 1000 times
    

#=========================================================================

#2
#a

bdayProb = function(n) {
  success = 0
  for (i in 1:n) {
    bdays = sample(1:365, 23, replace = TRUE)
    sort(bdays)
    bdayFreq = table(bdays)
    if (max(bdayFreq) >=2) { #Returns maximum frequency count
      success = success + 1
    }
  }
  return (success/n)
}

prob1000 = bdayProb(1000)
prob10000 = bdayProb(10000)
prob50000 = bdayProb(50000)


#=========================================================================

#3
#a

w = c(-10, -10, -10, 0, 0, 14)
winnings = sample (w, 1000, replace = TRUE)  #Result of 1000 trials saved into winnings
table (winnings) #Displays total count for -10, 0, and 14
table (winnings)/1000 #Displays the probability distribution function
winProp = table(winnings)/1000 
cumsum(winProp) #Displays the cumulative distribution function (CDF)
mean(winnings)  #Displays sample the mean
sd(winnings)    #Displays sample the standard deviation
var(winnings)   #Displays sample the variance

