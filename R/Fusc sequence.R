#https://rosettacode.org/wiki/Fusc_sequence
#Context: There was no solution in R before mine.

#I believe that this code demonstrates a great truth of R: It is amazing with numbers, but terrible with strings.
#There is really no good reason why checking how long a number is and printing it nicely should be hardest parts of this task.

#Our first step is to adapt the 0-indexed definition to our 1-indexed language, letting us complete the first task.
firstNFuscNumbers <- function(n)
{
  stopifnot(n > 0)
  if(n == 1) return(0) else fusc <- c(0, 1)
  if(n > 2)
  {
    for(i in seq(from = 3, to = n, by = 1))
    {
      fusc[i] <- if(i %% 2) fusc[(i + 1) / 2] else fusc[i / 2] + fusc[(i + 2) / 2]
    }
  }
  fusc
}
first61 <- firstNFuscNumbers(61)
cat("The first 61 Fusc numbers are:", "\n", first61, "\n")
#The second task's requirements are somewhat strange. It asks for '''the''' number, implying that there is only one, but it is clear that there are several.
#If we only want the first such number, then the task is trivial. As we have already seen it in the n=61 output, we don't even have to be smart.
#Indeed, if we were being smart, we'd say that the answer was trivial: 0 at index 1.
#A proper solution that only gives one non-trivial result is as follows:
index <- which.max(nchar(first61) == 2)
number <- first61[index]
cat("The first fusc number that is longer than all previous fusc numbers is", number,
    "and it occurs at index", index, "\n")
#Regardless, as many of the other solutions have displayed many such numbers (e.g. the 6 digit case), we will do the same.
#This complicates matters in some unexpected ways. For example, nchar misbehaves once its inputs get large enough for R to default to scientific notation.
#One nice solution is to use format, which also allows us to add the required commas:
twentyMillion <- firstNFuscNumbers(2 * 10^7)
twentyMillionCountable <- format(twentyMillion, scientific = FALSE, trim = TRUE)
indices <- sapply(2:6, function(x) which.max(nchar(twentyMillionCountable) == x))
numbers <- twentyMillion[indices]
cat("Some fusc numbers that are longer than all previous fusc numbers are:\n",
    paste0(format(twentyMillion[indices], scientific = FALSE, trim = TRUE, big.mark = ","),
          " (at index ", format(indices, trim = TRUE, big.mark = ","), ")\n"))