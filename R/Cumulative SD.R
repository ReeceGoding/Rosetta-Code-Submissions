#https://rosettacode.org/wiki/Cumulative_standard_deviation

#If we desire a solution that gives every "running" standard deviation for each input,
#rather than only giving one number as our final output, we can do the following.
#To make this differ from previous solutions, we will not have our code make any mention
#of missing values, and we will show off R's Reduce and sapply.

#R's sd function uses the correction,
#so we have to build an sd function
#from scratch
biasedSd<-function(data)#Once again, we have to make a standard deviation function from scratch.
{
  sqrt(mean((data-mean(data))^2))
}

cumSd<-function(data)
{
  sapply(Reduce(c,data,accumulate = T), biasedSd)
}

cumSd(c(2, 4, 4, 4, 5, 5, 7, 9))
#Output: [1] 0.0000000 1.0000000 0.9428090 0.8660254 0.9797959 1.0000000 1.3997084 2.0000000