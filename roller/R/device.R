#' @title Device
#' @description creates a coin with sides and probability, coin is fair by default
#' @param sides vector of k ≥ 2 elements, by default numbers 1 and 2
#' @param prob vector of probabilities for each side (all equal to 1/2 by default).
#' @return device object
device = function(sides = c(1,2), prob = c(0.5, 0.5)) {
  check_sides(sides)
  check_prob(prob)
  if(length(sides) != length(prob)) {
    stop("'sides' and 'prob' have different lengths")
  }
  dev <- list(sides = sides, prob = prob)
  class(dev) <- "device" #create object classs device, with attributes sides and prob
  return(dev)
}

#' @title Print Device
#' @description prints the device object
#' @param x a device object
#' @return prints the data frame of the device object with its sides and probabilities
print.device <- function(x) {
  cat('object "device"\n\n')
  side_prob <- data.frame(side = x$sides, prob = x$prob)
  print(side_prob)
}

#' @title Is Device
#' @description checks if the object is of class device
#' @param x an object
#' @return TRUE if object x is of class 'device', FALSE otherwise
is.device = function(x) {
  if(class(x) == 'device') {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

#' @title Check Sides
#' @description checks the validity of argument sides in device function
#' @param sides vector of k ≥ 2 elements
#' @return TRUE if sides is a vector with more than 1 element, not containing duplicates. Throws error otherwise.
check_sides = function(sides) {
  if(length(sides) < 2) {
    stop("'sides' must be a vector of length greater than 1")
  } else if(any(duplicated(sides))) {
    stop("'sides' cannot have duplicated elements")
  }
}

#' @title Check Prob
#' @description checks the validity of argument prob in device function
#' @param prob vector of probabilities for each side
#' @return TRUE if vector is a numeric vector with more than 1 element, 0<x<1, and elements add to 1. Throws error otherwise.
check_prob = function(prob) {
  if(is.numeric(prob) == FALSE) {
    stop("'prob' is not a numeric vector")
  } else if(length(prob) < 2) {
    stop("'prob' must be a vector of length greater than 1")
  } else if(sum(prob) != 1) {
    stop("elements in 'prob' must add up to 1")
  } else if(any(prob < 0) | any(prob > 1)) {
    stop("elements in 'prob' exceed 1 or are less than 0")
  } else {
    return(TRUE)
  }
}
