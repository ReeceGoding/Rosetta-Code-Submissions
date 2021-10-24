#https://rosettacode.org/wiki/Floyd%27s_triangle
#Context: Below. There was no solution in R before mine.

#If it weren't for the printing requirements, we could do this in one line.
Floyd <- function(n)
{
  #The first argument of the seq call is a well-known formula for triangle numbers.
  out <- t(sapply(seq_len(n), function(i) c(seq(to = 0.5 * (i * (i + 1)), by = 1, length.out = i), rep(NA, times = n - i))))
  dimnames(out) <- list(rep("", times = nrow(out)), rep("", times = ncol(out)))
  print(out, na.print = "")
}
Floyd(5)
Floyd(14)