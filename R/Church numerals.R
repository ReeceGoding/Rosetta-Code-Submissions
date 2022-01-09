#https://rosettacode.org/wiki/Church_numerals
#Context: Below. There was no solution in R before mine.
#Although this code is a translation of Racket's, I was familiar with the task from reading
#Structure and Interpretation of Computer Programs, which has most of this task as Exercise 2.6.

#R was inspired by Scheme and this task offers little room for creativity. 
#As a consequence, our solution will inevitably look a lot like Racket's.
#Therefore, we have made this easy and just translated their solution.
#Alternative implementations, denoted by asterisks in their code, are separated out and denoted by "[...]Alt".
zero <- function(f) {function(x) x}
succ <- function(n) {function(f) {function(x) f(n(f)(x))}}
add <- function(n) {function(m) {function(f) {function(x) m(f)(n(f)(x))}}}
mult <- function(n) {function(m) {function(f) m(n(f))}}
expt <- function(n) {function(m) m(n)}
natToChurch <- function(n) {if(n == 0) zero else succ(natToChurch(n - 1))}
churchToNat <- function(n) {(n(function(x) x + 1))(0)}

three <- natToChurch(3)
four <- natToChurch(4)

churchToNat(add(three)(four))
churchToNat(mult(three)(four))
churchToNat(expt(three)(four))
churchToNat(expt(four)(three))

#Alternative versions (Racket's, again):
zeroAlt <- function(x) identity
one <- function(f) f #Not actually requested by the task and only used to define Alt functions, so placed here.
oneAlt <- identity
succAlt <- function(n) {function(f) {function(x) n(f)(f(x))}}
succAltAlt <- add(one)
addAlt <- function(n) n(succ)
multAlt <- function(n) {function(m) m(add(n))(zero)}
exptAlt <- function(n) {function(m) m(mult(n))(one)}

#Extra tests - mostly for the alt versions - not present in the Racket solution:
churchToNat(addAlt(three)(four))
churchToNat(multAlt(three)(four))
churchToNat(exptAlt(three)(four))
churchToNat(exptAlt(four)(three))
churchToNat(succ(four))
churchToNat(succAlt(four))
churchToNat(succAltAlt(four))