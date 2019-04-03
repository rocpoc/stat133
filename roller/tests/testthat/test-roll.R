context("Test Roll")

test_that("roll defualt function works", {
  default_die = device()
  roller = roll(default_die)
  expect_equal(roller$total, 1)
  expect_equal(roller$sides, c(1,2))
  expect_equal(roller$prob, c(0.5, 0.5))
  expect_is(default_die, "device")
})

test_that("roll function works as intended", {
  die1 = device(
    sides = c(1, 2, 3, 4, 5, 6),
    prob = rep(1/6, 6))

  loaded_die = device(
    sides = 1:4,
    prob = c(0.1, 0.1, 0.6, 0.2))

  roll_die1 = roll(die1, times = 50)
  expect_equal(roll_die1$total, 50)
  expect_equal(roll_die1$sides, 1:6)
  expect_equal(roll_die1$prob, rep(1/6, 6))
  expect_is(roll_die1, 'rolls')

  roll_loaded_die = roll(loaded_die, times = 10)
  expect_equal(roll_loaded_die$total, 10)
  expect_equal(roll_loaded_die$sides, c(1,2,3,4))
  expect_equal(roll_loaded_die$prob[3],0.6)
  expect_is(roll_loaded_die, 'rolls')

  expect_error(roll("die", 50), "device is not of class 'device'")
  expect_error(roll(die1, "fifty"), "'times' is not integer")
  expect_error(roll(die1, 0), "'times' is not a positive integer")

})
