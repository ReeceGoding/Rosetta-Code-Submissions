#https://rosettacode.org/wiki/Sum_of_divisors
#Context: Below. There was no solution in R before mine.

#This only takes one line.
sapply(1:100, function(n) sum(c(Filter(function(x) n %% x == 0, seq_len(n %/% 2)), n)))