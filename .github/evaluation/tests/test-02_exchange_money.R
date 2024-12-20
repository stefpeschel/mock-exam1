context("exercises in 02_exchange_money.R")

test_that("Exercise 02: examples : exchange_money works with expected input ", {
  exerciseTest("2.1")
  expect_vector_function_equal(ex02exchange_money, value = 0.8, .expected = 0.736)
  expect_vector_function_equal(ex02exchange_money, value = 0.8, 
                               currency = "USD", eur_per_usd = 0.92,
                               .expected = 0.736)
  expect_vector_function_equal(ex02exchange_money, value = 2.44, 
                               currency = "EUR", eur_per_usd = 0.92,
                               .expected = 2.652174, tolerance = 0.0001)
  expect_vector_function_equal(ex02exchange_money, value = 1:4, 
                               currency = "USD", eur_per_usd = 0.89,
                               .expected = c(0.89, 1.78, 2.67, 3.56), tolerance = 0.0001)
  expect_vector_function_equal(ex02exchange_money, value = c(1:4, NA), 
                               currency = "USD", eur_per_usd = 0.89,
                               .expected = c(0.89, 1.78, 2.67, 3.56, NA), tolerance = 0.0001)
  
})
test_that("Exercise 02: examples : exchange_money correctly produces errors ", {
  exerciseTest("2.2")
  expect_error(ex02exchange_money(c("Eins", 3, 3.1), "USD", 0.89))
  expect_error(ex02exchange_money(1:4, "CAD", 0.89))
 })

test_that("Exercise 02: additional tests : exchange_money ", {
  exerciseTest("2.3")
  expect_equal(ex02exchange_money(-0.8), -0.736, tolerance = 0.0001)
  expect_error(ex02exchange_money(c(4, 3, 3.1), 1, 0.89))
})
