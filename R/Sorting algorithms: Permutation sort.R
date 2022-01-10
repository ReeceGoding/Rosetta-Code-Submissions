#https://rosettacode.org/wiki/Sorting_algorithms/Permutation_sort
#Context: The other existing solution used a library. I thought that RcppAlgos could do it better.

#RcppAlgos lets us do this at the speed of C++ and with some very short code.
#The while loop with no body strikes me as poor taste, but I know of no better way.
library(RcppAlgos)
permuSort <- function(list)
{
  iter <- permuteIter(list)
  while(is.unsorted(iter$nextIter())){}#iter$nextIter advances iter to the next iteration and returns it.
  iter$currIter()
}

#Output
test <- sample(10)
print(test)
permuSort(test)

#An alternative solution would be to replace the while loop with the following:
##repeat
##{
##  if(!is.unsorted(iter$nextIter())) break
##}
#This seems more explicit than the empty while loop, but also more complex.