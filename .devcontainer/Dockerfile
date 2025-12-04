# Rocker base image for R with geospatial capabilities
FROM ghcr.io/rocker-org/geospatial:4.4.3 AS base

# Copy project files into container
WORKDIR /workspace
COPY . .

# Install renv
RUN R -e "install.packages('renv')"
RUN R -e "install.packages('languageserver')"

# Restore packages
RUN R -e "renv::restore()"
