#' @title Is Hex
#' @description checks whether an input string is a valid color in hexadecimal notation
#' @param x a string
#' @return TRUE if input string is in hex notation, FALSE otherwise
is_hex = function(x) {
  if(!is.character(x) && length(x) == 1) {
    stop("invalid input; a string was expected")
  }
  return(grepl(x, pattern = "#[0-9A-Fa-f]{6}$", ignore.case = TRUE))
}

#' @title Is Hex Alpha
#' @description checks whether an input string is a valid color in hexadecimal notation (with an alpha transparency value)
#' @param x a string
#' @return TRUE if input string is in hex notation with alpha value, FALSE otherwise
is_hex_alpha = function(x) {
  if(!is.character(x) && length(x) == 1) {
    stop("invalid input; a string was expected")
  }
  return(grepl(x, pattern = "#[0-9A-Fa-f]{8}$", ignore.case = TRUE))
}