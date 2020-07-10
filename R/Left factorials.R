#https://rosettacode.org/wiki/Left_factorials
#Context: The site's other solution used many loops. I considered this unidiomatic.

##Vectorization solution
#Due to vectorization, these sorts of problems are R's bread and butter.
#The only challenge comes from making sure that R plays nice with objects from the gmp library.
library(gmp)
leftFactorial<-function(n)
{
  if(n==0){0}
  else{sum(factorialZ(0:(n-1)))}
}
leftFactorialVecInput<-function(vector)
{
  Vectorize(leftFactorial,SIMPLIFY=FALSE)(vector)
}

#Task 1
leftFactorialVecInput(0:10)
#Task 2
leftFactorialVecInput(seq(20,110,by=10))
#Task 3
#nchar isn't very well-behaved on big numbers so it needs help from as.character.
#If we really wanted to take care with nchar misbehaving, we could have used format.
sapply(leftFactorialVecInput(seq(1000,10000,by=1000)),function(x) nchar(as.character(x)))