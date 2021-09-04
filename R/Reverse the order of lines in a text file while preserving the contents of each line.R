#https://rosettacode.org/wiki/Reverse_the_order_of_lines_in_a_text_file_while_preserving_the_contents_of_each_line
#Context: The task is trivial, but I can understand why there are many complaints about it.
#There was no solution in R before mine.

text <- scan("Rodgers.txt", character(), sep = "\n")
print(text)
reversed <- rev(text)
print(reversed)
write(reversed, "SaveTheOutput.txt")