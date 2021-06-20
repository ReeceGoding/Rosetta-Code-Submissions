#https://rosettacode.org/wiki/Diversity_prediction_theorem
#Context: The discussion page suggests that this task has changed at some point.
#It's easy to notice that many of the solutions do not include "the true value and the crowd estimates".
#There was no solution in R before mine.

#R's vectorisation shines here. The hardest part of this task was giving each estimate its own
#numbered column, which is little more than a printing luxury. The actual mathematics was trivial,
#with each part done in essentially one line.
diversityStats<-function(trueValue, estimates)
{
  collectivePrediction<-mean(estimates)
  data.frame("True Value" = trueValue,
             as.list(setNames(estimates, paste("Guess", seq_along(estimates)))), #Guesses, each with a title and column.
             "Average Error" = mean((trueValue-estimates)^2),
             "Crowd Error" = (trueValue-collectivePrediction)^2,
             "Prediction Diversity" = mean((estimates-collectivePrediction)^2))
}
diversityStats(49, c(48, 47, 51))
diversityStats(49, c(48, 47, 51, 42))