#https://rosettacode.org/wiki/Fusc_sequence
#Context: There was no solution before mine.

#I believe that this code demonstrates a great truth of R: It is amazing with numbers, but terrible with strings.
#There is really no good reason why checking how long a number is and printing it nicely should be hardest parts of this task.

#Our first step is to adapt the 0-indexed definition to our 1-indexed language, letting us complete the first task.
firstNPlus1FuscNumbers<-function(n)
{
  if(n==0){return(0)}else{fusc<-c(0,1)}
  for(i in (2+seq_len(n-1)))
  {
    if(i %% 2 == 0){fusc[i]<-fusc[i/2]+fusc[(i+2)/2]}
    else{fusc[i]<-fusc[(i+1)/2]}
  }
  fusc
}
first61<-firstNPlus1FuscNumbers(60)
print(first61)
#The second task's requirements are somewhat strange. It asks for '''the''' number, implying that there is only one, but it is clear that there are several.
#If we only want the first such number, then the task is trivial. As we have already seen it in the n=60 output, we don't even have to be smart.
#Indeed, if we were being smart, we'd say that the answer was trivial: 0 at index 1.
#A proper solution that only gives one non-trivial result is as follows:
index<-which(nchar(first61)==2)[1]
number<-first61[index]
cat("The first fusc number that is longer than all previous fusc numbers is",number,
    "and it occurs at index",index)
#Regardless, as many of the other solutions have displayed many such numbers (e.g. the 6 digit case), we will do the same.
#This complicates matters in some unexpected ways. For example, nchar misbehaves once its inputs get large enough for R to default to scientific notation.
#One nice solution is to use format, which also allows us to add the required commas:
twentyMillion<-firstNPlus1FuscNumbers(2*10^7-1)
twentyMillionCountable<-format(twentyMillion,scientific = FALSE,trim = TRUE)
indices<-sapply(2:6, function(x) (which(nchar(twentyMillionCountable)==x))[1])
numbers<-twentyMillion[indices]
cat("Some fusc numbers that are longer than all previous fusc numbers are:\n",
    paste0(format(twentyMillion[indices],scientific = FALSE,trim = TRUE,big.mark = ","),
          " (at index ",format(indices,trim = TRUE,big.mark = ","),")\n"))