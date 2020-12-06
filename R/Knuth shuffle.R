#https://rosettacode.org/wiki/Knuth_shuffle
#Context: There were other solutions before mine, but none as short.

#After accounting for R being 1-indexed rather than 0-indexed,
#it's not hard to implement the pseudo-code given in the task almost exactly:
knuth<-function(vec)
{
  last<-length(vec)
  if(last<2){return(vec)}
  else for(i in last:2)
  {
    j<-sample(1:i,1)
    vec[c(i,j)]<-vec[c(j,i)]
  }
  vec
}
#Demonstration:
knuth(integer(0))
knuth(c(10))
replicate(10,knuth(c(10,20)))
replicate(10,knuth(c(10,20,30)))
knuth(c("Also","works","for","strings"))