#https://rosettacode.org/wiki/Metaprogramming
#Context: Below. There was no solution in R before mine.

#R does not have much to offer in this regard.
#It has generic functions, but they're little more than the forbidden option of operator overloading.
#We equally cannot use any eval tricks, because the task has also forbidden those.
#As for macros, although R is inspired by Scheme, it has nothing of the sort.
#For example, see the admitted cheating in https://rosettacode.org/wiki/Extend_your_language#R

#As for the permitted things that R does have, it makes it very easy to define new infix operators.
#We have shown one such example at https://rosettacode.org/wiki/Matrix-exponentiation_operator#Infix_operator
#To my knowledge, this is only documented in 'An Introduction to R', section 10.2.
#https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Defining-new-binary-operators
#As for doing this ourselves, we will implement a version of the "nCk" syntax that some calculators
#use for "n choose k", i.e. the binomial coefficient:
'%C%' <- function(n, k) choose(n, k)
5 %C% 2 #Outputs 10.