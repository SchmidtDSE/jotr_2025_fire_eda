# Initial assessment of vegetation impacts after the Black Rock Fire

**The up to date version of this analysis (whatever is currently committed to the `main` branch) can be viewed [here on GitHub Pages](https://schmidtdse.github.io/eureka_fire_eda/)!**

This repository contains the input data and outputs for an initial assessment of vegetation impacts after the Black Rock Fire (Joshua Tree National Park, October 2025). These analyses were performed with the intent to support the post-fire reporting requirements of the National Park Service (NPS) within the Joshua Tree National Park (JOTR) Park Unit, with an emphasis on timeliness and accuracy.

Analyses are documented in the Quarto notebook (`black_rock_fire_exploration.qmd`) and the rendered HTML report, published [here on GitHub Pages](https://schmidtdse.github.io/eureka_fire_eda/black_rock_fire_exploration.html). This exploratory analysis also helps characterize burn severity, vegetation types within the burned area, and varying fire history across the fire perimeter to support validation of the [Fire Severity Tool](https://storage.googleapis.com/fire-recovery-web/prod/fireSeverity.html) from the [Schmidt Center for Data Science and Environment (DSE)](https://dse.berkeley.edu/).

---

## Development Setup

#### `renv`

This analysis uses `renv` for package management using R version `4.4.3`. This can be installed using `renv::refresh()` when inside of the working directory in RStudio. 

#### VSCode Dev Container

Alternatively, one can open run analysis in `VSCode` using:

- `VSCode`
- the `Dev Containers` extension within `VSCode`
- `Docker` (Docker Desktop or a preferred alternative)

Then, within the repository in `VSCode`, run:

- `Cmd + Shift + P -> Dev Containers: Reopen in Container`

When inside the container, to knit / render the `Quarto` document, run:

- `Cmd + Shift + P -> Quarto: Render Document`, with the `black_rock_fire_exploration.qmd` file open.

## 📂 Repository Structure

```plaintext
📂 eureka_fire_eda
├── inputs/
│   ├── jotrgeodata.gpkg                                      Vegetation polygons (layer: JOTR_VegPolys)
│   ├── refined_rbr.tif                                       Refined Relative Burn Ratio (RBR) raster
│   ├── HistFires_JOTR_MOJA/                                  Historic fires shapefile and related files
│   ├── 2025-05-27_strip_8121430_composite_file_format.tif    Pre-burn PlanetScope image (needs to be obtained externally - see description below)
│   ├── 2025-06-09_strip_8121430_composite_file_format.tif    Post-burn PlanetScope image (needs to be obtained externally - see description below)
│
├── outputs/
│   ├── fire_perimeter/                     Extracted Black Rock fire boundary (optional export)
│   ├── veg_burned_summary.csv              Vegetation type area inside fire boundary
│   ├── severity_veg_summary.csv            Fire severity stats by vegetation type
│   ├── severity_fire_history.csv           Severity stats by intersecting historic fires
│   ├── severity_veg_firehist.csv           Severity stats by veg type & fire history
│
├── black_rock_fire_exploration_files/
│   ├── figure-html/                        Auto-generated figures used in HTML
│   ├── libs/                               Supporting JS/CSS for interactive widgets
│
├── black_rock_fire_exploration.qmd         Main Quarto analysis notebook
├── black_rock_fire_exploration.html        Rendered HTML report
├── NDVI_planetscope.R                      Additional script for pre/post-burn NDVI from PlanetScope
├── README.md                               Project description & instructions
```

#### Data Sources

- **Relativized Burn Ratio (RBR)**: Derived from the [Fire Severity Tool](https://storage.googleapis.com/fire-recovery-web/prod/fireSeverity.html) by the Schmidt Center for Data Science and Environment.
- **Vegetation Polygons**: [Geospatial data for the Vegetation Mapping Inventory Project of JOTR](https://irma.nps.gov/DataStore/Reference/Profile/2233319), provided by the National Park Service (NPS) as a zip file (`jotrgeodata.zip`), converted via GDAL's `ogr2ogr` to a GeoPackage format.
- **Historic Fires**: [Historic fires shapefile](https://www.fire.ca.gov/what-we-do/fire-resource-assessment-program/fire-perimeters) filtered to JOTR and Mojave National Preserve (MOJN) boundaries, downloaded from the California Department of Forestry and Fire Protection (CAL FIRE) website. The shapefile is included in the `inputs/HistFires_JOTR_MOJA` directory.
- **PlanetScope Images**: Pre and post-burn images for the Black Rock Fire, obtained from PlanetScope. These images are not included in the repository due to size and [licensing restrictions](https://support.planet.com/hc/en-us/articles/22540409084701-Dataset-Sharing-Guidelines-for-the-Education-and-Research-Basic-Program) associated with the University of California's agreement with Planet Labs. You can access them through the PlanetScope API or download them directly if you have access. These are four-band images (RGB-IR), obtained through PlanetScope's [Planet Explorer](https://www.planet.com/explorer/), filtering to the appropriate dates (05/27/2025 for pre-burn and 06/09/2025 for post-burn) and area of interest (Covington Flats area of JOTR). The images used in this analysis are:
  - Pre-burn: `2025-05-27_strip_8121430_composite_file_format.tif`
  - Post-burn: `2025-06-09_strip_8121430_composite_file_format.tif`

## 📑 About This Analysis

### Fire severity analysis

This initial assessment explores the Relativized Burn Ratio (RBR) for the Black Rock Fire (Joshua Tree National Park, October 2025), including:

- Fire burn severity across the entire fire perimeter
- Vegetation types (area and percentage) burned
- Fire burn severity summarized by vegetation type
- Fire burn severity by fire history (noting that much of the area also burned in 2006)
- Fire burn severity jointly by vegetation type and fire history

### PlanetScope analysis

This auxillary analysis investigates pre- and post-burn NDVI baed on PlanetScope satellite images. The images used are four-band images (RGB-IR) that were harmonized (by Planet) using Sentinel-2

Caveat: The main goal of this analysis was to investigate *spatial* differences in NDVI across the burn perimeter. Since the two images were taken my two different satellites, the *temporal* comparison across images would require further bencharking beyond the scope of this study. 
