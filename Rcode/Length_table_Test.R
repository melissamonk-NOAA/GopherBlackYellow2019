length_sample = read.csv('C:/GopherBlackYellow2019/txt_files/LengthSampleSize.csv')

length_trips = length_sample %>%
                 select(Year, Ntrips, Source) %>%
                 spread(Source, Ntrips) %>%
                 rename_at(vars(-Year), function(x) paste0("Trip_", x))

length_fish = length_sample %>%
              select(Year, Nmeasured, Source) %>%
              spread(Source, Nmeasured) %>%
              rename_at(vars(-Year), function(x) paste0("Fish_", x))


lengths_all = inner_join(length_trips, length_fish)

lengths_all = lengths_all[,c(1,2 )]
	
