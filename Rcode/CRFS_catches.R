library(ggplot2)
library(dplyr)
library(tidyr)

setwd('C:/GopherBlackYellow2019/txt_files')

out.dir = "C:/GopherBlackYellow2019/Figures/"

crfs = read.csv('CRFS_collapsed.csv', header=T)


#bar plot of original catches
crfs = crfs %>% 
  gather(Source,mt,BYEL_Shore_North:Other_South)

crfs$Source = as.factor(crfs$Source)


crfs$Source <- factor(crfs$Source, 
                 levels=c("BYEL_Shore_North",
                "BYEL_PR_North" ,
                "GPHR_Shore_North",
                "GPHR_PC_North",
                "GPHR_PR_North" ,
                "Other_North",
                "GPHR_PC_South" ,
                "Other_South" )) 


png(filename = paste0(out.dir,"CRFS_totalmort_gby.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(crfs, aes(x=Year, y=mt, fill=Source)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = c(0.05, .95),
        legend.title=element_blank(),
        legend.text=element_text(size=rel(0.7)),
        legend.key.size = unit(.3, "cm")) +
  scale_x_continuous(breaks = seq(2005,2020, by = 1),
                     expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual("legend",
                    values = c("BYEL_Shore_North" = "blueviolet",
                               "BYEL_PR_North" = "deeppink",
                               "GPHR_Shore_North" = "olivedrab",
                               "GPHR_PC_North" = "chartreuse",
                               "GPHR_PR_North" = "darkseagreen1",
                               "GPHR_PC_South" = "seagreen",
                               "Other_North" = "goldenrod",
                               "Other_South" = "yellow2")) 


dev.off()

