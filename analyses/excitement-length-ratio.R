suppressMessages(library('tidyverse'))
rollercoasters = read_csv('../rollercoasters.csv', 
	col_types = cols(
	  .default = col_integer(),
	  theme = col_character(),
	  rollercoaster_type = col_character(),
	  excitement = col_double(),
	  excitement_rating = col_character(),
	  intensity = col_double(),
	  intensity_rating = col_character(),
	  nausea = col_double(),
	  nausea_rating = col_character(),
	  max_pos_gs = col_double(),
	  max_neg_gs = col_double(),
	  max_lateral_gs = col_double(),
	  total_air_time = col_double()
	)
)

group_data = rollercoasters %>%
	mutate(excite_per_ft = excitement / ride_length) %>%
	group_by(rollercoaster_type) %>%
	summarise(
		excite_per_ft = mean(excite_per_ft),
		excitement = mean(excitement),
		nausea = mean(nausea),
		n = n()
	) %>%
	arrange(-excite_per_ft)


p = ggplot(group_data, aes(reorder(rollercoaster_type, excite_per_ft), excite_per_ft)) +
	geom_col() + 
	xlab('') + 
	ylab('Excitement / Ride Length Ratio') + 
	theme_bw(base_size = 10) +
    coord_flip()

ggsave('excitement-nausea-foot.png', plot=p, width=6, height=3.5, units='in', dpi=120)