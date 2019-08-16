#Creates two plots - one with indices from the pre-STAR model and one with 
#only indices from the post-STAR model
#NOTE PISCO is now in there are the 15+ so need to re-add if you want to re-plot pre-STAR after 8/16/2019

library(ggplot2)
library(dplyr)
library(tidyr)
setwd('C:/GopherBlackYellow2019/txt_files')


Indices = read.csv('Indices.csv', header=T)

#need to divide each index by its mean

Indices = Indices %>%
          select(Year, DebVWI, NMRFSSI, SMRFSSI, NOnboardI, SOnboardI, CCFRPI, PISCOI, PISCO0I)

scale <- function(x, na.rm = TRUE) (x / mean(x, na.rm = na.rm))

Indices_mean1 = Indices %>%
              mutate_at(c("DebVWI","NMRFSSI",'SMRFSSI', 'NOnboardI', 
                          'SOnboardI','CCFRPI', 'PISCOI','PISCO0I'), scale)

Indices_mean = Indices_mean1 %>%
  rename(DebVW_onboard_observer = DebVWI, MRFSS_North = NMRFSSI, MRFSS_South=SMRFSSI,
         Onboard_observer_North = NOnboardI, Onboard_observer_South = SOnboardI,
         CCFRP = CCFRPI, PISCO = PISCOI, PISCO0 = PISCO0I) %>%
  gather(Source, Scaled_index, DebVW_onboard_observer:PISCO0) 


Indices_mean$Source = factor(Indices_mean$Source,
                             levels = c('MRFSS_North', 'MRFSS_South',
                                        'DebVW_onboard_observer',
                                        'Onboard_observer_North',
                                        'Onboard_observer_South',
                                        'PISCO','CCFRP','PISCO_age0'))



#plot just the pre-STAR indices - see note at top about PISCO
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

#############################################################################################
#plot just the post-STAR indices - see note at top about PISCO

Indices_mean_post = Indices_mean1 %>%
                   select(Year, DebVWI, NMRFSSI, NOnboardI, CCFRPI, PISCOI, PISCO0I)

Indices_mean_post = Indices_mean_post %>%
  rename(DebVW_onboard_observer = DebVWI, MRFSS_North = NMRFSSI, 
         Onboard_observer_North = NOnboardI,
         CCFRP = CCFRPI, PISCO = PISCOI, PISCO0 = PISCO0I) %>%
  gather(Source, Scaled_index, DebVW_onboard_observer:PISCO0) 

Indices_mean_post$Source = factor(Indices_mean$Source,
                             levels = c('MRFSS_North',
                                        'DebVW_onboard_observer',
                                        'Onboard_observer_North',
                                        'CCFRP','PISCO','PISCO_age0'))


out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"All_index_compare_postSTAR.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(Indices_mean_post, aes(x=Year, y = Scaled_index, colour=Source)) +
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

