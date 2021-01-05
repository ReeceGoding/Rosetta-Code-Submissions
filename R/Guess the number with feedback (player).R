#https://rosettacode.org/wiki/Guess_the_number/With_feedback_(player)
#Context: There was no solution before mine. Sadly, every good idea that I had was also found in the Python solution.

#Can be fooled if you lie to it. For example, always reporting "h" for guessANumberPlayer(1,5) will have it guess 0.
guessANumberPlayer<-function(low,high)
{
  boundryErrorCheck(low,high)
  repeat
  {
    guess<-floor(mean(c(low,high)))
    #Invalid inputs to this switch will simply cause the repeat loop to run again, breaking nothing.
    switch(guessResult(guess),
           l = low<-guess+1,
           h = high<-guess-1,
           c = return(paste0("Your number is ",guess,"."," I win!")))
  }
}

#Copied from my solution at https://rosettacode.org/wiki/Guess_the_number/With_feedback#R
boundryErrorCheck<-function(low,high)
{
  if(!is.numeric(low)||as.integer(low)!=low){stop("Lower bound must be an integer. Try again.")}
  if(!is.numeric(high)||as.integer(high)!=high){stop("Upper bound must be an integer. Try again.")}
  if(high<low){stop("Upper bound must be strictly greater than lower bound. Try again.")}
  if(low==high){stop("This game is impossible to lose. Try again.")}
  invisible()
}

guessResult<-function(guess)
{
  readline(paste0("My guess is ",guess,". If it is too low, submit l. If it is too high, h. Otherwise, c. "))
}