#' @title Count Vowels
#' @description counts the vowels in an input string
#' @param x a string of letters
#' @return the number of vowels in the input string x
count_vowels = function(x) {
  if(is.character(x) == FALSE) {
    stop("invalid input; a string was expected")
  }
  x = casefold(x)
  vowels = c(0, 0, 0, 0, 0)
  names(vowels) = c('a', 'e', 'i', 'o', 'u')
  vowels[[1]] = str_count(x, "a")
  vowels[[2]] = str_count(x, "e")
  vowels[[3]] = str_count(x, "i")
  vowels[[4]] = str_count(x, "o")
  vowels[[5]] = str_count(x, "u")
  return(vowels)
}