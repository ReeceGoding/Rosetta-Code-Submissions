#https://rosettacode.org/wiki/Sequence:_smallest_number_greater_than_previous_term_with_exactly_n_divisors
#Context: None needed. There was no solution in R before mine.

#Need to add 1 to account for skipping n. Not the most efficient way to count divisors, but quite clear.
divisorCount <- function(n) length(Filter(function(x) n %% x == 0, seq_len(n %/% 2))) + 1
A06954 <- function(terms)
{
  out <- 1
  while((resultCount <- length(out)) != terms)
  {
    n <- resultCount + 1
    out[n] <- out[resultCount]
    while(divisorCount(out[n]) != n) out[n] <- out[n] + 1
  }
  out
}
print(A06954(15))