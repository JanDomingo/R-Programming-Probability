#R Code for Lab 3

#1
#(a)

probCalc = function(n)
  success <- 0
  
  rolls <- replicate(24, sum(sample(1:6,2,replace=TRUE)))
  if (sum(rolls == 12) > 0) ## or sum(rolls == 12) >= 1
    success = success + 1 
  
