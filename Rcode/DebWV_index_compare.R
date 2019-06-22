library(ggplot2)
library(dplyr)
library(tidyr)
setwd('C:/GopherBlackYellow2019/txt_files')

#Compare the 2005 to 2019 index from Deb's data
Deb = read.csv('DebWV_Index_compare_2005_2019.csv', header=T)

#Plot of MRFSS indices for north and south and GBY and gopher only
Deb = Deb %>%
      select(Year, DebWV_2005_assmnt,DebWV_2019_assmnt) %>%
  gather(Source, Scaled_index, DebWV_2005_assmnt,DebWV_2019_assmnt) 

out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"DebWV_index_compare.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(Deb, aes(x=Year, y = Scaled_index, colour=Source)) +
  geom_line(lwd = 1.5) +
  scale_color_manual(values=c("dodgerblue4","skyblue")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = c(0.05,1)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1987,1999, by = 2)) 

dev.off()
