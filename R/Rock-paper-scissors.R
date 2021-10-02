#https://rosettacode.org/wiki/Rock-paper-scissors
#Context: There was no solution in R before mine.

#This milks R's vectorisation quite heavily.
#However, this approach doesn't generalise well to the extra credit task.
#In particular, the last two lines of the loop would need a lot of work to be both non-ugly and working.
play <- function()
{
  bias <- c(r = 1, p = 1, s = 1)
  repeat
  {
    playerChoice <- readline(prompt = "Rock (r), Paper (p), Scissors (s), or Quit (q)? ")
    if(playerChoice == "q") break
    rps <- c(Rock = "r", Paper = "p", Scissors = "s")
    if(!playerChoice %in% rps) next
    compChoice <- sample(rps, 1, prob = bias / sum(bias))
    cat("I choose", names(compChoice), "\n",
        c("We draw!", "I win!", "I lose!")[1 + (which(compChoice == rps) - which(playerChoice == rps)) %% 3], "\n")
    bias <- bias + (playerChoice == c("s", "r", "p"))
  }
}
play()