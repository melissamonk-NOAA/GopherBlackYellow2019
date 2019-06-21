library(ggplot2)
library(dplyr)
library(tidyr)
setwd('C:/GopherBlackYellow2019/txt_files')

#Compare gopher vs gbyr
MRFSS = read.csv('MRFSS_index_compare.csv', header=T)

#look at including false positives or not in the index
MRFSS_SM_N = read.csv('MRFSS_north_index_SM_filter.csv',header=T)

#Plot of MRFSS indices for north and south and GBY and gopher only
MRFSS = MRFSS %>%
  gather(Source,Scaled_index, GPHR_only_N:GBY_S) 

MRFSS$Source <- factor(MRFSS$Source, 
                        levels=c("GPHR_only_N",
                                 "GBY_N",
                                 "GPHR_only_S",
                                 "GBY_S"))


out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"MRFSS_index_compare.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(MRFSS, aes(x=Year, y = Scaled_index, colour=Source)) +
  geom_line(lwd = 1.5) +
  scale_color_manual(values=c("skyblue", "dodgerblue4","darkolivegreen2","darkolivegreen4")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = "top") +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1980,2000, by = 5)) #+
 # scale_y_continuous(breaks = seq(0,100, by = 10))#,expand = c(0, 0)) 

dev.off()


#plot the two possible MRFSS north indices
#Plot of MRFSS indices for north and south and GBY and gopher only
MRFSS_SM_N = MRFSS_SM_N %>%
    gather(Source,Index, Exclude_false_positives:Include_false_positives) 

out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"MRFSS_index_N_SM_falsepos.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(MRFSS_SM_N, aes(x=Year, y = Index, colour=Source)) +
  geom_line(lwd = 1.5) +
  geom_point() +
  scale_color_manual(values=c("dodgerblue4","darkolivegreen4")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = "top") +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1984,2000, by = 2)) +
 scale_y_continuous(breaks = seq(0,.5, by = .10))#,expand = c(0, 0)) 

dev.off()

