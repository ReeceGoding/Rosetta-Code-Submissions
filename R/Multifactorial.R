#https://rosettacode.org/wiki/Multifactorial
#Context: The site's other solution skipped a task and didn't show off much of R's capability.

##Sequence solution
#This task doesn't use big enough numbers to need efficient code, so R can solve this very succinctly. 
mfact<-function(n,deg){prod(seq(from = n, to = 1, by = -deg))}
outer(1:10,1:5,Vectorize(mfact))

#If we really insist on a pretty table, then we can add some names and transpose the output.
mfact<-function(n,deg){prod(seq(from = n, to = 1, by = -deg))}
n<-1:10; names(n)<-n
deg<-1:5; names(deg)<-paste("Degree",deg)
t(outer(n,deg,Vectorize(mfact)))