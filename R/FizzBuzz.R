#https://rosettacode.org/wiki/FizzBuzz
#Context: Below. I adapted my General FizzBuzz solution to a normal FizzBuzz solution.
#As with the other examples in the R section, I did not wrap my solution in a function.

#Or, adapting from https://rosettacode.org/wiki/General_FizzBuzz#Names_solution :
namedNums<-c(3,5); names(namedNums)<-c("Fizz","Buzz")
for(i in 1:100)
{
  isFactor<-i %% namedNums == 0
  if(any(isFactor)){print(paste0(names(namedNums)[isFactor],collapse = ""))}else{print(i)}
}