.onAttach <- function(libname, pkgname) {
  local_v <- utils::packageVersion("lookups")

  # 1. Check GitHub for the latest version
  latest_v <- tryCatch({
    url <- "https://raw.githubusercontent.com/singhdevang111/lookups/master/DESCRIPTION"
    desc <- suppressWarnings(readLines(url, warn = FALSE))
    v_line <- desc[grep("^Version:", desc)]
    if(length(v_line) > 0) gsub("Version: ", "", v_line) else NULL
  }, error = function(e) { NULL })

  # 2. Provide clear version feedback
  if (!is.null(latest_v)) {
    if (local_v < latest_v) {
      # Scenario: Update is available
      packageStartupMessage(paste0(
        "\n****************************************************************\n",
        "  UPDATE AVAILABLE: A newer version of 'lookups' (v", latest_v, ") exists!\n",
        "  Your version: ", local_v, "\n",
        "  Run devtools::install_github('singhdevang111/lookups') to update.\n",
        "****************************************************************\n"
      ))
    } else {
      # Scenario: User is on the latest version
      packageStartupMessage(paste0(
        "Checking for updates... You are on the latest package version (v", local_v, ")."
      ))
    }
  } else {
    # Scenario: Offline or GitHub connection failed
    packageStartupMessage(paste0("Loaded 'lookups' v", local_v))
  }
}
