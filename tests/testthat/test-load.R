context("Package loads")

test_that("package namespace is available", {
  expect_true("Rttf2pt1" %in% loadedNamespaces() || requireNamespace("Rttf2pt1", quietly = TRUE))
  ns <- asNamespace("Rttf2pt1")
  expect_true(is.environment(ns))
})
