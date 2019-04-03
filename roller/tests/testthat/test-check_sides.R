context("Test check_sides")

test_that("check_sides works as intended & throws errors correctly", {
  defualt_die = device()
  roller = roll(defualt_die)
  die1 = device(sides = c('a', 'b', 'c'), prob = rep(1/3, 3))
  expect_equal(die1$sides, c('a','b','c'))
  die2 = device(sides = c(1, 3, 5, 7), prob = rep(1/4, 4))
  expect_equal(die2$sides, c(1,3,5,7))
  expect_equal(roller$side, c(1,2))
  expect_error(device(sides = 1, prob = 1),"'sides' must be a vector of length greater than 1")
  expect_error(device(sides = c(1, 2, 3, 4, 4), prob = rep(1/5, 5)), "'sides' cannot have duplicated elements")
})

