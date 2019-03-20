## Creating ggplots
library(tidyverse)

ggplot(DS_polytunnel_vis_short, aes(x=spikelet_number, y=height_mm, colour = final_leaf_number))+
  geom_point()


# Plot of flowering day and spike length, not particularly interesting but highlights...
# outliers that need to be removed
ggplot(DS_polytunnel_vis_short, aes(y = spike_length_mm, x = flowering_day))+
  geom_point()

# Creating a new dataset removing the outliers in the spike_length_mm (definite incorrect data)

DS_polytunnel_spike_corrected <- DS_polytunnel_vis_short %>% 
  filter(between (spike_length_mm,10,200))

# Same plot as above, outliers removed
ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = flowering_day))+
  geom_point()

a <- 'DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day)'
b <- 'flowering_day'


# Creating a data set in which the observatiosn are grouped by the line number
DS_polytunnel_grouped <- DS_polytunnel_spike_corrected %>% 
  group_by(line.id)

# Took 2 contiuous variables at random and tried different mappings
ggplot(DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day))+
  geom_point()

#Coloured the line name, colours too close togther
ggplot(DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day, colour = line.name))+
  geom_point()

#Coloured by line.id, took it as a contiuous variable even though it isn't
ggplot(DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day, colour = line.id))+
  geom_point()

# Added a facet wrap by line name, much easier to see the differences between lines
ggplot(DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day)) +
  geom_point()+
  facet_wrap(~line.name)

ggplot(DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day)) +
  geom_jitter()

ggplot(DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day)) +
  geom_label(aes(label = line.id))

#Little bit of everything
ggplot(DS_polytunnel_vis_short, aes(y = seed_weight_g, x = flowering_day)) +
  geom_point() +
  geom_smooth(method = lm)+
  geom_label(aes(label = line.name))


## Started to work through all the x and y combinations to see anything interesting..
# 2 Continuous variables....
# Seed weight vs spike length
ggplot(DS_polytunnel_spike_corrected, aes(x = spike_length_mm, y = seed_weight_g))+
  geom_point()+
  facet_wrap(~line.name)

# Seed weight vs. height
ggplot(DS_polytunnel_spike_corrected, aes(y = seed_weight_g, x = height_mm))+
  geom_point()+
  facet_wrap(~line.name)

# Height vs. Spike length
ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = height_mm))+
  geom_point()+
  facet_wrap(~line.name)

# Height vs flowering day
ggplot(DS_polytunnel_spike_corrected, aes(x = flowering_day, y = height_mm))+
  geom_point()+
  facet_wrap(~line.name)
