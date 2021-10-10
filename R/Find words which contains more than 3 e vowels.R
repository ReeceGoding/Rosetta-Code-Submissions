#https://rosettacode.org/wiki/Find_words_which_contains_more_than_3_e_vowels
#Context: Below. There was no solution in R before mine.

#Adapting this from https://rosettacode.org/wiki/Find_words_which_contains_all_the_vowels#R is trivial.
dict <- scan("https://web.archive.org/web/20180611003215/http://www.puzzlers.org/pub/wordlists/unixdict.txt", what = character())
#The following line is equivalent to sapply(c("a", "i", "o", "u"), function(x) stringr::str_count(dict, x))
#As with all things with strings in R, life is easier with stringr or stringi.
notEVowelCount <- sapply(c("a", "i", "o", "u"), function(x) lengths(regmatches(dict, gregexec(x, dict))))
eCount <- lengths(regmatches(dict, gregexec("e", dict)))
dict[apply(notEVowelCount, MARGIN = 1, function(x) all(x < 1)) & eCount > 3]