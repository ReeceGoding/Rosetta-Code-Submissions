#https://rosettacode.org/wiki/Tau_function
#Context: Below. There was no solution in R before mine.

#This only takes one line.
lengths(sapply(1:100, function(n) c(Filter(function(x) n %% x == 0, seq_len(n %/% 2)), n)))