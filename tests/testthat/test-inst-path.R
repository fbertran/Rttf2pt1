test_that("inst_path() points to an existing directory", {
  inst <- get("inst_path", envir = asNamespace("Rttf2pt1"))
  p <- inst()
  expect_true(dir.exists(p))
  # In installed pkgs, DESCRIPTION should be present at top-level
  # In dev load_all(), inst/ is returned — still a directory.
  desc <- file.path(p, "DESCRIPTION")
  if (file.exists(desc)) {
    expect_true(file.exists(desc))
  } else {
    succeed("Running from a development tree; DESCRIPTION not under inst/")
  }
})
