library(ggplot2)
library(dplyr)
library(tidyr)
setwd('C:/GopherBlackYellow2019/txt_files')

catches = read.csv('Catch_stream_w_alts.csv',header=T)

#bar plot of original catches
catches_orig = catches %>%
               select(Year, RecNorth, RecSouthorig, Calcom, WCGOPdiscard) %>%
               rename(RecSouth = RecSouthorig, Com = Calcom, ComDisc = WCGOPdiscard) %>%
               gather(Source,mt,RecNorth:ComDisc) 
               


catches_orig$Source <- factor(catches_orig$Source, 
                              levels=c('Com','ComDisc',
                                       'RecNorth', 'RecSouth'))

out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"Catches_original.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(catches_orig, aes(x=Year, y=mt, fill=Source)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
      legend.justification = c(0, 1), 
      legend.position = c(0, 1)) +
  theme(legend.title=element_blank()) +
   scale_x_continuous(breaks = seq(1915,2020, by = 10),
                      , expand = c(0, 0)) +
   scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual("legend", 
                    values = c("Com" = "blue", 
                               "ComDisc" = "green3",
                               "RecNorth" = "gold", 
                               "RecSouth" = "red"))
dev.off()
   


#plot with commercial including live vs. dead
catches_orig2 = catches %>%
  select(Year, RecNorth, RecSouthorig, Calcomdead, Calcomlive, WCGOPdiscard) %>%
  rename(RecSouth = RecSouthorig, ComDead = Calcomdead,
         ComLive = Calcomlive, ComDisc = WCGOPdiscard) %>%
  gather(Source,mt,RecNorth:ComDisc) 



catches_orig2$Source <- factor(catches_orig2$Source, 
                              levels=c('ComDead','ComLive','ComDisc',
                                       'RecNorth', 'RecSouth'))

out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"Catches_original2.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(catches_orig2, aes(x=Year, y=mt, fill=Source)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        #  legend.position='top', 
        #  legend.justification='left'
        legend.justification = c(0, 1), 
        legend.position = c(0, 1)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1915,2020, by = 10),
                     expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual("legend", 
                    values = c("ComDead" = "lightblue",
                               "ComLive" = "purple",
                               "ComDisc" = "green3",
                               "RecNorth" = "gold", 
                               "RecSouth" = "red"))
dev.off()




#plot with alternative catch stream for rec and WCGOP
catches_orig3 = catches %>%
  select(Year, RecNorthalt1, RecSouthalt1, Calcom, WCGOPalt1) %>%
  rename(RecNorth = RecNorthalt1, RecSouth = RecSouthalt1, 
         Com = Calcom, ComDisc = WCGOPalt1) %>%
  gather(Source,mt,RecNorth:ComDisc) 



catches_orig$Source <- factor(catches_orig3$Source, 
                              levels=c('Com','ComDisc',
                                       'RecNorth', 'RecSouth'))

out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"Catches_alternate.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(catches_orig3, aes(x=Year, y=mt, fill=Source)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = c(0, 1)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1915,2020, by = 10),
                     , expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual("legend", 
                    values = c("Com" = "blue", 
                               "ComDisc" = "green3",
                               "RecNorth" = "gold", 
                               "RecSouth" = "red"))
dev.off()




#Calcom vs pacfin
#plot
com_compare = catches %>%
  select(Year, Calcom, Pacfin) %>%
  rename(CALCOM = Calcom, PacFIN = Pacfin) %>%
  filter(Year>1980) %>%
  gather(Source,mt, CALCOM:PacFIN) 


out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"Calcom_vs_Pacfin.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(com_compare, aes(x=Year, y = mt, colour=Source)) +
  geom_line(lwd = 1.5) +
  scale_color_manual(values=c("blue", "green3")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = c(0.05, .95)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1980,2020, by = 5),
                     expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0,100, by = 10))#,expand = c(0, 0)) 
 


#plot with discard alternative2