#Jan Domingo
#Homework #8 Appendix: R Programs
#4, 6, and 7

#4  Babies' birth weights are normally distributed with mean 120 ounces and standard deviation 20 ounces. 
#   Low birth weight is an important indicator of a newborn baby's chances of survivlal.
#   One definition of low birth weight is that it is the fifth percentile of the weight distribution.

#(a): Using R find the value of the fifth percentile in which babies who weigh less than this amount would be 
#     considered low birth weight. p = .05, mean = 120oz, sd = 20
qnorm(0.05, 120, 20, lower.tail = TRUE) # = 87.10293 ounces

#(b): Very low birth weight is used to describe babies who are born weighing less than 52 ounces. Using R,
#     find the probability that a baby is born with very low birth weight.
pnorm(52, 120, 20, lower.tail = TRUE) # = .0034


#************************************************************************************************************


#6  The CPU time T, in seconds, to execute a piece of software changes based on the input parameters. 
#   Suppose the CPU time follows a Weibull distribution with parameters alpha = 0.05 and beta = 0.25.
#   Find f(t), E(t), and Var(t) (Use the gamma in R for the latter two. Also recall alpha deteermines
#   the scale, beta determines the shape). Also find the probability that the CPU software will take
#   longer than 1 second to execture
#   alpha = 0.05, beta = 0.25

#E(t): alpha * gamma(1/beta + 1)
0.05 * gamma(1/0.25 + 1) # = 1.2

#Var(t): alpha^2 * gamma(2/beta + 1) - alpha^2 * gamma(1/beta + 1)^2
0.05^2 * gamma(2/0.25 + 1) - 0.05^2 * (gamma(1/0.25 + 1))^2 # = 99.36

#Probability the CPU softare will take longer than 1 second to execute
1 - pweibull(1, 0.25, 0.05) # = 0.1206644


#************************************************************************************************************

#7  A PE instructor studied the verical distances that students in a ninth grade class could jump which he found
#   follows a Weibull distribution with parameters alpha = 11.08 and beta = 3.7. What is the mean (again use the
#   gamma function to help find the mean)? Using R, what range of distances constitute the middle 50% of the 
#   distribution?
#   alpha = 11.08, beta = 3.7

# Computing the mean:(alpha/beta) * gamma(1/alpha)
(11.08/3.7) * gamma(1/11.08) # = 31.69874


#Range of Distances for middle 50% of distribution:

#At 75%
qweibull(0.75, 11.08, 3.7, lower.tail = TRUE) # = 3.810698

#At 25%
qweibull(0.25, 11.08, 3.7, lower.tail = TRUE) # = 3.306489
