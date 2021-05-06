#https://rosettacode.org/wiki/Exponentiation_with_infix_operators_in_(or_operating_on)_the_base
#Context: There was no solution in R before mine.
#The only oddity here is using many lines to call the data.frame function.
#This was done because it is by far the most complicated part of this simple code.

expressions <- alist(-x ^ p, -(x) ^ p, (-x) ^ p, -(x ^ p))
x <- c(-5, -5, 5, 5)
p <- c(2, 3, 2, 3)
output <- data.frame(x,
                     p,
                     setNames(lapply(expressions, eval), sapply(expressions, deparse)),
                     check.names = FALSE)
print(output, row.names = FALSE)