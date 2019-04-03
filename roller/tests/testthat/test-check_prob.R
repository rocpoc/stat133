context("Test check_prob")

test_that("check_prob works as intended & throws errors correctly", {
  defualt_die = device()
  roller = roll(defualt_die)
  expect_equal(roller$prob, c(0.5, 0.5))
  expect_error(device(sides = 1:6,prob = rep("1/6", 6)), "'prob' is not a numeric vector")
  expect_error(device(sides = 1:6,prob = 1/2), "'prob' must be a vector of length greater than 1")
  expect_error(device(sides = 1:6, prob = rep(1/2, 6)), "elements in 'prob' must add up to 1")
  expect_error(device(sides = 1:6, prob = c(-0.1, 0.2, 0.2, 0.2, 0.3, 0.2)), "elements in 'prob' exceed 1 or are less than 0")
})
