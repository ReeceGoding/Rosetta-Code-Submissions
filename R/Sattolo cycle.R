#https://rosettacode.org/wiki/Sattolo_cycle
#Context: Below. There was no solution before mine.

#Basically identical to https://rosettacode.org/wiki/Knuth_shuffle#Short_version
#We've only changed an i to an i-1, changed the function names, and added the [11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22] test.
sattolo<-function(vec)
{
  last<-length(vec)
  if(last<2){return(vec)}
  else for(i in last:2)
  {
    j<-sample(1:(i-1),1)
    vec[c(i,j)]<-vec[c(j,i)]
  }
  vec
}
#Demonstration:
sattolo(integer(0))
sattolo(c(10))
replicate(10,sattolo(c(10,20)))
replicate(10,sattolo(c(10,20,30)))
sattolo(c(11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22))
sattolo(c("Also","works","for","strings"))