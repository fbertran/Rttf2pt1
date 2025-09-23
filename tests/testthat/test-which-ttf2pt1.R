test_that("which_ttf2pt1 returns a single string path or errors helpfully", {
  res <- tryCatch(Rttf2pt1::which_ttf2pt1(), error = function(e) e)
  if (inherits(res, "error")) {
    expect_match(conditionMessage(res), "ttf2pt1", ignore.case = TRUE)
    expect_match(conditionMessage(res), "not found|could not|missing|binary", ignore.case = TRUE)
  } else {
    expect_type(res, "character")
    expect_equal(length(res), 1L)
    expect_true(nchar(res) > 0)
  }
})
