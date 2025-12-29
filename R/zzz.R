.onAttach <- function(libname, pkgname) {
  local_v <- utils::packageVersion("lookups")

  # Attempt to get the version from GitHub
  latest_v <- try(
    {
      url <- "https://raw.githubusercontent.com/singhdevang111/lookups/master/DESCRIPTION"
      desc <- suppressWarnings(readLines(url, warn = FALSE))
      v_line <- desc[grep("^Version:", desc)]
      if(length(v_line) > 0) gsub("Version: ", "", v_line) else NULL
    },
    silent = TRUE
  )

  # Check if we got a valid result and provide feedback
  if (!is.null(latest_v) && !inherits(latest_v, "try-error")) {
    if (local_v < latest_v) {
      packageStartupMessage(paste0(
        "\n****************************************************************\n",
        "  UPDATE AVAILABLE: A newer version of 'lookups' (v", latest_v, ") exists!\n",
        "  Your version: ", local_v, "\n",
        "  Run devtools::install_github('singhdevang111/lookups') to update.\n",
        "****************************************************************\n"
      ))
    } else {
      packageStartupMessage(paste0(
        "Checking for updates... You are on the latest package version (v", local_v, ")."
      ))
    }
  } else {
    packageStartupMessage(paste0("Loaded 'lookups' v", local_v))
  }
}
