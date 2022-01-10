#https://rosettacode.org/wiki/Matrix-exponentiation_operator
#Context: There was a solution in R before this, but it used a function call.
#The task's description implies that an infix operator would be more fitting, so I contributed this.

##Infix operator
#The task wants the implementation to be "as an operator". Given that R lets us define new infix operators,
#it seems fitting to show how to do this. Ideally, for a matrix a and int n, we'd want to be able to use a^n.
#R actually has this already, but it's not what the task wants:
a <- matrix(c(1, 2, 3, 4), 2, 2)
a^1
a^2
#As we can see, it instead returns the given matrix with its elements raised to the nth power.
#Overwriting the ^ operator would be dangerous and rude. However, R's base library suggests an alternative.
#%*% is already defined as matrix multiplication, so why not use %^% for exponentiation?
`%^%` <- function(mat, n)
{
  is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol#See the docs for is.integer
  if(is.matrix(mat) && is.numeric(n) && is.wholenumber(n))
  {
    if(n==0) diag(nrow = nrow(mat))#Identity matrix of mat's dimensions
    else if(n == 1) mat
    else if(n > 1) mat %*% (mat %^% (n - 1))
    else stop("Invalid n.")
  }
  else stop("Invalid input type.")
}
#For output:
a %^% 0
a %^% 1
a %^% 2
a %*% a %*% a#Base R's equivalent of a %^% 3
a %^% 3
nonSquareMatrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
nonSquareMatrix %^% 1
nonSquareMatrix %^% 2#R's %*% will throw the error for us
#Our code is far from efficient and could do with more error-checking, but it demonstrates the principle.
#If we wanted to do this properly, we'd use a library - ideally one that calls C code.
#Following the previous submission's example, we can just do this:
library(Biodem)
`%^%` <- function(mat, n) Biodem::mtx.exp(mat, n)
#And it will work just the same, except for being much faster and throwing an error on nonSquareMatrix %^%1 .