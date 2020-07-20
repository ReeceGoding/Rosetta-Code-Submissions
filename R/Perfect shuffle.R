#https://rosettacode.org/wiki/Perfect_shuffle
#Context: Below.

##Sequence solution
#The previous solution exploits R's matrix construction; This solution exploits its array indexing.

#A strict reading of the task description says that we need a function that does exactly one shuffle.
pShuffle<-function(deck)
{
  n<-length(deck)#Assumed even (as in task description).
  new<-array(n)#Maybe not as general as it could be, but the task said to use whatever was convenient.
  new[seq(from=1,to=n,by=2)]<-deck[seq(from=1,to=n/2,by=1)]
  new[seq(from=2,to=n,by=2)]<-deck[seq(from=1+n/2,to=n,by=1)]
  new
}

task2<-function(deck)
{
  new<-deck
  count<-0
  repeat
  {
    new<-pShuffle(new)
    count<-count+1
    if(all(new==deck)){break}
  }
  cat("It takes",count,"shuffles of a deck of size",length(deck),"to return to the original deck.","\n")
  invisible(count)#For the unit tests. The task wanted this printed so we only return it invisibly.
}

#Tests - All done in one line.
mapply(function(x,y) task2(1:x)==y,c(8,24,52,100,1020,1024,10000),c(3,11,8,30,1018,10,300))