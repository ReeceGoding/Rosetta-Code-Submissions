#https://rosettacode.org/wiki/Hailstone_sequence

###Task 1:
collatz<-function(n)
{
  output<-c(n)
  lastEntry<-output[1]
  while(lastEntry!=1)
  {
    if(lastEntry%%2==0){output<-c(output,lastEntry%/%2)}
    else{output<-c(output,3*lastEntry+1)}
    lastEntry<-output[length(output)]
  }
  output
}

###Task 2:
#Notice how easy it is to access the required elements:
twentySeven<-collatz(27)
cat("The first four elements are:", twentySeven[1:4],"and the last four are:", twentySeven[length(twentySeven)-3:0])

###Task 3:
#Notice how a several line long loop can be avoided with R's sapply or Vectorize:
seqLenghts<-sapply(1:99999,function(x) length(collatz(x)))
longest<-which.max(seqLenghts)
print(paste0("The longest sequence before the 100000th is found at n=",longest,". It has length ",seqLenghts[longest],"."))
#Equivalently, line 1 could have been: seqLenghts<-sapply(Vectorize(collatz)(1:99999),length)