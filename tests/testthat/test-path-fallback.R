context("PATH fallback / error messaging")

test_that("errors if neither bundled binary nor PATH provide ttf2pt1", {
  which_bin <- function() {
    if (.Platform$OS.type == "unix") "ttf2pt1" else "ttf2pt1.exe"
  }
  inst <- get("inst_path", envir = asNamespace("Rttf2pt1"))
  bundled <- file.path(inst(), "exec", .Platform$r_arch, which_bin())
  skip_if(file.exists(bundled), "Bundled binary present; can't force PATH-only scenario.")
  # Clear PATH to force Sys.which("") -> ""
  if (requireNamespace("withr", quietly = TRUE)) {
    withr::local_envvar(PATH = "")
    expect_error(Rttf2pt1::which_ttf2pt1(), "ttf2pt1.*not found", ignore.case = TRUE)
  } else {
    skip("withr not available; skipping PATH manipulation test")
  }
})
