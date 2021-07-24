#https://rosettacode.org/wiki/Combinations_with_repetitions
#Context: Below. There was no solution in R before mine.

#The idiomatic solution is to just use a library.
library(gtools)
combinations(3, 2, c("iced", "jam", "plain"), set = FALSE, repeats.allowed = TRUE)
nrow(combinations(10, 3, repeats.allowed = TRUE))