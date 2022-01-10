#https://rosettacode.org/wiki/Multifactorial
#Context: The site's other solution skipped a task and didn't show off much of R's capability.

##Sequence solution
#This task doesn't use big enough numbers to need efficient code, so R can solve this very succinctly. 
mFact <- function(n, deg) prod(seq(from = n, to = 1, by = -deg))
cat("Simple version:\n")
print(outer(1:10, 1:5, Vectorize(mFact)))

#If we really insist on a pretty table, then we can add some names and transpose the output.
mFact <- function(n, deg) prod(seq(from = n, to = 1, by = -deg))
cat("Pretty version:\n")
print(t(outer(setNames(1:10, 1:10), setNames(1:5, paste0("Degree ", 1:5, ":")), Vectorize(mFact))))