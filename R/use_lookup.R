#' Access Master Lookup Tables
#'
#' Retrieve one of the standardized lookup tables for analysis.
#'
#' @param dataset A string. The name of the lookup to retrieve.
#'   Must be one of:
#'   \itemize{
#'     \item \code{"gp"}: GP Practice Master Lookup
#'     \item \code{"wimd"}: WIMD 2025 with Rural/Urban flags
#'     \item \code{"schools"}: Schools Master Lookup
#'     \item \code{"lsoa"}: Postcode to LSOA lookup
#'   }
#'
#' @return A data frame containing the requested lookup data.
#'
#' @section Available Data:
#' \subsection{1. GP Practice Lookup ("gp")}{
#'   Contains GP practice codes, names, addresses, and Cluster mapping.
#' }
#'
#' \subsection{2. WIMD 2025 ("wimd")}{
#'   Contains LSOA codes, WIMD ranks, and Rural/Urban classifications.
#' }
#'
#' \subsection{3. Schools Lookup ("schools")}{
#'   Master list of Maintained, Independent, and PRU schools.
#' }
#'
#' \subsection{4. Postcode to LSOA ("lsoa")}{
#'   Links UK Postcodes to LSOA codes.
#' }
#'
#' @export
#' @examples
#' \dontrun{
#' # Get the GP data
#' gp_data <- use_lookup("gp")
#'
#' # Get the School data
#' school_data <- use_lookup("schools")
#' }
use_lookup <- function(dataset) {

  # 1. Validate the input (Case insensitive)
  dataset <- tolower(dataset) # "GP" becomes "gp"
  valid_options <- c("gp", "wimd", "schools", "lsoa")

  if (!dataset %in% valid_options) {
    stop("Invalid dataset name. Options are: 'gp', 'wimd', 'schools', 'lsoa'.")
  }

  # 2. Return the internal data
  if (dataset == "gp") {
    return(gp_master_lookup)
  } else if (dataset == "wimd") {
    return(wimd_master_with_rural_urban_flag)
  } else if (dataset == "schools") {
    return(school_lookup_master)
  } else if (dataset == "lsoa") {
    return(postcode_to_lsoa_clean)
  }
}
