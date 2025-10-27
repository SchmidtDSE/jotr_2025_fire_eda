library(terra)
library(sf)

# read in rbr tiff and boundary
rbr <- rast("inputs/black-rock-severity-rbr.tif")
boundary <- st_read("inputs/black-rock-boundary.geojson", quiet = TRUE)

# assuming WGS84 for now
crs(rbr) <- "EPSG:4326"

bb <- st_bbox(boundary)
e <- ext(bb$xmin, bb$xmax, bb$ymin, bb$ymax)
ext(rbr) <- e

rbr <- flip(rbr, direction = "vertical")

# mask to the boundary polygon so outside area is NA
rbr <- mask(rbr, vect(boundary))

# set zeros and negative values (non-burn) to NA
rbr[rbr <= 0] <- NA

# plot
plot(rbr[[1]],
     col = hcl.colors(64, "viridis"),
     axes = TRUE,
     main = "RBR with Boundary")
plot(st_geometry(boundary), add = TRUE, border = "red", lwd = 2)

# save updated tif
writeRaster(
  rbr,
  "inputs/black-rock-severity-rbr-georef.tif",
  overwrite = TRUE,
  filetype = "GTiff",
  NAflag = -9999
)