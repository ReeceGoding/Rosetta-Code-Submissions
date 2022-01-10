#https://rosettacode.org/wiki/Josephus_problem
#Context: The site's other solution only makes sense if you really know your mathematics.
#After making a big post on the talk page (https://rosettacode.org/wiki/Talk:Josephus_problem#Categorisation_of_solutions )
#and trying and failing to find a natural R solution to this, I adapted the Lua one
#and did my best to explain why R struggles here.

##Iterative solution
#I hope to be proven wrong, but R seems to be the wrong tool for this problem:
#*It is 1-indexed, meaning that we will have a tough time using most solutions that exploit modular arithmetic.
#*It lacks any concept of a linked list, meaning that we can't take a circular list approach.
#*The idiomatic way to roll an array in R (e.g. as the Ruby solution has) is to exploit the head and tail functions,
#but those break if we are rolling by more than the length of the array
#(see https://stackoverflow.com/q/18791212/ for a few tricks for this).
#Regardless, it is still solvable. The following adapts a great deal of the Lua solution.
#The arguments n, k, and m are as in the task description.
josephusProblem <- function(n, k, m)
{
  prisoners <- 0:(n - 1)
  exPos <- countToK <- 1
  dead <- integer(0)
  while(length(prisoners) > m)
  {
    if(countToK == k)
    {
      dead <- c(dead, prisoners[exPos])
      prisoners <- prisoners[-exPos]
      exPos <- exPos - 1
    }
    exPos <- exPos + 1
    countToK <- countToK + 1
  if(exPos > length(prisoners)) exPos <- 1
  if(countToK > k) countToK <- 1
  }
  print(paste0("Execution order: ", paste0(dead, collapse = ", "), "."))
  paste0("Survivors: ", paste0(prisoners, collapse = ", "), ".")
}
josephusProblem(5, 2, 1)
josephusProblem(41, 3, 1)
josephusProblem(41, 3, 3)