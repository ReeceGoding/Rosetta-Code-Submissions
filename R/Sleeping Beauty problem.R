#https://rosettacode.org/wiki/Sleeping_Beauty_problem
#Context: Below. There was no solution in R before mine.

#There's nothing complicated here.
#Pretty much every language that resembles C is going to use virtually the same solution.
beautyProblem <- function(n)
{
  wakeCount <- headCount <- 0
  for(i in seq_len(n))
  {
    wakeCount <- wakeCount + 1 
    if(sample(c("H", "T"), 1) == "H") headCount <- headCount + 1 else wakeCount <- wakeCount + 1
  }
  headCount/wakeCount
}
print(beautyProblem(10000000))