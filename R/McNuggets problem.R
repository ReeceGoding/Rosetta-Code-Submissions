#https://rosettacode.org/wiki/McNuggets_problem
#Context: There was no solution before mine.

#Assuming that the natural numbers start at 0.
#There are two natural approaches. The first is to generate all valid x, y, and z and then apply the function:
allInputs<-expand.grid(x=0:(100%/%6),y=0:(100%/%9),z=0:(100%/%20))
mcNuggets<-do.call(function(x,y,z) 6*x + 9*y + 20*z, allInputs)
#The second is to find all of the valid 6x, 9y, and 20z, and then sum them:
mcNuggets2<-rowSums(expand.grid(seq(0,100,6),seq(0,100,9),seq(0,100,20)))
#Either way, we get identical results, as checked by:
all(mcNuggets==mcNuggets2)
#For our final answer, note that our choice to remove values from the vector 0:100 means our outputs will already be sorted.
results<-setdiff(0:100,mcNuggets[which(mcNuggets<=100)])
cat("The non-McNuggets numbers that are no greater than 100 are:",results,"\nThe largest is",max(results),"\n")