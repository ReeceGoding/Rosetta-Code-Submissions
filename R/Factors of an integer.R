#https://rosettacode.org/wiki/Factors_of_an_integer
#Context: The site's other solution uses a list. I considered this unidiomatic.

##Filter solution
#With identical output, a more idiomatic way is to use R's Filter and Vectorize: 
factors<-function(n)
{
  allButN<-Filter(function(x) n %% x == 0, 1:(n%/%2))
  union(allButN,n)#We use union rather than the c() to prevent factors(1) from returning 1 twice.
}

#If you want to use a vector of integers as an input, as in the previous solution, use:
manyFactors<-function(vec){Vectorize(factors)(vec)}