#https://rosettacode.org/wiki/Nested_function
#Context: None needed. This is surprisingly short. There was no solution in R before mine.

#This also shows that cat's sep argument is not the same as MakeList's.
MakeList <- function(sep)
{
  counter <- 0
  MakeItem <- function() paste0(counter <<- counter + 1, sep, c("first", "second", "third")[counter])
  cat(replicate(3, MakeItem()), sep = "\n")
}
MakeList(". ")