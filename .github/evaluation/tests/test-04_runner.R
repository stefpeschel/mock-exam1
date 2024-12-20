expect_options <- function(object, options, input, fname) {
  act <- quasi_label(rlang::enquo(object), arg = "object")
  compResults <- purrr::map_lgl(options, ~identical(act$val, .x))
  if (!any(compResults)) {
    expect(
      any(compResults),
      paste0("\n With the input deck = \n \n", printToText(input), "\n the function ",  
             fname, " should produce one of the following outputs: \n \n", printToText(options),
             "\n Your function produced instead: \n \n", printToText(object))
    )
  } else {
    expect_equal(1, 1)
  }
  invisible(act$val)
  
}
context("exercises in 04_runner.R")


test_that("Exercise 04: a: check object", {
  exerciseTest("4.1")
  expect_data_frame(ex04adeck, ncols = 2L, nrows = 52)
  expect_set_equal(colnames(ex04adeck), c("colour", "number"))
  expect_set_equal(sum(ex04adeck$number), 364L)
  expect_set_equal(mean(table(ex04adeck$colour)), 13L)
})


test_that("Exercise 04: b: check object", {
  exerciseTest("4.2")
  expect_set_equal(ex04bdeck$card, NULL)
  expect_set_equal(ex04bdeck$history, NULL)
  expect_data_frame(ex04bdeck$deck, ncols = 2L, nrows = 52)
  expect_set_equal(colnames(ex04bdeck$deck), c("colour", "number"))
  expect_set_equal(sum(ex04bdeck$deck$number), 364L)
  expect_set_equal(mean(table(ex04bdeck$deck$colour)), 13L)
})

test_that("Exercise 04: c: Tests examples, correcting for randomness", {
  exerciseTest("4.31")
  example_deck <- list(
    card = NULL, 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3)), 
    history = NULL)
  after_draw <- ex04draw(example_deck)
  possible_solutions <- list(
    list(card = example_deck$deck[1, , drop = FALSE], 
         deck = example_deck$deck[-1, ,], 
         history = NULL),
    list(card = example_deck$deck[2, , drop = FALSE], 
              deck = example_deck$deck[-2, ,], 
              history = NULL),
    list(card = example_deck$deck[3, , drop = FALSE], 
         deck = example_deck$deck[-3, ,], 
         history = NULL),
    list(card = example_deck$deck[4, , drop = FALSE], 
         deck = example_deck$deck[-4, ,], 
         history = NULL)
  )
  expect_options(after_draw, possible_solutions, example_deck, "ex04draw")
})

test_that("Exercise 04: c: Irrelevant input is passed", {
  exerciseTest("4.32")
  example_deck <- list(
    card = NULL, 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3), irrelevant = 1), 
    history = NULL)
  after_draw <- ex04draw(example_deck)
  possible_solutions <- list(
    list(card = example_deck$deck[1, , drop = FALSE], 
         deck = example_deck$deck[-1, ,], 
         history = NULL),
    list(card = example_deck$deck[2, , drop = FALSE], 
         deck = example_deck$deck[-2, ,], 
         history = NULL),
    list(card = example_deck$deck[3, , drop = FALSE], 
         deck = example_deck$deck[-3, ,], 
         history = NULL),
    list(card = example_deck$deck[4, , drop = FALSE], 
         deck = example_deck$deck[-4, ,], 
         history = NULL)
  )
  expect_options(after_draw, possible_solutions, example_deck, "ex04draw")
})

test_that("Exercise 04: c: Additional tests: seed and randomness", {
  exerciseTest("4.33")
  example_deck <- list(
    card = NULL, 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3)), 
    history = NULL)
  example_deck$deck <- example_deck$deck[order(example_deck$deck$number),]
  after_draw <- ex04draw(example_deck)
  expect_data_frame(after_draw$card, nrows = 1L, ncols = 2L)
  expect_set_equal(colnames(after_draw$card), c("colour", "number"))
  expect_data_frame(after_draw$deck, nrows = 3L, ncols = 2L)
  expect_set_equal(colnames(after_draw$deck), c("colour", "number"))
  combined_deck <- rbind(after_draw$card, after_draw$deck)
  expect_identical(combined_deck[order(combined_deck$number), ],
                   example_deck$deck)
  # random works
  after_draw2 <- ex04draw(example_deck)
  after_draw3 <- ex04draw(example_deck)
  after_draw4 <- ex04draw(example_deck)
  after_draw5 <- ex04draw(example_deck)
  identical2 <- identical(after_draw, after_draw2)
  identical3 <- identical(after_draw, after_draw3)
  identical4 <- identical(after_draw, after_draw4)
  identical5 <- identical(after_draw, after_draw5)
  if ((identical2 + identical3 + identical4 + identical5) == 4) {
    stop("Your function does not seem to produce random but deterministic draws.")
  }
  # seed works
  after_draw <- ex04draw(example_deck, seed = 1L)
  after_draw2 <- ex04draw(example_deck, seed = 1L)
  after_draw3 <- ex04draw(example_deck, seed = 1L)
  after_draw4 <- ex04draw(example_deck, seed = 1L)
  after_draw5 <- ex04draw(example_deck, seed = 1L)
  identical2 <- identical(after_draw, after_draw2)
  identical3 <- identical(after_draw, after_draw3)
  identical4 <- identical(after_draw, after_draw4)
  identical5 <- identical(after_draw, after_draw5)
  if ((identical2 + identical3 + identical4 + identical5) != 4) {
    stop("Your function does not seem to be reproducible (seed).")
  }
})

test_that("Exercise 04: d: Examples work", {
  exerciseTest("4.41")
  example_deck <- list(
    card = data.frame(colour = "green", number = 12), 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3)), 
    history = NULL)
  expect_vector_function_equal(ex04decide_prior, card = example_deck$card, 
                               deck = example_deck$deck, .expected = "smaller")
  
  example_deck <- list(
    card = data.frame(colour = "green", number = 4), 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3)), 
    history = NULL)
  expect_vector_function_equal(ex04decide_prior, card = example_deck$card, 
                               deck = example_deck$deck, .expected = "larger")
})

test_that("Exercise 04: d: Irrelevant inputs are passed", {
  exerciseTest("4.42")
  example_deck <- list(
    card = data.frame(colour = "green", number = 12, irrelevant = 1L), 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3), irrelevant = 1L), 
    history = NULL)
  expect_vector_function_equal(ex04decide_prior, card = example_deck$card, 
                               deck = example_deck$deck, .expected = "smaller")
  
})

test_that("Exercise 04: d: Additional tests", {
  exerciseTest("4.43")
  example_deck <- list(
    card = data.frame(colour = "green", number = 6), 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3)), 
    history = NULL)
  expect_vector_function_equal(ex04decide_prior, card = example_deck$card, 
                               deck = example_deck$deck, .expected = "larger")
  example_deck <- list(
    card = data.frame(colour = "green", number = 8), 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3)), 
    history = NULL)
  expect_vector_function_equal(ex04decide_prior, card = example_deck$card, 
                               deck = example_deck$deck, .expected = "smaller")
  
  example_deck <- list(
    card = data.frame(colour = "green", number = 7), 
    deck = data.frame(colour = c("black", "orange", "white", "black"),
                      number = c(8, 9, 1, 3)), 
    history = NULL)
  expect_subset(ex04decide_prior(card = example_deck$card, deck = example_deck$deck),
                c("larger", "smaller"))
})


test_that("Exercise 04: e: Examples", {
  exerciseTest("4.51")
  expect_vector_function_equal(ex04reward, decision = "equal", new_number = 2, 
                               old_number = 6, .expected = -1)
  expect_vector_function_equal(ex04reward, decision = "equal", new_number = 5, 
                               old_number = 5, .expected = 1)
  expect_vector_function_equal(ex04reward, decision = "larger", new_number = 5, 
                               old_number = 6, .expected = -1)
  expect_vector_function_equal(ex04reward, decision = "smaller", new_number = 5, 
                               old_number = 6, .expected = 1)
})

test_that("Exercise 04: e: Errors are thrown ", {
  exerciseTest("4.52")
  expect_error(ex04reward("larger", -5, 6))
  expect_error(ex04reward("larger", c(1, 1), 1))
})


test_that("Exercise 04: e: Additional tests", {
  exerciseTest("4.53")
  expect_vector_function_equal(ex04reward, decision = "larger", new_number = 6, 
                               old_number = 5, .expected = 1)
  expect_error(ex04reward(c("larger", "smaller"), 1, 1))
})
