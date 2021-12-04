#https://rosettacode.org/wiki/Sailors,_coconuts_and_a_monkey_problem
#Context: Below. There was no solution in R before mine.

#The only tricky bit is reading comprehension.
#For example, it's easy to miss that the coconut count after the final
#nighttime visit must be strictly positive and divisible by the number of sailors.
coconutsProblem <- function(sailorCount)
{
  stopifnot(sailorCount > 1) #Problem makes no sense otherwise
  initalCoconutCount <- sailorCount
  repeat
  {
    initalCoconutCount <- initalCoconutCount + 1
    coconutCount <- initalCoconutCount
    for(i in seq_len(sailorCount))
    {
      if(coconutCount %% sailorCount != 1) break
      coconutCount <- (coconutCount - 1) * (sailorCount - 1)/sailorCount
      if(i == sailorCount && coconutCount > 0 && coconutCount %% sailorCount == 0) return(initalCoconutCount)
    }
  }
}
print(data.frame("Sailors" = 2:8, "Coconuts" = sapply(2:8, coconutsProblem)))