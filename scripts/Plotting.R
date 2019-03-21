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
  geom_point()+
  geom_smooth()

ggplot(DS_polytunnel_spike_corrected)+
  geom_point(mapping = aes(y = spike_length_mm, x = flowering_day))+
  geom_line()

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
  geom_smooth()
#  facet_wrap(~line.name)

# Height vs flowering day
ggplot(DS_polytunnel_spike_corrected, aes(x = flowering_day, y = height_mm))+
  geom_point()+
  facet_wrap(~line.name)

## One discrete vs. one continuous
# seed weight vs. empty spike
ggplot(DS_polytunnel_spike_corrected, aes(y = seed_weight_g, x = empty_spike))+
  geom_col()# +
#  facet_wrap(~line.name)

# # seed weight vs. tiller count 
ggplot(DS_polytunnel_spike_corrected, aes(y = seed_weight_g, x = tiller_count))+ 
  geom_col(stat = 'summary')#+
#  facet_wrap(~line.name)
# 
# # seed weight vs. spikelet number
ggplot(DS_polytunnel_spike_corrected, aes(y = seed_weight_g, x = spikelet_number))+ 
   geom_col(stat = 'summary')#+
# #  facet_wrap(~line.name)
# 
# # seed weight vs. final leaf number
#ggplot(DS_polytunnel_spike_corrected, aes(y = seed_weight_g, x = final_leaf_number))+ 
#     geom_col(stat = summary)
# 
# # height vs. final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(y = height_mm, x = final_leaf_number))+ 
  geom_point()+
  geom_smooth()

ggplot(DS_polytunnel_spike_corrected, aes(y = mean(height_mm), x = final_leaf_number))+ 
  geom_col()

ggplot(DS_polytunnel_spike_corrected, aes(y = height_mm, x = final_leaf_number))+ 
  geom_col()

# spike length vs. final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = final_leaf_number))+ 
  geom_col()+
  coord_polar()

# flowering day vs. final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(y = flowering_day, x = final_leaf_number))+ 
  geom_point()+
  geom_smooth()# +
#  geom_label(aes(label = line.name))

# spikelet number vs height
ggplot(DS_polytunnel_spike_corrected, aes(x = spikelet_number, y = height_mm))+ 
  geom_point()+
  geom_smooth()

# spikelet number vs spike length
ggplot(DS_polytunnel_spike_corrected, aes(x = spikelet_number, y = spike_length_mm))+ 
  geom_point()+
  geom_smooth()

# spikelet number vs flowering day
ggplot(DS_polytunnel_spike_corrected, aes(x = spikelet_number, y = flowering_day))+ 
  geom_point()+
  geom_smooth()

# tiller count vs. spike length
ggplot(DS_polytunnel_spike_corrected, aes(x = tiller_count, y = spike_length_mm))+ 
  geom_point()+
  geom_smooth()

# tiller count vs. flowering day
ggplot(DS_polytunnel_spike_corrected, aes(x = tiller_count, y = flowering_day))+ 
  geom_point()+
  geom_smooth()

# empty spike vs. flowering day
ggplot(DS_polytunnel_spike_corrected, aes(x = empty_spike, y = flowering_day))+ 
  geom_point()+
  geom_smooth()

# height vs. tiller count
ggplot(DS_polytunnel_spike_corrected, aes(x = tiller_count, y = height_mm))+ 
  geom_point()+
  geom_smooth()

# height vs. empty_spike
ggplot(DS_polytunnel_spike_corrected, aes(x = empty_spike, y = height_mm))+ 
  geom_point()+
  geom_smooth()

# spike length vs. empty_spike
ggplot(DS_polytunnel_spike_corrected, aes(x = empty_spike, y = spike_length_mm))+ 
  geom_point()+
  geom_smooth()


## Two discrete values
# Spikelet number vs final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(x = spikelet_number, y = final_leaf_number))+ 
  geom_count()

# tiller count vs final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(x = tiller_count, y = final_leaf_number))+ 
  geom_count()

# empty spike vs final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(x = empty_spike, y = final_leaf_number))+ 
  geom_count()

# empty spike vs spikelet number
ggplot(DS_polytunnel_spike_corrected, aes(x = empty_spike, y = spikelet_number))+ 
  geom_count()

# tiller count vs spikelet number
ggplot(DS_polytunnel_spike_corrected, aes(x = tiller_count, y = spikelet_number))+ 
  geom_count()

# tiller count vs empty spike
ggplot(DS_polytunnel_spike_corrected, aes(x = tiller_count, y = empty_spike))+ 
  geom_count()





## Single discrete variable counts
#Final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(final_leaf_number)) +
  geom_bar() +
  coord_polar()

# Same on wider data set but had to change y to log but it isn't obvious in final figure
ggplot(DS_polytunnel_vis_long, aes(final_leaf_number)) +
  geom_bar() +
  scale_y_log10()+
  coord_polar()
 
#spikelet number
ggplot(DS_polytunnel_spike_corrected, aes(spikelet_number)) +
  geom_bar()

#s tiller count
ggplot(DS_polytunnel_spike_corrected, aes(tiller_count)) +
  geom_bar()

# empty spike
ggplot(DS_polytunnel_spike_corrected, aes(empty_spike)) +
  geom_bar()
