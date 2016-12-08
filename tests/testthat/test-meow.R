test_that("test meow success", {
  success <- suppressWarnings(tryCatch(meow(), error = function(e) meow()))
  expect_true(success)
})
