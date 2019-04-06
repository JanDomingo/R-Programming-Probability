#R Code for Lab 1

#1
#(a) (b)

n = 10 #number of trials
simFlips = sample(0:1, n, replace=TRUE) #Simulate a coin flip n times
simHeads = sum(simFlips==1)
propHeads = sum(simHeads)/n #calculate the proportion of heads

n = 100 #number of trials
simFlips = sample(0:1, n, replace=TRUE) #Simulate a coin flip n times
simHeads = sum(simFlips==1)
propHeads = sum(simHeads)/n #calculate the proportion of heads

n = 500 #number of trials
simFlips = sample(0:1, n, replace=TRUE) #Simulate a coin flip n times
simHeads = sum(simFlips==1)
propHeads = sum(simHeads)/n #calculate the proportion of heads

n = 1000 #number of trials
simFlips = sample(0:1, n, replace=TRUE) #Simulate a coin flip n times
simHeads = sum(simFlips==1)
propHeads = sum(simHeads)/n #calculate the proportion of heads


#(c)
# Plot the cumulative proportion of heads for 1,000 flips
#Use the same results from (a)
n = 1000 #number of trials
simFlips = sample(0:1, n, replace=TRUE) #Simulate a coin flip n times
cumulHeads = cumsum(simFlips==1)
cumulProp = cumulHeads/c(1:n) #calculate the proportion of heads
#Plotting the cumulative proportions versus the number of rolls
plot(cumulProp, xlab="Number of Flips", ylab="Proportion of Heads")


#==============================================
#2 
#(b)
n = 1000 #number of trials
#Simulate and sum n dice rolls 
simFlips = replicate(n, sum(sample(1:6, 2, replace=TRUE)))
#Find the number of pairs that were snake eyes
sum2 = sum(simFlips==2)
#Find the proportion of snake eyes
sum2Prop = sum2/n





