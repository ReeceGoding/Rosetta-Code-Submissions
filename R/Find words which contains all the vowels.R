#https://rosettacode.org/wiki/Find_words_which_contains_all_the_vowels
#Context: Below. There was no solution in R before mine.

#Adapting this from https://rosettacode.org/wiki/Find_words_which_contain_the_most_consonants#R is trivial.
dict <- scan("https://web.archive.org/web/20180611003215/http://www.puzzlers.org/pub/wordlists/unixdict.txt", what = character())
dictBig <- dict[nchar(dict) > 10]
#The following line is equivalent to sapply(c("a", "e", "i", "o", "u"), function(x) stringr::str_count(dictBig, x))
#As with all things with strings in R, life is easier with stringr or stringi.
vowelCount <- sapply(c("a", "e", "i", "o", "u"), function(x) lengths(regmatches(dictBig, gregexec(x, dictBig))))
dictBig[apply(vowelCount, MARGIN = 1, function(x) all(x == 1))]