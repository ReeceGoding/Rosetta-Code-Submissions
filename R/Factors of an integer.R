#https://rosettacode.org/wiki/Factors_of_an_integer
#Context: Below. I considered the previous solution unidiomatic.

##Filter solution
#With identical output, a more idiomatic way is to use R's Filter. 
factors <- function(n) c(Filter(function(x) n %% x == 0, seq_len(n %/% 2)), n)
#Vectorize is an interesting alternative to the previous solution's lapply.
manyFactors <- function(vec) Vectorize(factors)(vec)