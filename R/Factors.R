#https://rosettacode.org/wiki/Factors_of_an_integer

factors<-function(n)
{
  allButN<-Filter(function(x) n %% x == 0, 1:(n%/%2))
  union(allButN,n)
}

#If you want to use a vector of integers as an input, as in the previous solution, use:
manyFactors<-function(vec){Vectorize(factors)(vec)}