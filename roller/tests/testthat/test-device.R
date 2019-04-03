context("Test Device")

test_that("device defualt function works", {
  defualt_die = device()
  expect_equal(c(1,2), defualt_die$sides)
  expect_equal(c(0.5, 0.5), defualt_die$prob)
})

test_that("device function works as intended", {
  #check device constructor
  die1 = device(
    sides = c('a', 'b', 'c', 'd'),
    prob = rep(1/4, 4))
  expect_true(is.device(die1))
  expect_equal(c('a', 'b', 'c', 'd'), die1$sides)
  expect_equal(c(0.25, 0.25, 0.25, 0.25), die1$prob)

  # check loaded die
  loaded_die = device(
    sides = 1:6,
    prob = c(0.1, 0.1, 0.1, 0.1, 0.4, 0.2))
  expect_true(is.device(loaded_die))
  expect_equal(1:6, loaded_die$sides)
  expect_equal(c(0.1, 0.1, 0.1, 0.1, 0.4, 0.2), loaded_die$prob)

  # check errors in construction
  expect_error(device(sides = 1:5,prob = c(0.5, 0.5)))
  expect_error(device(sides = 1:5,prob = c(0.5, 0.5, 0.5, 0.5, 0.5)))
  expect_error(device(sides = 1:6,prob = c(1/6,1/6,1/6,1/6,1/6,1/5)),
                 "elements in 'prob' must add up to 1")
  expect_error(device(sides = 1,prob = 1),
               "'sides' must be a vector of length greater than 1")
})
