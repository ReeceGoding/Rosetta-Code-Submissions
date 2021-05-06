#https://rosettacode.org/wiki/Exponentiation_order
#Context: Below. There was no solution in R before mine.
#I wish that I had just done it the lazy way.

#The 'Operator Syntax and Precedence' documentation tells us that
#"^" is "exponentiation (right to left)". The 'Arithmetic Operators' documentation also
#tells us that the parser translates "**" to "^", but its depreciation status is complicated.

#It turns out that the parser is so blind to "**" that we cannot even quote it.
#The following are identical:
print(quote(5**3))
print(quote(5^3))

#Another method is to use "^" as if it is an ordinary function of two arguments.
#It appears that "**" does not support this.
#As there is no potential for ambiguity in the operator precedence, we will not
#print this result below. For example:
'^'('^'(5, 3), 2)
#is clearly (5^3)^2 i.e. 15625, whereas
'^'(5, '^'(3, 2))
#is clearly 5^(3^2) i.e. 1953125.

#As for actually solving the task, the requirement that each output be on a new
#line causes us a surprising amount of difficulty.
#To avoid repeating ourselves, we must almost resort to metaprogramming:
inputs<-alist(5^3^2, (5^3)^2, 5^(3^2), 5**3**2, (5**3)**2, 5**(3**2))
invisible(sapply(inputs, function(x) cat(deparse(x), "returns: ", eval(x), "\n")))

#Alternatively, we could print out a matrix or data frame:
print(matrix(sapply(inputs, eval), dimnames = list(inputs, "Outputs")))
print(data.frame(Inputs=sapply(inputs, deparse), Outputs=sapply(inputs, eval)))