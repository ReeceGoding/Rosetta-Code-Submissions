#https://rosettacode.org/wiki/Barnsley_fern
#Context: The site's other solution uses linear algebra.

##'Obvious' solution
#The matrix solution above is a clever approach, but the following solution is more readable
#if you're unfamiliar with linear algebra. This is very much a blind "just do what the task says"
#solution. It's so simple that it probably runs unadapted in S. I suspect that there is room for
#an interesting use of R's ifelse function somewhere, but I couldn't find a clean way.
fernOfNPoints<-function(n)
{
  currentX<-currentY<-newX<-newY<-0
  plot(0,0,xlim=c(-2,3),ylim=c(0,10),xlab="",ylab="",pch=20,col="darkgreen",cex=0.1)
  f1<-function()#ran 1% of the time
  {
    newX<<-0
    newY<<-0.16*currentY
  }
  f2<-function()#ran 85% of the time
  {
    newX<<-0.85*newX+0.04*newY
    newY<<--0.04*newX+0.85*newY+1.6#<<-- is not an error, R's assignment is just that ugly sometimes.
  }
  f3<-function()#ran 7% of the time
  {
    newX<<-0.2*newX-0.26*newY
    newY<<-0.23*newX+0.22*newY+1.6
  }
  f4<-function()#ran 7% of the time
  {
    newX<<--0.15*newX+0.28*newY
    newY<<-0.26*newX+0.24*newY+0.44
  }
  for(i in 2:n)#We've already plotted (0,0), so we can skip one run.
  {
    case<-runif(1)
    if(case<=0.01)f1()
    else if(case<=0.86)f2()
    else if(case<=0.93)f3()
    else f4()
    points(newX,newY,pch=20,col="darkgreen",cex=0.1)
  }
  return(invisible())
}
#To plot the fern, use:
fernOfNPoints(500000)
#It will look better if you use a bigger input, but the plot might take a while.
#I find that there's a large delay between RStudio saying that my code is finished running and the plot appearing.
#If your input is truly big, you may want to reduce the two cex parameters (to make the points smaller).