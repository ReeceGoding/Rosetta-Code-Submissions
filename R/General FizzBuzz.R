#https://rosettacode.org/wiki/General_FizzBuzz
#Context: Below. There was no solution in R before mine.

##... solution
#The task asks that we assume 3 factors for the sake of simplicity.
#However, R makes the k factors case not much more complicated, so we will do that.
#The only major downside is that checking for malformed user input becomes so difficult that we will not bother.
genFizzBuzz <- function(n, ...)
{
  args <- list(...)
  #R doesn't like vectors of mixed types, so c(3, "Fizz") is coerced to c("3", "Fizz"). We must undo this.
  #Treating "[[" as if it is a function is a bit of R's magic. You can treat it like a function because it actually is one.
  factors <- as.integer(sapply(args, "[[", 1)) 
  words <- sapply(args, "[[", 2)
  sortedPermutation <- sort.list(factors)#Required by the task: We must go from least factor to greatest.
  factors <- factors[sortedPermutation]
  words <- words[sortedPermutation]
  for(i in 1:n)
  {
    isFactor <- i %% factors == 0
    print(if(any(isFactor)) paste0(words[isFactor], collapse = "") else i)
  }
}
genFizzBuzz(105, c(3, "Fizz"), c(5, "Buzz"), c(7, "Baxx"))
genFizzBuzz(105, c(5, "Buzz"), c(9, "Prax"), c(3, "Fizz"), c(7, "Baxx"))

##Names solution
#If we deviate from the task's example of how to input parameters and
#instead use R's names facilities to make our (number, name) pairs, we get a much cleaner solution.
namedGenFizzBuzz <- function(n, namedNums)
{
  factors <- sort(namedNums)#Required by the task: We must go from least factor to greatest.
  for(i in 1:n)
  {
    isFactor <- i %% factors == 0
    print(if(any(isFactor)) paste0(names(factors)[isFactor], collapse = "") else i)
  }
}
namedNums <- c(Fizz=3, Buzz=5, Baxx=7)#Notice that we can name our inputs without a function call.
namedGenFizzBuzz(105, namedNums)
shuffledNamedNums <- c(Buzz=5, Prax=9, Fizz=3, Baxx=7)
namedGenFizzBuzz(105, shuffledNamedNums)