#https://rosettacode.org/wiki/Sorting_algorithms/Gnome_sort
#Context: Below.

#The previously solution misses out on a cool R trick for swapping items.
#As R is 1-indexed, we need to make some minor adjustments to the given pseudo-code.
#To give some variety and to remove the previous solution's potentially redundant first run, we have chosen a different adjustment to the previous solution's.
#We have otherwise aimed to be faithful to the pseudo-code.
gnomeSort<-function(a)
{
  i<-2
  j<-3
  while(i<=length(a))
  {
    if(a[i-1]<=a[i])
    {
      i<-j
      j<-j+1 
    }
    else
    {
      a[c(i-1,i)]<-a[c(i,i-1)]#The cool trick mentioned above.
      i<-i-1
      if(i==1)
      {
        i<-j
        j<-j+1
      }
    }
  }
  a
}
#Examples taken from the Haxe solution.
#Note that R can use <= to compare strings.
ints<-c(1,10,2,5,-1,5,-19,4,23,0)
numerics<-c(1,-3.2,5.2,10.8,-5.7,7.3,3.5,0,-4.1,-9.5)
strings<-c("We","hold","these","truths","to","be","self-evident","that","all","men","are","created","equal")
#Output
gnomeSort(ints)
gnomeSort(numerics)
gnomeSort(strings)