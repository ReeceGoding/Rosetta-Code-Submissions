#https://rosettacode.org/wiki/Cumulative_standard_deviation
#Context: The task's requirements are debated on the talk page, so I gave three solutions.

##Solution 1: ""Running" SD"
#If we desire a solution that gives every "running" standard deviation for each input,
#rather than only giving one number as our final output, we can do the following.
#To make this differ from previous solutions, we will not have our code make any mention
#of missing values, and we will show off R's Reduce and sapply.

#Once again, we have to make a standard deviation function from scratch.
biasedSd <- function(data) sqrt(mean((data - mean(data))^2))
cumSd <- function(data) sapply(Reduce(c, data, accumulate = TRUE), biasedSd)

cumSd(c(2, 4, 4, 4, 5, 5, 7, 9))
#Output: [1] 0.0000000 1.0000000 0.9428090 0.8660254 0.9797959 1.0000000 1.3997084 2.0000000

##Solution 2: "Stateful solution"
#If we want a function that remembers and uses the previous inputs, letting us be very strict about
#the "one at a time" requirement, then we can lift biasedSd from the previous solution and make good
#use of the distinction between R's <- and <<- methods of assignment. 
cumSDStateful <- function()
{
  data <- numeric(0)
  function(oneNumber)
  {
    data <<- c(data, oneNumber)
    biasedSd(data)
  }
}
state <- cumSDStateful()
state(2);state(4);state(4);state(4);state(5);state(5);state(7);state(9)

##Solution 3: "Environment solution"
#R gives us some control over what environment expressions are evaluated in.
#This lets us shorten the previous solution and get identical output.
localCumSD <- local({
data <- numeric(0)
function(oneNumber)
{
  data <<- c(data, oneNumber)
  biasedSd(data)#Again, lifted from the ""Running" SD" solution.
}
})
localCumSD(2);localCumSD(4);localCumSD(4);localCumSD(4);localCumSD(5);localCumSD(5);localCumSD(7);localCumSD(9)