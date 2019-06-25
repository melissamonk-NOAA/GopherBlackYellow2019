

rm(list=ls(-1))
library('r4ss')

# update_r4ss_files()
# devtools::install_github('r4ss/r4ss')

WD <- c('C:/XiHe1/GPHR2019/SSModel/SS/')
setwd(WD)


with.covar = T		# T: without -nohess; F: with -nohess 
a1 <- SS_output(dir=WD,covar=with.covar)
a2 = a1$parameters
a3 = a2[!is.na(a2$Active_Cnt),]
a4 = a3[,1:12]
rownames(a4) = c()

a5 = a4[!grepl("Early_RecrDev",a4$Label),]
a6 = a5[!grepl("Main_RecrDev",a5$Label),]
a7 = a6[!grepl("Late_RecrDev",a6$Label),]
a8 = a7[!grepl("ForeRecr",a7$Label),]

a8$cv1 = a8$Parm_StDev / a8$Value

# sort data by abs(cv1)
a9 = a8[order(abs(a8$cv1), na.last=T, decreasing=T),] 


