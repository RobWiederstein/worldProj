world <- sf::st_read("./data/world_small.shp") %>% st_difference()

#crs <- crsuggest::suggest_crs(world)
subset(crs, crs_code == "6933")

bbox <- st_bbox(c(xmin = -180, xmax = 180, 
            ymin = -85.06, ymax = 85.06),
          crs = 4326) %>% 
    st_as_sfc()
sf_use_s2(FALSE)
world_crop <- st_crop(world, bbox)
world_tran <- st_transform(world_crop, crs = "+proj=merc +a=6378137 +b=6378137 +lat_ts=0 +lon_0=0 +x_0=0 +y_0=0 +k=1 +units=m +nadgrids=@null +wktext +no_defs")
ggplot() +
  geom_sf(data = world_tran) +
  coord_sf(expand = F, ylim = c(-9e6, 1.2e7)) +
  theme_bw() +
  labs(title = "Projected")
