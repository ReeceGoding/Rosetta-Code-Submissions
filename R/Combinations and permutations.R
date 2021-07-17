#R has most of this built in. The documentation for choose warns that it
#only calculates its result directly if k is small.
#Skimming what appears to be the source code
#https://github.com/wch/r-source/blob/trunk/src/nmath/choose.c
#suggests that 29 is the highest "small" k.
#This means that we can solve both tasks with little more than R's choose.
perm <- function(n, k) choose(n, k) * factorial(k)
print(perm(seq(from = 3, to = 12, by = 3), seq(from = 2, to = 8, by = 2)))
print(choose(seq(from = 10, to = 60, by = 10), seq(from = 3, to = 18, by = 3)))
print(perm(seq(from = 1500, to = 15000, by = 1500), seq(from = 55, to = 100, by = 5)))
print(choose(seq(from = 100, to = 1000, by = 150), seq(from = 70, to = 100, by = 5)))
#We can notice some interesting things about R from this task.
#Despite being a mathematical programming language:
#1) R does not have any function like perm built in.
#2) R does not have big integers by default and will return Inf without warning.
#3) R's documentation does not tell us exactly when choose's behaviour changes.