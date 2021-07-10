#https://rosettacode.org/wiki/Dice_game_probabilities
#Context: Below. There was no solution in R before mine.

#Solving these sorts of problems by simulation is trivial in R.
probability <- function(facesCount1, diceCount1, facesCount2, diceCount2)
{
  mean(replicate(10^6, sum(sample(facesCount1, diceCount1, replace = TRUE)) > sum(sample(facesCount2, diceCount2, replace = TRUE))))
}
cat("Player 1's probability of victory is", probability(4, 9, 6, 6),
    "in the first game and", probability(10, 5, 7, 6), "in the second.")