# Joshua Tree National Park Fire Analyses

**The up-to-date version of these analyses can be viewed [here on GitHub Pages](https://schmidtdse.github.io/eureka_fire_eda/)!**

This repository contains input data and outputs for fire impact assessments within Joshua Tree National Park (JOTR). These analyses support the post-fire reporting requirements of the National Park Service (NPS), with an emphasis on timeliness and accuracy.

## 🔥 Fire Analyses

- **[Eureka Fire](fires/eureka/eureka_fire_exploration.qmd)** - Analysis of vegetation impacts after the [Eureka Fire](https://www.fire.ca.gov/incidents/2025/5/30/eureka-fire) (May 2025)
- **[Black Rock Fire](fires/black_rock/black_rock_fire_exploration.qmd)** - Analysis of the Black Rock Fire

---

## Development Setup

#### `renv`

This analysis uses `renv` for package management using R version `4.4.3`. This can be installed using `renv::refresh()` when inside of the working directory in RStudio. 

#### VSCode Dev Container

Alternatively, one can run the analysis in `VSCode` using:

- `VSCode`
- the `Dev Containers` extension within `VSCode`
- `Docker` (Docker Desktop or a preferred alternative)

Then, within the repository in `VSCode`, run:

- `Cmd + Shift + P -> Dev Containers: Reopen in Container`

When inside the container, to knit / render a `Quarto` document, run:

- `Cmd + Shift + P -> Quarto: Render Document`, with the desired `.qmd` file open.

---

## 📂 Repository Structure

```plaintext
📂 eureka_fire_eda/
├── fires/
│   ├── eureka/
│   │   ├── eureka_fire_exploration.qmd       Main Eureka fire analysis notebook
│   │   ├── NDVI_planetscope.R                Pre/post-burn NDVI script
│   │   ├── inputs/
│   │   │   └── refined_rbr.tif               Eureka fire RBR raster
│   │   └── outputs/
│   │       ├── fire_perimeter/               Extracted fire boundary
│   │       ├── NDVI_EurekaFire.png           NDVI visualization
│   │       └── *.csv                         Summary statistics
│   │
│   └── black_rock/
│       ├── black_rock_fire_exploration.qmd   Black Rock fire analysis notebook
│       ├── inputs/
│       │   └── black-rock-severity-rbr-dev.tif
│       └── outputs/
│
├── shared_inputs/
│   ├── jotrgeodata.gpkg                      Vegetation polygons (JOTR_VegPolys layer)
│   └── HistFires_JOTR_MOJA/                  Historic fires shapefile
│
├── docs/                                     Rendered HTML output for GitHub Pages
├── _quarto.yml                               Quarto site configuration
├── index.qmd                                 Site landing page
└── README.md                                 This file
```

---

## Data Sources

- **Relativized Burn Ratio (RBR)**: Derived from the [Fire Severity Tool](https://storage.googleapis.com/fire-recovery-web/prod/fireSeverity.html) by the Schmidt Center for Data Science and Environment.
- **Vegetation Polygons**: [Geospatial data for the Vegetation Mapping Inventory Project of JOTR](https://irma.nps.gov/DataStore/Reference/Profile/2233319), provided by the National Park Service (NPS).
- **Historic Fires**: [Historic fires shapefile](https://www.fire.ca.gov/what-we-do/fire-resource-assessment-program/fire-perimeters) filtered to JOTR and Mojave National Preserve boundaries, from CAL FIRE.
