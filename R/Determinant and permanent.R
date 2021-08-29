#https://rosettacode.org/wiki/Determinant_and_permanent
#Context: There was no solution in R before mine.

#R has matrix algebra built in, so we do not need to import
#anything when calculating the determinant. However, we will
#use a library to generate the permutations of 1:n.
library(combinat)
perm <- function(A)
{
  stopifnot(is.matrix(A))
  dimensions <- dim(A)
  n <- dimensions[1]
  if(any(dimensions != n)) stop("Matrix is not square.")
  if(n < 1) stop("Matrix has a dimension of size 0.")
  sum(sapply(combinat::permn(n), function(sigma) prod(sapply(1:n, function(i) A[i, sigma[i]]))))
}

#We copy our test cases from the Python example.
testData <- list("Test 1" = rbind(c(1, 2), c(3, 4)),
                 "Test 2" = rbind(c(1, 2, 3, 4), c(4, 5, 6, 7), c(7, 8, 9, 10), c(10, 11, 12, 13)),
                 "Test 3" = rbind(c(0, 1, 2, 3, 4), c(5, 6, 7, 8, 9), c(10, 11, 12, 13, 14),
                               c(15, 16, 17, 18, 19), c(20, 21, 22, 23, 24)))
print(sapply(testData, function(x) list(Determinant = det(x), Permanent = perm(x))))