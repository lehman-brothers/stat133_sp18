context("Check die arguments")

# check_sides testing

test_that("check_sides has vector of length six", {

  expect_true(check_sides(c(7,8,9,10,11,12)))
  expect_true(check_sides(c("u","v","w","x","y","z")))
})


test_that("check_sides fails with invalid vector lengths", {

  expect_error(check_sides(c(1,2,3,4,5,6,7)))
  expect_error(check_sides(c(1,2,3,4,5)))
  expect_error(check_sides(c("one", "two")))
  expect_error(check_sides(c("one", "two", "three", "four", "five", "six", "seven")))
  expect_error(check_sides(1:5))
  expect_error(check_sides(1))
})


# check_prob testing

test_that("check_prob has an input with a sum of 1", {

  expect_true(check_prob(c(1/6,1/6,1/6,1/6,1/6,1/6)))
  expect_true(check_prob(c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)))
})


test_that("check_prob fails with invalid inputs", {

  expect_error(check_prob(c(1/6,1/6,1/6,1/6,1/6,1/8)))
  expect_error(check_prob(c(0.075, 0.1, 0.125, 0.15, 0.20, 0.35)))
})

# check_times testing

test_that("check_times is an integer not less than 1", {

  expect_true(check_times(1))
  expect_true(check_times(1000))
})


test_that("check_times fails with invalid inputs", {

  expect_error(check_times(-5))
  expect_error(check_times(0.75))
})

