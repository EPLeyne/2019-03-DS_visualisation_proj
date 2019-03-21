library(tidyverse)

# Assign the observations to be dropped from the file
col_drop <- c('fpNodeId', 'packet_stemid', 'position', 'pot_stemid', 'Photo_20181129.60.1', 'Photo_20181204.32.1', 'Flowering Date_20180524.40.1')

# Read the .csv file, drop the unwanted variables, and remove spaces from variable names
DS_polytunnel_vis <- read_csv('raw_data/DS_polytunnel-wide.csv') %>% 
  select(-(col_drop)) %>% 
  dplyr::rename_all(funs(make.names(.)))

# Mutate the different observation columns into common columns and remove the old columns
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, flowering_date = Flowering.Date_20180725.15.1,Flowering.Date_20180817.2.1) %>% 
  select(-starts_with('Flowering.'))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, final_leaf_number = final.leaf.number_20180524.41.1, final.leaf.number_20181204.26.1, final.leaf.number_20181210.31.1) %>% 
  select(-starts_with('final.leaf.number'))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, spikelet_number = spikelet.number_20180524.42.1, spikelet.number_20181204.27.1, spikelet.number_20181210.32.1) %>% 
  select(-starts_with('spikelet.number'))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, height_mm = Height_20180524.43.1, Height_20181204.28.1, Height_20181210.33.1) %>% 
  select(-starts_with("Height_2"))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, tiller_count = tillers_20180524.44.1, tillers_20181204.29.1, tillers_20181210.34.1) %>% 
  select(-starts_with('tillers'))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, spike_length_mm = Spike.Length_20181122.59.1, Spike.Length_20181204.31.1, Spike.Length_20181210.36.1) %>% 
  select(-starts_with('Spike.'))
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, empty_spike = empty.spikelets_20180524.45.1, empty.spikelets_20181204.30.1, empty.spikelets_20181210.35.1) %>% 
  select(-starts_with('empty.'))

# Rename the FieldPrime columns into more manageable column names
DS_polytunnel_vis <- DS_polytunnel_vis %>% 
  rename(vern_end_date = vern_end_date_20190318.1.1) %>% 
  rename(plant_date = plant_date_20190318.1.1) %>% 
  rename(seed_weight_g = seed.weight_20190208.65.1)


#Change formats from num to date
DS_polytunnel_vis$plant_date <- as.character.Date( DS_polytunnel_vis$plant_date) %>% 
  as.Date(format = '%Y%m%d')
DS_polytunnel_vis$vern_end_date <- as.character.Date(DS_polytunnel_vis$vern_end_date) %>% 
  as.Date(format = '%Y%m%d')
DS_polytunnel_vis$flowering_date <- as.character.Date(DS_polytunnel_vis$flowering_date) %>% 
  as.Date(format = '%Y%m%d')

# Create a new column of flowering days
DS_polytunnel_vis <- mutate(DS_polytunnel_vis, flowering_day = (flowering_date - vern_end_date))

# Remove all rows with missing data
DS_polytunnel_vis <- na.omit(DS_polytunnel_vis)

# Create a subset of the first 45 lines (around 100 rows of data)
DS_polytunnel_vis_short <- filter(DS_polytunnel_vis, line.id < 45)

# Create the full data set filtering out the outliers
DS_polytunnel_vis_long <- DS_polytunnel_vis %>% 
  filter(between(spike_length_mm, 10, 300)) %>% 
  filter(final_leaf_number < 15) %>% 
  filter(spike_length_mm < 200)

# Write the two files to .csv files
write_csv(DS_polytunnel_vis, 'worked_data/DS_polytunnel_CAS.csv')
write_csv(DS_polytunnel_vis_short, 'worked_data/DS_polytunnel_CAS_short.csv')


## Attempted to pipe the mutates but without success
# DS_polytunnel_vis %>% 
#   mutate(flowering_date = Flowering.Date_20180725.15.1,Flowering.Date_20180817.2.1,
#          final_leaf_number = final.leaf.number_20180524.41.1, final.leaf.number_20181204.26.1, final.leaf.number_20181210.31.1)# %>% 
#   # mutate(final_leaf_number = final.leaf.number_20180524.41.1, final.leaf.number_20181204.26.1, final.leaf.number_20181210.31.1) %>% 
#   # mutate(spikelet_number = spikelet.number_20180524.42.1, spikelet.number_20181204.27.1, spikelet.number_20181210.32.1) %>% 
#   # mutate(height_mm = Height_20180524.43.1, Height_20181204.28.1, Height_20181210.33.1) %>% 
#   # mutate(tiller_count = tillers_20180524.44.1, tillers_20181204.29.1, tillers_20181210.34.1) %>% 
#   # mutate(spike_length = Spike.Length_20181122.59.1, Spike.Length_20181204.31.1, Spike.Length_20181210.36.1)

