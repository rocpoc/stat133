#' @title Rolls
#' @description creates and rolls the device for a number of times
#' @param device object of class device (a vector)
#' @param times number of tosses (default value of 1)
#' @return an object of class "rolls"
roll = function(device, times = 1L) {
  if(is.device(device) == FALSE) {
    stop("device is not of class 'device'")
  }
  check_times(times)
  rolls = sample(device$sides, size = times, replace = TRUE, prob = device$prob)
  rollo = list(rolls = rolls, sides = device$sides, prob = device$prob, total = times)
  class(rollo) <- "rolls" #create object class rolls
  rollo
}

#' @title Print Rolls
#' @description prints the 'rolls' object
#' @param x a 'roll' object
#' @return the name of the object, as well as the generated rolls
print.rolls <- function(x) {
  cat('object "rolls"\n\n')
  print(x$rolls)
}

#' @title Check Times
#' @description checks the validity of argument times in device function
#' @param times integer
#' @return TRUE if times is positive integer greater than or equal to 1, ERROR otherwise
check_times = function(times) {
  if(is.numeric(times) == FALSE) {
    stop("'times' is not integer")
  } else if(times < 1) {
    stop("'times' is not a positive integer")
  } else {
    return(TRUE)
  }
}

#' @title Summary Rolls
#' @description takes a 'roll' object and makes a summary of all the data associated with it
#' @param x a 'roll' object
#' @return a dataframe with sides (of rolled 'device'),
#'        counts (frequency of the number of the roll), and prop (the relative frequencies of each side of the rolled 'device')
summary.rolls = function(x) {
  count_table = data.frame(table(factor(x$rolls, levels = 1:length(x$sides))))
  prop_table = data.frame(table(factor(x$rolls, levels = 1:length(x$sides))))
  freqs = data.frame(
    side = x$sides,
    count = count_table$Freq,
    prop = prop_table$Freq / x$total
  )
  obj = list(freqs = freqs)
  class(obj) <- "summary.rolls"
  obj
}

#' @title Print Summary Rolls
#' @description prints the summary.rolls object's frequency dataframe
#' @param x a 'summary.roll' object
#' @return the name of the object, as well as the dataframe of side, count, and prop associated with it
print.summary.rolls = function(x) {
  cat('summary "rolls"\n\n')
  print(x$freqs)
}

#' @title Plot Rolls
#' @description graphs a barchart of the proportions of the sides of devices
#' @param x a 'rolls' object
#' @return the barchart of the proportions
plot.rolls = function(x) {
  x_sum = summary.rolls(x)
  side = x_sum$freqs$side
  freqs = x_sum$freqs$prop
  barplot(freqs,
          xlab = "sides of device", bty = "n",
          ylab = sprintf("relative frequencies"),
          names.arg = 1:length(side))
  title(sprintf("Relative Frequencies in a series of %s rolls", x$total))
}

#' @title Roll Extraction Method
#' @description extracts the index of the roll
#' @param x the 'roll' object
#' @param i the index
#' @return the index of the roll
"[.rolls" <- function(x, i) {
  if (i > x$total) {
    stop("the given index out of bounds")
  }
  x$rolls[i]
}

#' @title Roll Replacement Method
#' @description replaces the value at index
#' @param x the 'roll' object
#' @param i the index
#' @param value the value to replace the index
#' @return the new value at the index
"[<-.rolls"  = function(x, i, value) {
  if (i > x$total) {
    stop("the given index out of bounds")
  }
  #x$rolls[i] = value
  x$rolls = replace(x$rolls, list = i, values = value)
  return(x)
}

#' @title Roll Addition Method
#' @description adds more rolls
#' @param x the 'roll' object
#' @param i the number of rolls to be added
#' @return adds i number of rolls to the roll object x
"+.rolls" <- function(x, i) {
  if(i <= 0 | length(i) != 1) {s
    stop("added number of rolls must be a postive integer")
  }
  more_rolls = roll(device(x$side, x$prob), times = i)
  x$rolls = c(x$rolls, more_rolls$rolls)
  return(x)
}
