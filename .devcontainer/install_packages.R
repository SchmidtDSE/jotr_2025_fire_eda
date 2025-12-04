# Install only packages used in black_rock_fire_exploration.qmd
packages <- c(
  "tidyverse",     # includes readr
  "sf",
  "raster",
  "exactextractr",
  "leaflet",
  "htmlwidgets",
  "viridis",
  "scales",
  "ggridges",
  "RColorBrewer",
  "knitr"          # for rendering Quarto
)

# Install packages into renv
for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    renv::install(pkg)
  }
}

# Create snapshot of minimal environment
renv::snapshot()
