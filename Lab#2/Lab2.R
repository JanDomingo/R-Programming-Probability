#R Code for Lab 2

#1
#(a)(b)

#This function calculates the proportion of numbers that are divisible by 4, 7, or 10 in the sample set
propCalc = function(n) {  #n represents the number of trials
  success = 0 #Success counter
  for (i in 1:n) {
    x = sample (1:5000, 1)
    if(x %% 4 == 0 || x %% 7 == 0 || x %% 10 == 0) {
      success = success + 1  #Increases success counter by 1
    }
  }
  return (success/n)  #Returns the estimated proportion of sucessess
}

prop10 = propCalc(10) #Calculates the proportion for 10 trials

prop100 = propCalc(100)	#Calculates the proportion for 100 trials

prop500 = propCalc(500) #Calculates the proportion for 500 trials

prop1000 = propCalc(1000) #Calculates the proportion for 1000 trials



#=========================================================================

#2
#(b)

#This function calculates the proportion of how many times a '15' shows up in a 20 sided die in 10 rolls given n trials
dieRoll = function (n) {
  success = 0
  for (i in 1: n) {
    trial = sample(1:20, 10, replace=TRUE) #Roll a 20 sided die 10 times
    if (sum(trial==15) >= 1) #Calculates how many times a '15' rolled
      success = success + 1
    }
    return(success/n)
}

sim1000 = dieRoll(1000) #Simulates 1000 trials 