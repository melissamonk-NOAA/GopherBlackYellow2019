
#Remove all variables and turn off open graphics
rm(list=ls(all=TRUE))
graphics.off()

#Have to set working directory to source file location from RStudio menu

library(r4ss)


#name and create output directory for r4ss
output.dir = file.path(getwd(),'r4ss')
output.dir.plots = file.path(getwd(),'r4ss','plots')
dir.create(file.path(output.dir))
dir.create(file.path(output.dir.plots))


#run r4ss
with.covar = F		# T: without -nohess; F: with -nohess 
mod1 = SS_output(dir = getwd(), forecast=F, covar=with.covar, ncol=1000)

#get forecast catch
forecast=SS_ForeCatch(mod1,yrs = 2021:2030, average = FALSE)
write.csv(forecast,"SS_Forecatch.csv")


# plots
SS_plots(mod1,
         png = TRUE,
         html = TRUE,
         datplot = TRUE,
         uncertainty = TRUE,
         maxrows = 6, 
         maxcols = 6, 
         maxrows2 = 4, 
         maxcols2 = 4, 
         printfolder = '', 
         dir = output.dir.plots)

francis_weights = SS_tune_comps(mod1) 
write.csv(francis_weights,"SS_tune_comps_output.csv")

#harmonic
MI_weights = SS_tune_comps(mod1, option="MI")
write.csv(MI_weights,"MI_weights.csv")

with.covar = T		# T: without -nohess; F: with -nohess 
a1 <- mod1
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


#Pull out N para, total like, MGC, warning, sigR, M, lnR0, Depletion


#Nparameters
nparm = max(a2$Active_Cnt,na.rm=TRUE)

#Total likelihood
a10 = a1$likelihoods_used
totlike = a10[1,1]

#MGC
a11  = sum(ifelse(a9$Status=='OK',0,1))
MGC = ifelse(a11>0,'N','Y')

#warning
warning = mod1$Nwarnings

#sigR
sigR = a2[grep('SR_sigmaR', a2$Label), 3]

#M
M = a2[grep('NatM_p_1_Fem_GP_1', a2$Label),3]

#lnR0
lnR0 = a2[grep('SR_LN', a2$Label),3]

#Depletion
Depletion = mod1$derived_quants[grep('Bratio_2019', mod1$derived_quants$Label), 2]

#put it all together and copy to clipboard
checks = paste0(nparm,',', totlike,',', MGC,',', warning, ',', sigR,',', M,',', lnR0,',', Depletion)
writeClipboard(checks)

