#https://rosettacode.org/wiki/Harmonic_series
#Context: Below. There was no solution in R before mine.

##Direct Summation
#The talk page helpfully points out that we can be remarkably lazy here.
HofN <- function(n) sum(1/seq_len(n)) #Task 1
H <- sapply(1:100000, HofN)
print(H[1:20]) #Task 2
print(sapply(1:10, function(x) which.max(H > x))) #Task 3 and stretch

##Cumulative Sums
#As for doing this properly, R provides a handy cumsum function.
firstNHarmonicNumbers <- function(n) cumsum(1/seq_len(n)) #Task 1
H <- firstNHarmonicNumbers(100000) #Runs stunningly quick
print(H[1:20]) #Task 2
print(sapply(1:10, function(x) which.max(H > x))) #Task 3 and stretch