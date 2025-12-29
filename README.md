
# lookups

### 👋 Welcome to the `lookups` package!

Thank you for using `lookups`. This package is designed to be a “one
stop shop” for all your data lookup needs. Our goal is to save you time
and reduce errors by providing clean, standardized, and ready-to-use
datasets for your analysis.

------------------------------------------------------------------------

## 📦 What does this package do?

The `lookups` package eliminates the need to manually hunt for CSVs on
StatsWales or external websites. It stores optimized, pre-cleaned
versions of essential Welsh datasets directly within R.

With a single function—`use_lookup()`—you can instantly access:

- **GP Practice Master List:** A comprehensive directory of all Welsh GP
  surgeries, including their `wcode`, official names, and their mappings
  to **Clusters** and **Health Boards**.

- **WIMD 2025 and Urban/Rural Status:** The latest Welsh Index of
  Multiple Deprivation data. This includes ranks, deciles, quintiles,
  and specialized **Urban/Rural flags** for every LSOA in Wales.

- **Postcode to LSOA Mapping:** A lightning-fast lookup for Welsh
  postcodes (2021 boundaries) that allows you to join postcodes to Lower
  Super Output Area (LSOA)

- **Schools Master List:** A list of all schools in Wales, categorized
  by Postcodes and Local Authority.

------------------------------------------------------------------------

## 🚀 Installation

You can install the development version of `lookups` directly from
GitHub using the following commands:

``` r
# If you don't have devtools installed:
# install.packages("devtools")

# Install the package
devtools::install_github("singhdevang111/lookups")

# Load the package
library(lookups)
```

``` r
## 📖 Getting Started & Documentation

Once the package is installed and loaded, you can dive straight into the documentation to see the full list of available columns and usage examples.

To read the documentation, simply run:

help(package = lookups)
```
