#https://rosettacode.org/wiki/Sum_of_elements_below_main_diagonal_of_matrix
#Context: Below. There was no solution in R before mine.

#R has lots of native matrix support, so this is trivial.
mat <- rbind(c(1,3,7,8,10),
             c(2,4,16,14,4),
             c(3,1,9,18,11),
             c(12,14,17,18,20),
             c(7,1,3,9,5))
print(sum(mat[lower.tri(mat)]))