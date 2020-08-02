#https://rosettacode.org/wiki/Sorting_algorithms/Bubble_sort
#Context: Below.

#The previously solution missed out on a cool R trick for swapping items and had no check for lists of length 1.
#As R is 1-indexed, we've aimed to be as faithful as we can to the given pseudo-code.
bubbleSort<-function(items)
{
  repeat
  {
    if((itemCount<-length(items))<=1) return(items)
    hasChanged<-FALSE
    itemCount<-itemCount-1
    for(i in 1:itemCount)
    {
      if(items[i]>items[i+1])
      {
        items[c(i,i+1)]<-items[c(i+1,i)]#The cool trick mentioned above.
        hasChanged<-TRUE  
      }
    }
    if(!hasChanged) break
  }
  items
}

#Examples taken from the Haxe solution.
ints<-c(1,10,2,5,-1,5,-19,4,23,0)
numerics<-c(1,-3.2,5.2,10.8,-5.7,7.3,3.5,0,-4.1,-9.5)
strings<-c("We","hold","these","truths","to","be","self-evident","that","all","men","are","created","equal")
#Output
bubbleSort(ints)
bubbleSort(numerics)
bubbleSort(strings)