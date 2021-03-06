library(usethis)
library(sf)
library(tidyverse)

unzip_and_clean <- function(f) {
  fz <- unzip(zipfile = f, list = TRUE)
  unzip(zipfile = f)
  dsn <- fz$Name[grep(".shp", fz$Name)]
  layer <- gsub(".shp", "", dsn)
  x <- st_read(dsn = ".", layer = layer)
  file.remove(fz$Name)
  layer_name <- gsub("-", "_", layer)
  print(layer_name)
  return(x)
}

proj_nzsf <- "+proj=aea +lat_1=-30 +lat_2=-50 +lat=-40 +lon_0=175 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"

# Various ----

FisheriesManagementAreas <- unzip_and_clean("FisheriesManagementAreas.zip") %>%
  select(-Descriptio) %>%
  rename(SpeciesCode = SpeciesCod)
use_data(FisheriesManagementAreas, overwrite = TRUE)

nz_fisheries_general_statistical_areas <- unzip_and_clean("kx-nz-fisheries-general-statistical-areas-SHP.zip") %>%
  select(-Descriptio)
use_data(nz_fisheries_general_statistical_areas, overwrite = TRUE)

territorial_sea_outer_limit_12_mile <- unzip_and_clean("lds-12-mile-territorial-sea-outer-limit-SHP.zip")
use_data(territorial_sea_outer_limit_12_mile, overwrite = TRUE)

exclusive_economic_zone_outer_limits_200_mile <- unzip_and_clean("lds-200-mile-exclusive-economic-zone-outer-limits-SHP.zip")
use_data(exclusive_economic_zone_outer_limits_200_mile, overwrite = TRUE)

coastline_polyline_hydro_14k_122k <- unzip_and_clean("lds-coastline-polyline-hydro-14k-122k-SHP.zip")
use_data(coastline_polyline_hydro_14k_122k, overwrite = TRUE)

# New Zealand coastline ----

nz_coastlines_and_islands_polygons_topo_150k <- unzip_and_clean("lds-nz-coastlines-and-islands-polygons-topo-150k-SHP.zip")
use_data(nz_coastlines_and_islands_polygons_topo_150k, overwrite = TRUE)

nz_coastlines_and_islands_polygons_topo_1250k <- unzip_and_clean("lds-nz-coastlines-and-islands-polygons-topo-1250k-SHP.zip")
use_data(nz_coastlines_and_islands_polygons_topo_1250k, overwrite = TRUE)

nz_coastlines_and_islands_polygons_topo_1500k <- unzip_and_clean("lds-nz-coastlines-and-islands-polygons-topo-1500k-SHP.zip")
use_data(nz_coastlines_and_islands_polygons_topo_1500k, overwrite = TRUE)

nz_coastlines_topo_150k <- unzip_and_clean("lds-nz-coastlines-topo-150k-SHP.zip")
use_data(nz_coastlines_topo_150k, overwrite = TRUE)

nz_coastlines_topo_1250k <- unzip_and_clean("lds-nz-coastlines-topo-1250k-SHP.zip")
use_data(nz_coastlines_topo_1250k, overwrite = TRUE)

nz_coastlines_topo_1500k <- unzip_and_clean("lds-nz-coastlines-topo-1500k-SHP.zip")
use_data(nz_coastlines_topo_1500k, overwrite = TRUE)

# Finfish Quota Management Areas (QMAs) ----

HAKE_QMA <- unzip_and_clean("HAKE_QMA.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(HAKE_QMA, overwrite = TRUE)

HOKI_QMA <- unzip_and_clean("HOKI_QMA.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(HOKI_QMA, overwrite = TRUE)

JackMackerel_QMA <- unzip_and_clean("JackMackerel_QMA.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(JackMackerel_QMA, overwrite = TRUE)

LING_QMA <- unzip_and_clean("LING_QMA.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(LING_QMA, overwrite = TRUE)

OrangeRoughy_QMA <- unzip_and_clean("OrangeRoughy_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(OrangeRoughy_QMA, overwrite = TRUE)

OREO_QMA <- unzip_and_clean("OREO_QMA.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(OREO_QMA, overwrite = TRUE)

SilverWarehou_QMA <- unzip_and_clean("SilverWarehou_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(SilverWarehou_QMA, overwrite = TRUE)

SouthernBlueWhiting_QMA <- unzip_and_clean("SouthernBlueWhiting_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(SouthernBlueWhiting_QMA, overwrite = TRUE)

# Shellfish Quota Management Areas (QMAs) ----

Cockle_QMA <- unzip_and_clean("Cockle_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon, QmaName)
use_data(Cockle_QMA, overwrite = TRUE)

Paua_QMA <- unzip_and_clean("Paua_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(Paua_QMA, overwrite = TRUE)

Pipi_QMA <- unzip_and_clean("Pipi_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon, QmaName)
use_data(Pipi_QMA, overwrite = TRUE)

Scallop_QMA <- unzip_and_clean("Scallop_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon, QmaName)
use_data(Scallop_QMA, overwrite = TRUE)

# Rock lobsters ----

PackhorseRockLobster_QMA <- unzip_and_clean("QMA_Packhorse_rocklobster_region.zip") %>% 
  rename(QMA = CODE, SpeciesCode = CODE0, SpeciesScientific = NAME0, SpeciesCommmon = NAME) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(PackhorseRockLobster_QMA, overwrite = TRUE)

SpinyRedRockLobster_QMA <- unzip_and_clean("SpinyRedRockLobster_QMAs.zip") %>% 
  rename(QMA = FishstockC, SpeciesCode = SpeciesCod, SpeciesScientific = SpeciesSci, SpeciesCommmon = SpeciesCom) %>%
  select(QMA, SpeciesCode, SpeciesScientific, SpeciesCommmon)
use_data(SpinyRedRockLobster_QMA, overwrite = TRUE)

rock_lobster_stat_areas <- unzip_and_clean("rock_lobster_stat_areas.zip") %>% 
  rename(area = AREA_CODE) %>%
  mutate(QMA = case_when(
    area %in% c(901:904, 939) ~ "CRA1",
    area %in% 905:908 ~ "CRA2",
    area %in% 909:911 ~ "CRA3",
    area %in% c(912:915, 934) ~ "CRA4",
    area %in% c(916:919, 932, 933) ~ "CRA5",
    area %in% 940:941 ~ "CRA6",
    area %in% 920:921 ~ "CRA7",
    area %in% 922:928 ~ "CRA8",
    area %in% c(929:931, 935:938) ~ "CRA9",
    TRUE ~ "Unknown"))
use_data(rock_lobster_stat_areas, overwrite = TRUE)

# Marine reserves ----

doc_marine_reserves <- unzip_and_clean("kx-doc-marine-reserves-SHP.zip") %>%
  select(Name)
use_data(doc_marine_reserves, overwrite = TRUE)

# Marine habitats ----

Gisborne_TToR_Habitats <- unzip_and_clean("Gisborne_Te_Tapuwae_o_Rongokako_Habitats.zip") %>%
  rename(Habitat = HABITAT)
use_data(Gisborne_TToR_Habitats, overwrite = TRUE)

Gisborne_TToR_Reefs <- unzip_and_clean("Gisborne_TToR_Reefs.zip") %>%
  select(Reef_name)
use_data(Gisborne_TToR_Reefs, overwrite = TRUE)

Rocky_reef_National_NZ <- unzip_and_clean("Rocky_reef_National_NZ.zip") %>%
  select(Source)
use_data(Rocky_reef_National_NZ, overwrite = TRUE)

# Depth ----

depth_contour_polyline_hydro_122k_190k <- unzip_and_clean("lds-depth-contour-polyline-hydro-122k-190k-SHP.zip") %>% 
  rename(depth = VALDCO) %>%
  select(depth, SCAMIN, SORDAT, SORIND)
use_data(depth_contour_polyline_hydro_122k_190k, overwrite = TRUE)

depth_contour_polyline_hydro_190k_1350k <- unzip_and_clean("lds-depth-contour-polyline-hydro-190k-1350k-SHP.zip") %>% 
  rename(depth = VALDCO) %>%
  select(depth, SCAMIN, SORDAT, SORIND)
use_data(depth_contour_polyline_hydro_190k_1350k, overwrite = TRUE)

depth_contour_polyline_hydro_1350k_11500k <- unzip_and_clean("lds-depth-contour-polyline-hydro-1350k-11500k-SHP.zip") %>%
  rename(depth = VALDCO) %>%
  select(depth, SCAMIN, SORDAT, SORIND)
use_data(depth_contour_polyline_hydro_1350k_11500k, overwrite = TRUE)

# Environmental layers ----

# setwd("/home/darcy/Projects/nzsf/data-raw")
library(raster)

f <- "mfe-average-seasurface-temperature-19932012-GTiff.zip"
fz <- unzip(zipfile = f, list = TRUE)
fz
unzip(zipfile = f)

mfe_average_sst <- raster::raster(x = "average-seasurface-temperature-19932012.tif", values = TRUE) %>%
  projectRaster(crs = proj_nzsf)
names(mfe_average_sst) <- "layer"
mfe_average_sst[mfe_average_sst[] < -5 | mfe_average_sst[] > 60] <- NA
file.remove(fz$Name)
use_data(mfe_average_sst, overwrite = TRUE)
