#https://rosettacode.org/wiki/Distinct_power_numbers
#Context: Below. There was no solution in R before mine.

#This only takes one line.
unique(sort(rep(2:5, each = 4)^rep(2:5, times = 4)))