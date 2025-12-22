.onAttach <- function(libname, pkgname) {
  local_version <- utils::packageVersion("lookups")

  # 1. Try to get the latest version from GitHub
  latest_version <- tryCatch({
    url <- "https://raw.githubusercontent.com/singhdevang111/lookups/master/DESCRIPTION"

    # suppressWarnings hides the connection issues/404s from the user
    desc <- suppressWarnings(readLines(url, warn = FALSE))

    v_line <- desc[grep("^Version:", desc)]
    if(length(v_line) > 0) gsub("Version: ", "", v_line) else NULL
  }, error = function(e) NULL)

  # 2. Provide the appropriate feedback message
  if (!is.null(latest_version)) {
    if (local_version < latest_version) {
      # Scenario: Update required
      packageStartupMessage(paste0(
        "\n",
        "****************************************************************\n",
        "  UPDATE AVAILABLE: A newer version of 'lookups' (v", latest_version, ") exists!\n",
        "  Your version: ", local_version, "\n",
        "  Run devtools::install_github('singhdevang111/lookups') to update.\n",
        "****************************************************************\n"
      ))
    } else {
      # Scenario: Up to date (This is what you want to see every time)
      packageStartupMessage(paste0(
        "Checking for updates... You are using the latest version of 'lookups' (v", local_version, ")."
      ))
    }
  } else {
    # Optional: Offline or GitHub unavailable message
    packageStartupMessage(paste0("Loaded 'lookups' v", local_version, " (Offline mode)."))
  }
}
