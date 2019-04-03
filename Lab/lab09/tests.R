# load the source code of the functions to be tested
source("functions.R")

x <- c(1, 2, 3, 4, 5)
y <- c(1, 2, 3, 4, NA)
z <- c(TRUE, FALSE, TRUE)
w <- letters[1:5]

# context with one test that groups expectations
context("Test for range value") 
test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(stat_range(x), 4)
  expect_length(stat_range(x), 1)
  expect_type(stat_range(x), 'double')
})

context("Test for range value with Y") 
test_that("range works as expected with y", {
  expect_length(stat_range(y), 1)
  expect_type(stat_range(y), 'NA_real_')
})


context("Test for range value with Z") 
test_that("range works as expected with z", {
  expect_length(stat_range(z), 1)
  expect_type(stat_range(z), 'integer')
  expect_equal(stat_range(z), 1L)
})

context("Test for range value with W")
test_that("range works as expected with w", {
  expect_error(stat_range(w), "non-numeric argument to binary operator")
})


###########

context("Test for STAT_CENTERS")
test_that("gets correct info", {sd
  expect_equal(stat_centers(x), c(3,3))
})

context("Test for STAT_SPREAD")
test_that("gets correct info", {
  expect_equal(round(stat_spreads(x),2), c(4.00, 2.00, 1.58))
})




