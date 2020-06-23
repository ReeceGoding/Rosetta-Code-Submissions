#https://rosettacode.org/wiki/Loops/Increment_loop_index_within_loop_body
#Context: There was no solution before mine.

#R cannot complete this task with a for loop. See https://stackoverflow.com/a/5913329/10319707
#Instead, we must go down the same path as the Kotlin solution.
#Because it is sufficient for numbers this small, we will save ourselves some work and use the gmp library's
#isprime function for checking if a number is prime.
i<-42
primeCount<-0
while(primeCount<42)
{
  if(gmp::isprime(i)==2)#1 means "probably prime" and won't come up for numbers this small, 2 is what we want.
  {
    primeCount<-primeCount+1
    extraCredit<-format(i, big.mark=",", scientific=FALSE)
    cat("Prime count:",paste0(primeCount,";"),"The prime just found was:",extraCredit,"\n")
    i<-i+i#This is missing the -1 from the Kotlin solution. There is no need to check i+i (it's even).
  }
  i<-i+1
}