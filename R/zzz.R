.onAttach <- function(libname, pkgname) {

  # 1. Get current installed version
  local_version <- utils::packageVersion("lookups")

  # 2. Try to get the latest version from GitHub
  # We use a try-catch so the package still loads if they have no internet
  latest_version <- tryCatch({
    # Point this to your RAW Description file on GitHub
    url <- "https://raw.githubusercontent.com/singhdevang111/lookups/main/DESCRIPTION"
    desc <- readLines(url, warn = FALSE)
    v_line <- desc[grep("^Version:", desc)]
    gsub("Version: ", "", v_line)
  }, error = function(e) NULL)

  # 3. Compare and notify
  if (!is.null(latest_version) && local_version < latest_version) {
    packageStartupMessage(paste0(
      "\n",
      "****************************************************************\n",
      "  A NEW VERSION of 'lookups' (v", latest_version, ") is available!\n",
      "  Your version: ", local_version, "\n\n",
      "  Please run the following to update:\n",
      "  devtools::install_github('singhdevang111/lookups')\n",
      "****************************************************************\n"
    ))
  }
}
