#https://rosettacode.org/wiki/Modified_random_distribution
#Context: Below. There was no solution in R before mine.
#In fact, there was less than 15 solutions in total.

#Although it may not be immediately obvious, both modifier and gen
#are equivalent to the corresponding functions in the task.
library(NostalgiR) #For the textual histogram.
modifier <- function(x) 2*abs(x - 0.5)
gen <- function()
{
  repeat
  {
    random <- runif(2)
    if(random[2] < modifier(random[1])) return(random[1])
  } 
}
data <- replicate(100000, gen())
NostalgiR::nos.hist(data, breaks = 20, pch = "#")