
rm(list=ls(-1))
library('r4ss')

# update_r4ss_files()
# devtools::install_github('r4ss/r4ss')

WD <- c('C:/XiHe1/GPHR2019/SSModel/SS/')
setwd(WD)


with.covar = T		# T: without -nohess; F: with -nohess 
myreplist <- SS_output(dir=WD,covar=with.covar)

printfolder = "GraphOutput"
plot.data = F

# to pdf or png? - cannot do both
print.to.pdf = T
if(!print.to.pdf) {
	print.to.pdf = F
	print.to.png = T
} else {
	print.to.pdf = T
	print.to.png = F
}

# plot 1 to 24
SS_plots(
		replist=myreplist,
		plot=c(1:24),
    	pdf=print.to.pdf,
		png=print.to.png,
		html=F,
		printfolder=printfolder,
		scalebins=T,
		uncertainty=with.covar,
		datplot=plot.data,
		maxcols2=5,
		scalebubbles=F,
		areanames="default"
)

rm(list=ls(-1))


