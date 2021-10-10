#https://rosettacode.org/wiki/Find_words_whose_first_and_last_three_letters_are_equal
#Context: None needed. There was no solution in R before mine.

dict <- scan("https://web.archive.org/web/20180611003215/http://www.puzzlers.org/pub/wordlists/unixdict.txt", what = character())
dict[nchar(dict) > 5 & substr(dict, 1, 3) == substr(dict, nchar(dict) - 2, nchar(dict))]