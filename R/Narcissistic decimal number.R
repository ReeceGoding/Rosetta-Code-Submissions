#https://rosettacode.org/wiki/Narcissistic_decimal_number
#Context: Given below.

#As with the previous solution, this is rather slow. Regardless, we have made the following improvements:
#*This solution allows us to control how many Armstrong numbers we generate.
#*Rather than using a for loop that assumes that we will be done by the 10000000th case, we use a while loop.
#*Rather than using nchar or as.character, which both misbehave if the inputs are large enough for R to default to scientific notation, we use format.
#*We exploit many of R's vectorized functions, letting us avoid using any for loops.
#*As we are using format anyway, we take the chance to make the output look nicer.
generateArmstrong <- function(howMany)
{
  resultCount <- i <- 0
  while(resultCount < howMany)
  {
    #The next line looks terrible, but I know of no better way to convert a large integer in to its digits in R.
    digits <- as.integer(unlist(strsplit(format(i, scientific = FALSE), "")))
    if(i == sum(digits^(length(digits)))) cat("Armstrong number ", resultCount <- resultCount + 1, ": ", format(i, big.mark = ","), "\n", sep = "")
    i <- i + 1
  } 
}
generateArmstrong(25)