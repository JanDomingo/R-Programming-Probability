#R Code for Lab 3
#Jan Domingo


#1A: Generate 10,000 variates using the random number generator
#Generate random variates according to the RANDU generator
#X_(n+1) = 16807 X_n mod 2^31; a = 16807, c = 0, m = 2^31-1
n = 10000 #number of variates
x = 1 #seed
for (i in 1:n) {
  x = c(x, (16807*x[i])%%(2^31-1)) #modulus
}
x = x[2:(n+1)] #Disregards seed value, keeps the other 10000 from for loop
u = x/(2^31-1)  #Transforming uniform variates between 0 and 1


#1B: Draw a historgram of these variates
par(mfrow = c(2,1)) #2 rows, 1 column for the graph matrix
hist(u, main="", xlab = "RANDU variates", ylab = "Frequencies") # histogram of the n RANDU variates


#1C: Draw the empirical cumulative distribution function against the CDF
plot.ecdf(u, verticals = TRUE, do.p = FALSE, main="", ylab = "Probability")
abline(0,1, col="red")


#1D: Kolmogorov-Smirnov Test of RANDU variates against U(0, 1) distribution
ks.test(u, "punif", 0, 1)




#2B:Calculates the EPMF and the ECDF 
n = 1000
x = 0 #initial vector)
bpmf = rep(0.20, 5) #True PMF
bcdf = cumsum(bpmf) #True CDF
uniLine = c(0,bcdf) #Uniform line from 0-1 broken into 4 intervals
xval = 1:5 #1 = S, 2 = L, 3 = U, 4 = R, 5 = M
for (i in 1:n) {
  u = runif(1)  #Sample a random variate from U(0,1). The inverse transofrmation method
  x[i] = sum(u > uniLine) #Random variate between 1 and 5 (letter on bottle cap) 
}
epmf = table(x)/n #Emprical PMF
ecdf = cumsum(epmf) #Empirical CDF


#2C: Present a histogram of your variates
hist(x, xlab="Bottle Cap Letter", ylab="Frequencies", breaks=seq(min(x)-0.5, max(x)+0.5))


#2D: Present a plot of the emprical cdf versues the true cdf
plot(xval, bcdf, xlab="Letter", yLab="CDF", main="ECDF vs True CDF", pch=19)
points(xval, ecdf, pch=8, col="red")


