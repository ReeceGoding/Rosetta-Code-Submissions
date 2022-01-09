#https://rosettacode.org/wiki/Conditional_structures
#Context: Below. There was no solution in R before mine.

##if
#Like most languages, R has an if statement as well as if-then-else:
x <- 0
if(x == 0) print("foo")
x <- 1
if(x == 0) print("foo")
if(x == 0) print("foo") else print("bar")

##switch
#R also has switch, but it's a function rather than a special form of any sort.
#In fact, R has two versions of switch: one for numbers and one for characters.
x <- 2
switch(x, print("Print if x == 1"), print("Print if x == 2"))
#A notable part of the numeric version of switch is that, rounding and coercion aside,
#the cases must correspond exactly to the number of arguments given minus one.
#For example, the second argument of the switch statement will only be matched
#if the first argument equals (or is coerced to) 1 and the third argument will only
#do so for 2. There is no way to supply default cases or start from a number
#other than 1.
x <- 3
switch(x, print("Print if x == 1"), print("Print if x == 2"))
x <- 2.7
switch(x, print("Print if x == 1"), print("Print if x == 2 or if there is rounding to 2"))
#The other switch, the one that works for characters, is much more sensible.
#Its rules are clearly laid out in documentation, but rely on R's mechanisms for
#names, which makes them a little bit complicated.
#See https://cran.r-project.org/doc/manuals/r-release/R-lang.html#switch
#for a reasonably simple example.
x <- "match"
switch(x, mat = 0, match = 10, other = 100, 1000)
x <- "ma"
switch(x, mat = 0, match = 10, other = 100, 1000)
x <- "foo"
switch(x, mat = 0, match = 10, other = 100, 1000)

##ifelse
#R's final example is the ifelse function. Like switch, it is not a special form,
#so its inclusion here is debatable. In fact, the current version of the language
#definition does not even mention it. However, 'An Introduction to R' gives a better
#description than I could:
#"This has the form ifelse(condition, a, b) and returns a vector of the same length as
#condition, with elements a[i] if condition[i] is true, otherwise b[i]
#(where a and b are recycled as necessary)."
#See https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Conditional-execution
#Note also that it is not a ternary operator and its documentation warns
#against using it as such. In my experience, its most common use is in recoding data.
#For example:
data <- c(1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0)
ifelse(data == 1, "Yes", "No")