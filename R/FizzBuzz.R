#https://rosettacode.org/wiki/FizzBuzz
#Context: Below. The first is an adaptation of my General FizzBuzz solution to a normal FizzBuzz solution.
#The second is an update to an old esoteric solution.
#The third is an attempt to de-mystify that old solution.
#As with the other examples in the R section, I did not wrap my solutions in functions.

#Or, adapting from https://rosettacode.org/wiki/General_FizzBuzz#Names_solution :
namedNums <- c(Fizz = 3, Buzz = 5)
for(i in 1:100)
{
  isFactor <- i %% namedNums == 0
  print(if(any(isFactor)) paste0(names(namedNums)[isFactor], collapse = "") else i)
}

#Or, (ab)using the vector recycling rule:
x <- paste0(rep("", 100), c("", "", "Fizz"), c("", "", "", "", "Buzz"))
cat(ifelse(x == "", 1:100, x), sep = "\n")

#Or, for an abuse of the recycling rules that could be generalised:
x <- paste0(rep("", 100), rep(c("", "Fizz"), times = c(2, 1)), rep(c("", "Buzz"), times = c(4, 1)))
cat(ifelse(x == "", 1:100, x), sep = "\n")