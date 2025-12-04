setwd("~/.../validation_BlackRockFire") # adapt path

library(tidyverse)
library(sf)
library(terra)
library(tidyterra)

NDVI = function(raster) {
 ndvi_r = (raster[[4]] - raster[[3]]) / (raster[[4]] + raster[[3]])
 
 return(ndvi_r)
}
  
raster_prefire = terra::rast('inputs/2025-05-27_strip_8094341_composite_file_format.tif')
raster_postfire = terra::rast('inputs/2025-06-09_strip_8121430_composite_file_format.tif')

NDVI_prefire = NDVI(raster_prefire)
NDVI_postfire = NDVI(raster_postfire)

NDndvi = (NDVI_postfire - NDVI_prefire)/ NDVI_prefire

p_prefire = ggplot() + theme_bw() + ggtitle('NDVI Pre-Fire (May 27, 2025)') +
  geom_spatraster(data = NDVI_prefire) +
  scico::scale_fill_scico(name = 'NDVI', palette = 'batlow', 
                          direction = -1, limits = c(0, 0.34)) +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  theme(legend.position = 'bottom',
        axis.text.x = element_text(angle = 90))

p_postfire = ggplot() + theme_bw() + ggtitle('NDVI Post-Fire (June 9, 2025)') +
  geom_spatraster(data = NDVI_postfire) +
  scico::scale_fill_scico(name = 'NDVI', palette = 'batlow', 
                          direction = -1, , limits = c(0, 0.34)) +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  theme(legend.position = 'bottom',
        axis.text.x = element_text(angle = 90))

(p_diff = ggplot() + theme_bw() + ggtitle(expression(Delta[n]~' = (NDVI' [post]~' - NDVI' [pre]~') / NDVI' [pre])) +
  geom_spatraster(data = NDndvi) +
  scico::scale_fill_scico(name = expression(Delta[n]), palette = 'vik', midpoint = 0,
                          direction = -1) +
  scale_x_continuous(expand = c(0,0)) +
  scale_y_continuous(expand = c(0,0)) +
  theme(legend.position = 'bottom',
  axis.text.x = element_text(angle = 90)))


plot = cowplot::plot_grid(p_prefire, p_postfire, p_diff, ncol = 3)
plot
ggsave('outputs/NDVI_BlackRockFire.png')
