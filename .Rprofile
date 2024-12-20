options(renv.verbose = FALSE)
options(renv.config.synchronized.check = FALSE)
library("grDevices")
if (.Platform$OS.type == "windows") {
  # don't use curl as it makes trouble on some peoples' windows machines
  options(renv.download.override = utils::download.file)
}
options(renv.config.install.transactional = FALSE)
options(renv.config.repos.override = "https://packagemanager.posit.co/cran/2024-10-01")
options(renv.config.auto.snapshot = FALSE)
options(repos = c(CRAN = "https://packagemanager.posit.co/cran/2024-10-01"))
source("renv/activate.R")
if (!suppressWarnings(renv::status()$synchronized)) {
  cat("\n- Project is not synchronized with Lockfile.\n- Run 'renv::restore()' to install required Packages!\n")
}
options(renv.verbose = TRUE)
options(renv.config.synchronized.check = TRUE)
suppressWarnings(require(checkmate))
