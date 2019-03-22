## The most interesting plots to play with...

# Seed weight vs spike length
ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = seed_weight_g))+
  geom_point()+
  facet_wrap(~line.name)
  geom_smooth(method = lm) +
  
  
# Height vs. Spike length
ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = height_mm))+
  geom_point()+
  geom_smooth()
#  facet_wrap(~line.name)


# ## One discrete vs. one continuous
# # # seed weight vs. tiller count 
# ggplot(DS_polytunnel_spike_corrected, aes(y = seed_weight_g, x = tiller_count))+ 
#   geom_col(stat = 'summary')#+  # returns mean
# #  facet_wrap(~line.name)

# height vs. final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(y = height_mm, x = final_leaf_number))+ 
  geom_point()+
  geom_smooth()

ggplot(DS_polytunnel_vis_long, aes(y = height_mm, x = final_leaf_number))+ 
  geom_point()+
  geom_smooth()

# spike length vs. final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = final_leaf_number))+ 
  geom_col()+
  coord_polar()

# flowering day vs. final leaf number
ggplot(DS_polytunnel_spike_corrected, aes(x = flowering_day, y = final_leaf_number))+ 
  geom_point(aes(colour = seed_weight_g))+
  scale_color_gradientn(colours = rainbow(6))+
  geom_smooth()# +
#  geom_label(aes(label = line.name))

ggplot(DS_polytunnel_vis_long, aes(x = flowering_day, y = final_leaf_number))+ 
  geom_point(aes(colour = seed_weight_g))+
  scale_color_gradientn(colours = rainbow(6))+
  geom_smooth()

# spikelet number vs spike length
ggplot(DS_polytunnel_spike_corrected, aes(x = spikelet_number, y = spike_length_mm))+ 
  geom_point()+
  geom_smooth()

ggplot(DS_polytunnel_vis_long, aes(x = spikelet_number, y = spike_length_mm))+ 
  geom_point()+
  geom_smooth()

# empty spike vs spikelet number
ggplot(DS_polytunnel_spike_corrected, aes(x = empty_spike, y = spikelet_number))+ 
  geom_count()





ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = flowering_day))+
  geom_point(aes(colour = seed_weight_g))+
  facet_wrap(~line.name)+
  scale_color_gradientn(colours = rainbow(6)) +
  theme(panel.background = element_rect( fill = "#9B1010"))

ggplot(DS_polytunnel_spike_corrected, aes(y = spike_length_mm, x = flowering_day))+
  geom_point(aes(colour = seed_weight_g))+
  facet_wrap(~line.name)+
  scale_color_continuous() +
  theme(panel.background = element_rect( fill = "#f87385"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())



ggplot(DS_polytunnel_spike_corrected, aes(y = flowering_day, x = line.name))+
  geom_point(aes(colour = seed_weight_g)) + 
  geom_boxplot(alpha = 0)+
  theme(panel.grid.minor = element_blank(),
        axis.text.x = element_text(angle = 60, hjust = 1),
        panel.background = element_rect( fill = "#edf8b1"))



ggplot(DS_polytunnel_spike_corrected, aes(y = seed_weight_g, x = flowering_day))+
  geom_point()+
  facet_wrap(~line.name)+
  scale_color_continuous() +
  theme(panel.background = element_rect( fill = "#f87385"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
