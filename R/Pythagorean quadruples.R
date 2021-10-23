#https://rosettacode.org/wiki/Pythagorean_quadruples
#Context: Below. There was no solution in R before mine.

#The best solution to this problem - using lots of for loops - is practically language agnostic.
#The R way of doing this is far less efficient, taking about 10 minutes on my machine, but
#it's the obvious way to do this in R.
squares <- d <- seq_len(2200)^2
aAndb <- outer(squares, squares, '+')
aAndb <- aAndb[upper.tri(aAndb, diag = TRUE)]
sapply(squares, function(c) d <<- setdiff(d, aAndb + c))
print(sqrt(d))