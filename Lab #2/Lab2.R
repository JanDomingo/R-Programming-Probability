#2
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


n = 10	#number of trials
sample10 = sample(1:5000, 10)
prop10 = propCalc(n) #Calculates the proportion

n = 100	#number of trials
sample100 = sample(1:5000, 100)
prop100 = propCalc(n)	#Calculates the proportion

n = 500	#number of trials
sample500 = sample(1:5000, 500)
prop500 = propCalc(n)	#Calculates the proportion

n = 1000 #number of trials
sample1000 = sample(1:5000, 1000)
prop1000 = propCalc(n) #Calculates the proportion

