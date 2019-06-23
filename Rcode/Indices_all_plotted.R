library(ggplot2)
library(dplyr)
library(tidyr)
setwd('C:/GopherBlackYellow2019/txt_files')


Indices = read.csv('Indices.csv', header=T)

#need to divide each index by its mean

Indices = Indices %>%
          select(Year, DebVWI, NMRFSSI, SMRFSSI, NOnboardI, SOnboardI, CCFRPI, PISCOI)

scale <- function(x, na.rm = TRUE) (x / mean(x, na.rm = na.rm))

Indices_mean = Indices %>%
              mutate_at(c("DebVWI","NMRFSSI",'SMRFSSI', 'NOnboardI', 
                          'SOnboardI','CCFRPI', 'PISCOI'), scale)

Indices_mean = Indices_mean %>%
  rename(DebVW_onboard_observer = DebVWI, MRFSS_North = NMRFSSI, MRFSS_South=SMRFSSI,
         Onboard_observer_North = NOnboardI, Onboard_observer_South = SOnboardI,
         CCFRP = CCFRPI, PISCO = PISCOI) %>%
  gather(Source, Scaled_index, DebVW_onboard_observer:PISCO) 


Indices_mean$Source = factor(Indices_mean$Source,
                             levels = c('MRFSS_North', 'MRFSS_South',
                                        'DebVW_onboard_observer',
                                        'Onboard_observer_North',
                                        'Onboard_observer_South',
                                        'PISCO','CCFRP'))



#plot
out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"All_index_compare.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(Indices_mean, aes(x=Year, y = Scaled_index, colour=Source)) +
  geom_line(lwd = 1.2) +
  geom_point(aes()) +
  scale_color_manual(values=c("dodgerblue4","skyblue","darkgray","deeppink",
                              "goldenrod","darkolivegreen4","blueviolet")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = "top") +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1980,2018, by = 4)) 

dev.off()

