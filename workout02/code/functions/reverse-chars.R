#' @title Reverse Chars
#' @description reverses the characters in a string
#' @param x a string
#' @return reversed input string 
reverse_chars = function(x) {
  split_ = strsplit(x, split = "")
  rev = nchar(x):1
  rev_char = split_[[1]][rev]
  paste(rev_char, collapse = "")
}
