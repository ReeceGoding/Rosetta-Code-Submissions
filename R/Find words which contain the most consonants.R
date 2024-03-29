#https://rosettacode.org/wiki/Find_words_which_contain_the_most_consonants
#Context: Below. There was no solution in R before mine.

#Far and away the hardest part of this task is filtering down the dict until it only contains words with
#no repeated consonants. If we only had to find the word with the most consonants, this would be easy.
dict <- scan("https://web.archive.org/web/20180611003215/http://www.puzzlers.org/pub/wordlists/unixdict.txt", what = character())
dictBig <- dict[nchar(dict) > 10]
consonants <- letters[!letters %in% c("a", "e", "i", "o", "u")]
#The following line is equivalent to sapply(consonants, function(x) stringr::str_count(dictBig, x))
#As with all things with strings in R, life is easier with stringr or stringi.
consonantCount <- sapply(consonants, function(x) lengths(regmatches(dictBig, gregexec(x, dictBig))))
wordsWithNoRepeatedConsts <- dictBig[apply(consonantCount, MARGIN = 1, function(x) all(x <= 1))]
uniqueConstCount <- rowSums(sapply(consonants, function(x) grepl(x, wordsWithNoRepeatedConsts)))
biggestWords <- function(offset) wordsWithNoRepeatedConsts[which(uniqueConstCount == max(uniqueConstCount) - offset)]
cat("Biggest:", paste(biggestWords(0), collapse = ", "),
    "\n \n Second biggest:", paste(biggestWords(1), collapse = ", "),
    "\n \n Third biggest:", paste(biggestWords(2), collapse = ", "))