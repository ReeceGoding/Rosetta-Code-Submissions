#https://rosettacode.org/wiki/Proper_divisors

#Task 1
#Has no input error checking.
properDivisors<-function(n)
{
  if(n==1)(NULL)#This seems like bad code, but task 2 demands some output for n=1, which has no proper divisors.
  else(Filter(function(x) n %% x == 0, 1:(n%/%2)))
}

#Task 2
#The output could be put in to a cleaner form than a list, but this is the idiomatic way.
Vectorize(properDivisors)(1:10)

#Task 3
#Although there are two, the task only asks for one suitable number so that is all we give.
#Similarly, we have seen no need to make sure that "divisors" is only a plural when it should be.
#Be aware that this solution uses both length and lengths. It would not work if the index of the
#desired number was not also the number itself. However, this is always the case.
mostProperDivisors<-function(N)
{
  divisorList<-Vectorize(properDivisors)(1:N)
  numberWithMostDivisors<-which.max(lengths(divisorList))
  return(paste0("The number with the most proper divisors between 1 and ",N,
                " is ",numberWithMostDivisors,
                ". It has ",length(divisorList[[numberWithMostDivisors]])," proper divisors.")) 
}
mostProperDivisors(20000)