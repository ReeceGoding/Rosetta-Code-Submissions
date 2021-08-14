#https://rosettacode.org/wiki/Comma_quibbling
#Context: There was no solution in R before mine.

quib <- function(vect)
{
  #The task does not consider empty strings to be words, so we remove them immediately.
  #We could also remove non-upper-case characters, but the tasks gives off the impression that the user will do that.
  vect <- vect[!nchar(vect) == 0]
  len <- length(vect)
  if(len == 0) return("{}")
  result <- switch(len,
                   paste0("{", vect, "}"),
                   paste0("{", vect[1], " and ", vect[2], "}"))
  #R's switch for numerics doesn't support default cases, so this next line cannot go in the switch.
  if(is.null(result)) paste0("{", paste0(vect[seq_len(len-1)], collapse = ", "), " and ", vect[len], "}") else result
}
quib(character(0)) #R has several types of empty string, e.g. character(0), "", and c("", "", "").
quib("")
quib(" ")
quib(c("", ""))
quib(rep("", 10))
quib("ABC")
quib(c("ABC", ""))
quib(c("ABC", "DEF"))
quib(c("ABC", "DEF", "G", "H"))
quib(c("ABC", "DEF", "G", "H", "I", "J", ""))