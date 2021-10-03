#https://rosettacode.org/wiki/Product_of_divisors
#Context: Below. There was no solution in R before mine.

#This only takes one line.
sapply(1:50, function(n) prod(c(Filter(function(x) n %% x == 0, seq_len(n %/% 2)), n)))