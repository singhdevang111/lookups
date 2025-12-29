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
#' @section Available Data & Columns:
#' \subsection{1. GP Practice Lookup ("gp")}{
#'   Comprehensive list of Welsh GP practices and their organizational mappings.
#'   \itemize{
#'     \item \code{WCode}: National Practice Code
#'     \item \code{Local Health Board}: Responsible Health Board
#'     \item \code{Local Authority}: Local Authority area
#'     \item \code{Practice Name}: Official name of the surgery
#'     \item \code{Practice Address}: Full physical address
#'     \item \code{Postcode}: Practice location postcode
#'     \item \code{Practice Size}: Categorical size (e.g., Small/Medium/Large)
#'     \item \code{Practice Population}: Total registered patients
#'     \item \code{Cluster}: Primary Care Cluster
#'   }
#' }
#'
#' \subsection{2. WIMD 2025 ("wimd")}{
#'   Welsh Index of Multiple Deprivation 2025 data joined with census urban/rural flags.
#'   \itemize{
#'     \item \code{LSOA Code}: 2021 LSOA Code (W01...)
#'     \item \code{LSOA Name}: Descriptive LSOA Name
#'     \item \code{Local Authority}: Local Authority Name
#'     \item \code{WIMD 2025 overall rank}: National rank (1 = most deprived)
#'     \item \code{WIMD 2025 overall decile}: 1-10 scale
#'     \item \code{WIMD 2025 overall quintile}: 1-5 scale
#'     \item \code{WIMD 2025 overall quartile}: 1-4 scale
#'     \item \code{WIMD 2025 overall deprivation group}: Descriptive group name
#'     \item \code{Urban_rural_flag}: Census-based classification
#'   }
#' }
#'
#' \subsection{3. Schools Lookup ("schools")}{
#'   Master list of educational institutions across Wales.
#'   \itemize{
#'     \item \code{School Number}: Unique Welsh school ID
#'     \item \code{School Name}: Name of the school
#'     \item \code{Local Authority}: Local Authority area
#'     \item \code{Address}: Physical address of the school
#'     \item \code{Postcode}: School postcode
#'     \item \code{Data Source}: Origin of the record (Maintained/Independent/PRU)
#'   }
#' }
#'
#' \subsection{4. Postcode to LSOA ("lsoa")}{
#'   Cleaned mapping of Welsh postcodes to geographic boundaries.
#'   \itemize{
#'     \item \code{postcode}: Cleaned postcode (no spaces)
#'     \item \code{LSOA Code}: 2021 LSOA mapping
#'     \item \code{Local Authority}: Local Authority area
#'   }
#' }
#'
#' @export
#' @examples
#' \dontrun{
#' # Access GP lookup
#' gp_lookup_df <- use_lookup("gp")
#'
#' # Access WIMD 2025 data
#' wimd_lookup_df <- use_lookup("wimd")
#'
#' # Access lsoa to postcode lookup
#' losa_postcode_lookup_df <- use_lookup("lsoa")
#'
#' # Access School Master data lookup
#' school_lookup_df <- use_lookup("school")
#' }
use_lookup <- function(dataset) {
  # Normalize input
  dataset <- tolower(dataset)

  # Return data or error
  if (dataset == "gp") return(gp_master_lookup)
  if (dataset == "wimd") return(wimd_master_with_rural_urban_flag)
  if (dataset == "schools") return(school_lookup_master)
  if (dataset == "lsoa") return(postcode_to_lsoa_clean)

  stop("Invalid dataset. Choose from: 'gp', 'wimd', 'schools', or 'lsoa'.")
}


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
