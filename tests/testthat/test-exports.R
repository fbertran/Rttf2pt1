test_that("exported function which_ttf2pt1 exists", {
  expect_true("which_ttf2pt1" %in% getNamespaceExports("Rttf2pt1"))
  expect_true(is.function(Rttf2pt1::which_ttf2pt1))
})
