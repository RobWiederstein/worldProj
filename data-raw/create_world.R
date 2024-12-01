library(magrittr)
library(dplyr)
library(rnaturalearth)
library(purrr)

x <- function(scale, ...){
  rnaturalearth::ne_countries(scale = scale) %>% 
  select(sov_a3, mapcolor7, label_x, label_y, geometry)-> map
  sf::st_write(map, paste0("./data/world_", scale, ".shp"))
}

c("small", "medium", "large") %>% 
  purrr::map(x, append = FALSE)
