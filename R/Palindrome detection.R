#Context: I had a smart full solution, but it had a bug that stopped it from solving an extra-credit part.
#I submitted this partial solution because none of the other solutions used "rev", despite it being perfect for this.
#In fact, none of the current R solutions appear to be full ones. Even in other languages, full solutions are rare.

##Rev
#R has a built-in function for reversing vectors, so we only have to coerce our input in to the proper form.
#Unicode is supported, but this ignores the "inexact palindromes" extra credit requirement because,
#without some sort of regex, supporting Unicode while stripping punctuation and white space is hard in R.
is.Palindrome<-function(string)
{
  characters<-unlist(strsplit(string,""))
  all(characters==rev(characters))
}