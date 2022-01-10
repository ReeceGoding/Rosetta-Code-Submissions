#https://rosettacode.org/wiki/Letter_frequency
#Context: The site's other solution uses factors. I considered this unidiomatic.

##Using table
#R's table function is more idiomatic.
#For variety, we will use read.delim rather than readLines and show how to only count letters.
#It is worth noting that readLines is prone to counting empty lines. This may be undesirable.
letterFreq <- function(filename, lettersOnly)
{
  txt <- read.delim(filename, header = FALSE, stringsAsFactors = FALSE, allowEscapes = FALSE, quote = "")
  count <- table(strsplit(paste0(txt[,], collapse = ""), ""))
  if(lettersOnly) count[names(count) %in% c(LETTERS, letters)] else count
}
#For fun, we'll use this page for input.
#However, HTML rarely parses well and the variety of text here is so large that I suspect inaccurate output. 
print(letterFreq('https://rosettacode.org/wiki/Letter_frequency', TRUE))
# Output:     a     A     b     B     c     C     d     D     e     E     f     F     g     G     h     H     i     I 
# 38186   666  8008   350 16585  1263  4151   277 15020   713  3172   529  3079   149  4549   161  9397   690 
# j     J     k     K     l     L     m     M     n     N     o     O     p     P     q     Q     r     R 
# 311   113  3294    76 15906   928  3333   322 26795   355  8926   456 22702   497  1877    39 15055   591 
# s     S     t     T     u     U     v     V     w     W     x     X     y     Y     z     Z 
# 46527   695 15549   597  5268   269  1003   128  4134   148  1239   144  3037    55   127    77 