#' @title Minkowski
#' @description computes the Minkowski distance of the points
#' @param x numeric vector for one point
#' @param y numeric vector for the other point
#' @param p either a numeric value greater than 1, or a character string max (default 1)
#' @return the computed distance
minkowski = function(x, y, p=1) {
  if(length(x) != length(y)) {
    stop("x and y have different lengths")
  } else if (is.numeric(p)) {
    if(p < 1) {
      stop("p cannot be less than 1")
    }
  } else if (is.character(p)) {
    if(p != "max") {
      stop("invalid character value for p")
    } else {
      lst = rep(0, length(x))
      for(i in 1:length(x)) {
        lst[i] = abs(x[i] - y[i])
      }
      return(max(lst))
    }
  }
  sum = 0
  for(i in 1:length(x)) {
    sum = sum + abs(x[i] - y[i])^p
  }
  pnorm = sum^(1/p)
  return(pnorm)
}