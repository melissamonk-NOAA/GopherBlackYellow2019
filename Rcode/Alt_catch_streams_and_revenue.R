library(ggplot2)
library(dplyr)
library(tidyr)
setwd('C:/GopherBlackYellow2019/txt_files')

catches = read.csv('Catch_stream_w_alts.csv',header=T)

revenue = read.csv('GBY_revenue.csv', header=T)









#-----------------------------------------------------------------------------------
#bar plot of original catches
#-----------------------------------------------------------------------------------
catches_orig = catches %>%
               select(Year, RecNorth, RecSouthorig, Commercial, WCGOPdiscard) %>%
               rename(RecSouth = RecSouthorig, Com = Commercial, ComDisc = WCGOPdiscard) %>%
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
   

#-----------------------------------------------------------------------------------
#plot with commercial including live vs. dead
#-----------------------------------------------------------------------------------
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



#-----------------------------------------------------------------------------------
#plot with alternative catch stream for rec and WCGOP
#-----------------------------------------------------------------------------------
catches_orig3 = catches %>%
  select(Year, RecNorthalt1, RecSouthalt1, Commercial, WCGOPalt1) %>%
  rename(RecNorth = RecNorthalt1, RecSouth = RecSouthalt1, 
         Com = Commercial, ComDisc = WCGOPalt1) %>%
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
                     expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual("legend", 
                    values = c("Com" = "blue", 
                               "ComDisc" = "green3",
                               "RecNorth" = "gold", 
                               "RecSouth" = "red"))
dev.off()



#-----------------------------------------------------------------------------------
#Calcom vs pacfin
#-----------------------------------------------------------------------------------

com_compare = catches %>%
  mutate(Calcom = Calcomdead + Calcomlive) %>%
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
  scale_x_continuous(breaks = seq(1980,2020, by = 5)) +
  scale_y_continuous(breaks = seq(0,100, by = 10))#,expand = c(0, 0)) 
 
dev.off()


#-----------------------------------------------------------------------------------
###Plot of recreational catches for Exec summary
#-----------------------------------------------------------------------------------

rec_exec = catches %>%
           select(Year, RecNorthalt1, RecSouthalt1) %>%
           rename(RecNorth = RecNorthalt1, RecSouth = RecSouthalt1) %>%
           filter(Year>1927) %>%
           gather(Source,mt, RecNorth:RecSouth) 
           


out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"Rec_exec.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)

#x11()

ggplot(rec_exec, aes(x=Year, y=mt, fill=Source)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        plot.margin = margin(0, .3, 0, 0, "cm"),
        legend.justification = c(0, 1), 
        legend.position = c(.01, 1)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1928,2020, by = 10),
                     expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0,200, by = 25),
                     expand = c(0, 0)) +
  scale_fill_manual("legend", 
                    values = c("RecNorth" = "gold", 
                               "RecSouth" = "red"))
dev.off()


#-----------------------------------------------------------------------------------
###Plot of comercial catches for Exec summary
#-----------------------------------------------------------------------------------
 comm_exec = catches %>%
  select(Year, Calcomdead, Calcomlive, WCGOPalt1) %>%
  rename(ComDead = Calcomdead,
         ComLive = Calcomlive, ComDisc = WCGOPalt1) %>%
  gather(Source,mt,ComDead:ComDisc) 


comm_exec$Source <- factor(comm_exec$Source, 
                               levels=c('ComDead','ComLive','ComDisc'))

out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"comm_exec.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(comm_exec, aes(x=Year, y=mt, fill=Source)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        #  legend.position='top', 
        #  legend.justification='left'
        legend.justification = c(0, 1), 
        legend.position = c(0.01, 1)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1915,2020, by = 10),
                     expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  scale_fill_manual("legend", 
                    values = c("ComDead" = "lightblue",
                               "ComLive" = "purple",
                               "ComDisc" = "green3"))
dev.off()



#-----------------------------------------------------------------------------------
#Plot of 2005 and 2019 catch streams rec and commercial
#-----------------------------------------------------------------------------------

assessment_compare = catches %>%
       select(Year, Commercial, RecNorthalt1, RecSouthalt1, Rec2005, Comm2005) %>%
      mutate(Rec = RecNorthalt1+RecSouthalt1) %>%
      rename(Comm_2019 = Commercial, Comm_2005 = Comm2005, Rec_2005 = Rec2005, Rec_2019 = Rec) %>%
      select(Year, Comm_2019, Comm_2005, Rec_2019, Rec_2005) %>%
      filter(Year>1964, Year<2005) %>%
      gather(Source,mt, Comm_2019:Rec_2005) 


out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"assessment_compare.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(assessment_compare, aes(x=Year, y = mt, colour=Source)) +
  geom_line(lwd = 1.1) +
  scale_color_manual(values=c("sienna3", "lightsalmon", "seagreen4","paleturquoise3")) +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        legend.justification = c(0, 1), 
        legend.position = c(0.05, .95)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1964,2005, by = 5)) +
  scale_y_continuous(breaks = seq(0,200, by = 20))

dev.off()


#-----------------------------------------------------------------------------------
#Plot of GBY revenue
#-----------------------------------------------------------------------------------
rev = revenue %>%
  select(Year, GPHR_exvessel_RevAFI, BYEL_exvessel_revAFI) %>%
  rename(GPHR = GPHR_exvessel_RevAFI,
         BYEL = BYEL_exvessel_revAFI) %>%
  gather(Species,Revenue,GPHR:BYEL)  %>%
  filter(Year>1983)

rev$Revenue = rev$Revenue/1000

out.dir = "C:/GopherBlackYellow2019/Figures/"
png(filename = paste0(out.dir,"GBY_revenue.png"),
    width = 6, height = 4, units = "in", pointsize = 12, res=300)
#x11()
ggplot(rev, aes(x=Year, y=Revenue, fill=Species)) +
  geom_bar(stat="identity", width=1,colour="black") +
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        axis.line = element_line(colour = "black"),
        #  legend.position='top', 
        #  legend.justification='left'
        legend.justification = c(0, 1), 
        legend.position = c(0.01, 1)) +
  theme(legend.title=element_blank()) +
  scale_x_continuous(breaks = seq(1984,2016, by = 2),
                     expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0,800, by = 100),
                     expand = c(0, 0)) +
  ylab("Revenue (1,000 U.S. AFI dollars)")+
  scale_fill_manual("legend", 
                    values = c("GPHR" = "lightblue",
                               "BYEL" = "purple"))
dev.off()

