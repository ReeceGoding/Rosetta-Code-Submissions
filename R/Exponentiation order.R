#https://rosettacode.org/wiki/Exponentiation_order
#Context: Below. I wish that I had just done it the lazy way.

#The 'Operator Syntax and Precedence' documentation tells us that
#"^" is "exponentiation (right to left)". The 'Arithmetic Operators' documentation also
#tells us that the parser translates "**" to "^", but its depreciation status is complicated.

#It turns out that the parser is so blind to "**" that we cannot even quote it.
#The following are identical:
print(quote(5**3))
print(quote(5^3))

#As for actually solving the task, the requirement that each output be on a new
#line causes us a surprising amount of difficulty.
#We cannot pass a new line character to print(), but cat(), which does accept them,
#does not accept quoted inputs.
#To avoid repeating ourselves, we end up having to do some frankly ridiculous metaprogramming.
inputs<-alist(5^3^2, (5^3)^2, 5^(3^2), 5**3**2, (5**3)**2, 5**(3**2))
printer<-function(i) print(paste(inputs[i], "returns: ", eval(inputs[[i]])))
invisible(sapply(seq_along(inputs), printer))