#https://rosettacode.org/wiki/Change_e_letters_to_i_in_words
#Context: None needed. This is very short. There was no solution in R before mine.

dict <- scan("https://web.archive.org/web/20180611003215/http://www.puzzlers.org/pub/wordlists/unixdict.txt", what = character())
changed <- chartr("e", "i", dict)
cbind(Before = dict, After = changed)[changed != dict & changed %in% dict & nchar(changed) > 5, ]