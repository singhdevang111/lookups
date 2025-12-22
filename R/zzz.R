.onAttach <- function(libname, pkgname) {
  local_version <- utils::packageVersion("lookups")

  # Use suppressWarnings so the user doesn't see "404 Not Found" or connection errors
  latest_version <- tryCatch({
    url <- "https://raw.githubusercontent.com/singhdevang111/lookups/main/DESCRIPTION"

    # suppressWarnings hides the connection issues from the user
    desc <- suppressWarnings(readLines(url, warn = FALSE))

    v_line <- desc[grep("^Version:", desc)]
    gsub("Version: ", "", v_line)
  }, error = function(e) NULL)

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
