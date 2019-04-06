#R Code for Lab 3

#1
#(a)

#This function calculates the probabilty of a "double six" showing up in 24 pair rolls for n amount of times
probCalc = function(n) {
  success = 0 #"Double six" roll counter
  for (i in 1:n) {
    rolls = replicate(24, sum(sample(1:6,2,replace=TRUE)))
    if (sum(rolls == 12) > 0) {
      success = success + 1 #increment counter if at least one double six appears)
    }
  }
  return (success/n)
}

prob1000 = probCalc(1000) #Calculates the probablity of "double six" occuring in 24 die pair rolls, 1000 times
    
