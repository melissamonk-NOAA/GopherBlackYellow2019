###Graph the commercial catches
#North and south of Conception
#By species
#By live and dead



library(ggplot2)
library(dplyr)
library(tidyr)
setwd('C:/GopherBlackYellow2019/txt_files')

out.dir = "C:/GopherBlackYellow2019/Figures/"



comm_dat = read.csv('Comm_catch_live_dead.csv')


#bar plot of original catches
comm_dat = comm_dat %>% 
   gather(Source,mt,BYEL_Dead_North:GPHR_Live_South)


#comm_dat$Source <- factor(comm_dat$Source, 
#                              levels=c("GPHR_Dead_North", 
#                                       "GPHR_Live_North",
##                                       "BYEL_Dead_North" ,
#                                       "BYEL_Live_North",
#                                       "GPHR_Dead_South" ,
##                                       "GPHR_Live_South",
#                                       "BYEL_Dead_South" ,
#                                       "BYEL_Live_South"))
 
 

png(filename = paste0(out.dir,"Catches_livedeadNS_gby.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(comm_dat, aes(x=Year, y=mt, fill=Source)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = c(0.7, 1)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1978,2020, by = 10),
                     expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0,80, by = 10),
                     expand = c(0, 0)) +
  scale_fill_manual("legend",
                    values = c("BYEL_Dead_North" = "deepskyblue",
                               "BYEL_Dead_South"  = "blueviolet",
                               "BYEL_Live_North" = "blue4",
                                "BYEL_Live_South" = "deeppink",
                                "GPHR_Dead_North" = "darkgreen",
                                "GPHR_Dead_South" = "chartreuse",
                                "GPHR_Live_North" = "darkseagreen",
                                "GPHR_Live_South" = "aquamarine"))
  
  
dev.off()
