### Run r4ss and notes for making model comparison plots and editing plots
### Originally developed for the 2015 China Rockfish assessment document, 
### which had three independent assessment models (South of 40-10, 
### 40-10 through OR, and WA). Written for up to 3 assessment models
### Even if you only have 1 assessment model, it will be called mod1 throughout
### 
### Section 1: run r4ss and create plots
###
### Section 2: has the code for multiple model plot comparisons 
### Edit Section 2 script based on your needs
### Don't source this code, unless you've made all necessary edits
###
### Section 3: save the entire myreplist and mod_structure files from r4ss as csv's
# =============================================================================

# start fresh here - this script is separate from the script for the assessment
# document
rm(list=ls(all=TRUE))


# SECTION1: Run r4ss, parse plotInfoTable.csv file, & add linebreaks to SS files

stop("\n  This file should not be sourced!") # note to stop from accidental sourcing

# Here we're going to make sure you have all the required packages for the template
# Check for installtion and make sure all R libraries can be loaded
# xtable for creating tables, ggplot2 for plotting, reshape2 for melting
# dataframes, scales for printing percents
# You may have to manually install knitr - reason unknown!

requiredPackages = c('xtable', 'ggplot2', 'reshape2', 'scales', 
                     'rmarkdown', 'knitr', 'devtools')

for(p in requiredPackages){
  if(!require(p,character.only = TRUE)) install.packages(p)
  library(p,character.only = TRUE)
}

# Install the latest version of r4ss using devtools
devtools::install_github("r4ss/r4ss")

library(r4ss)

# CHANGE values in this section ===============================================

# number of assessment models - this is run before the R_preamble.R, which also
# contains this value
 n_models = 1
 

# By default, you can only work in the directory containing the project
# Set the directory here if you're getting errors
# setwd('C:/Assessment_template')


# Give the names of the data and control files, for each model
# Used in the SS_files_linebreaks.R
mod1_dat =  'gopher.dat'  


# Control file names 
mod1_ctrl = 'gopher.ctl' 


# =============================================================================

# set input and output directories
input.dir = file.path(getwd(), 'SS')
output.dir = file.path(getwd(), 'r4ss')

# IF the r4SS subdirectories don't exist, create them
# Once you have your own SS files and want to save these plots
# Uncomment the /r4SS/ in the .gitignore file
dir.create(file.path(output.dir,'plots_mod1'))



# BEGIN r4ss===================================================================
# REMOVE OLD r4SS OUTPUT!!!!! -------------------------------------------------
# Run this deliberately - it deletes the r4SS output plots files
do.call(file.remove, list(list.files(file.path(output.dir, 'plots_mod1'),    full.names=TRUE)))


# Run r4ss for each model - **CHANGE DIRECTORY if necessary**
mod1 = SS_output(dir = file.path(input.dir,'Base_model1'), forecast=T, covar=T, ncol=1000)

# Save the workspace an image
save.image('./r4ss/SS_output.RData')



# =============================================================================
# RUN r4ss plots for each model

# output directories
out.dir.mod1 = file.path(output.dir,'plots_mod1')



# Model 1
SS_plots(mod1,
         png = TRUE,
         html = FALSE,
         datplot = TRUE,
         uncertainty = TRUE,
         maxrows = 6, 
         maxcols = 6, 
         maxrows2 = 4, 
         maxcols2 = 4, 
         btarg = 0.40, 
         minbthresh = 0.25,
         printfolder = '', 
         dir = out.dir.mod1)


# =============================================================================
# Save dataframe with the Francis weights table from the default weighting 
Fweights = SS_tune_comps(mod1)
write.csv(Fweights,"./txt_files/Fweights.csv",row.names=FALSE)

# -----------------------------------------------------------------------------

# Run the code to parse the plotInfoTable files
source('./Rcode/Parse_r4ss_plotInfoTable.R')



#Create the numbers at age table
SSexecutivesummary(dir = dir1, tables = c("numbers"))
# -----------------------------------------------------------------------------

# Create the SS files for the appendices
source('./Rcode/SS_files_linebreaks.R')

# =============================================================================
# END SECTION 1================================================================
# =============================================================================
# =============================================================================

#Section 2 removed - needed for 2+ mdoels only
# =============================================================================
# Section 3: saves entire myreplist and mod_structure files 
# writes the entire myreplist and mod structure to a file
# useful if you need to find a particular variable r4ss creates
# change model and directory

#sink("./r4ss/plots_mod1/list_of_dataframes.csv", type="output")
#invisible(lapply(mod1, function(x) dput(write.csv(x))))
#sink()

#sink("./r4ss/plots_mod1/mod_structure.csv", type="output")
#invisible(str(mod1,list.len = 9999))
#sink()
