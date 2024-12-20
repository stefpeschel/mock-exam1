context("exercises in 03_hflights.R")

test_that("Exercise 03: a: object tests ", {
  exerciseTest("3.1")
  expect_equal(sum(sapply(ex0302a, is.character)), 0)
})

test_that("Exercise 03: b: object tests ", {
  exerciseTest("3.2")
  expect_data_frame(ex0302b, nrows = 14, ncols = 2)
  expect_set_equal(colnames(ex0302b), c("UniqueCarrier", "n"))
  expect_equal(median(ex0302b$n), 53)
  expect_equal(sd(ex0302b$n), 334.3806, tolerance = 0.001)
  expect_equal(ex0302b$n[3], 475)
})

test_that("Exercise 03: c: object tests ", {
  exerciseTest("3.3")
  expect_data_frame(ex0302c, nrows = 15, ncols = 2)
  expect_set_equal(colnames(ex0302c), c("UniqueCarrier", "CancellationRatio"))
  expect_equal(sd(ex0302c$CancellationRatio), 0.008891125, tolerance = 0.0001)
  expect_equal(ex0302c$CancellationRatio[3], 0.0259)
  expect_equal(ex0302c$UniqueCarrier[7],
               factor("WN",
                      levels = c("AA", "AS", "B6", "CO", "DL", "EV", "F9", "FL",
                                 "MQ", "OO", "UA", "US", "WN", "XE", "YV")))
})

test_that("Exercise 03: d: object tests ", {
  exerciseTest("3.4")
  expect_data_frame(ex0302d, nrows = 15, ncols = 2)
  expect_set_equal(colnames(ex0302d), c("UniqueCarrier", "MeanDelay"))
  expect_equal(median(ex0302d$MeanDelay), 23.6665, tolerance = 0.0001)
  expect_equal(sd(ex0302d$MeanDelay), 7.95094, tolerance = 0.001)
  expect_equal(ex0302d$MeanDelay[7], 17.304)
})

test_that("Exercise 03: e: object tests ", {
  exerciseTest("3.5")
  expect_number(ex0302e)
  expect_equal(ex0302e %% 11 + 0.5 * ex0302e, 13859)
 })
