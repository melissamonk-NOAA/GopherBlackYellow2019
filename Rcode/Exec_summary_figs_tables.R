# =============================================================================
# R script for Executive summary figures and tables                      
# The script for the tables is in the order they appear in the document!
#                                                                       
# BELOW IS THE ORDER OF THE TABLES & FIGURES IN THIS SCRIPT              
# If you're looking for a particular figure/table to edit you can search by the number
#
# 1. Recent history of catches figure and tables (need to edit Exec_catch_for_figs.csv)
#      OR, you can comment this plot out, and just use the r4ss generated plot included
#      in the in the main R markdown document 
# 2. Spawning stock output and depletion
# 3. Recruitment
# 4. SPR and exploitation
# 5. Reference points
# 6. Management performance (need to edit Exec_mngmt_performance.csv and maybe table)
# 7. OFL projections
# 8. Decision tables  (need to edit DecisionTable_mod1.csv and other if multiple models)
# 9. Base model summary (need to edit)
#
# Melissa Monk, NMFS
# =============================================================================


# =============================================================================
# 1. Catch FIGURE(S) ----------------------------------------------------------
# Did in another R script for this assessment

# -----------------------------------------------------------------------------
# CATCH TABLE(S) --------------------------------------------------------------

# Read in executive summary catches table
Exec_catch_summary = read.csv('./txt_files/Exec_catch_summary.csv')
  
# Assign column names as they should appear in the table; change the alignment 
# to match number of columns +1
colnames(Exec_catch_summary) = c('Year', 
                                 'Commercial Retained',
                                 'Commercial Discard',	
                                 'Recreational North',	
                                 'Recreational South',
                                 'Total')
    
# Make executive summary catch xtable
Exec_catch.table = xtable(Exec_catch_summary, 
                          caption = c(paste('Recent ',spp,' landings (mt) by 
                                            fleet, where the recreational fleet 
                                            is split at Point Conception.', sep='')), 
                          label='tab:Exec_catch')
    
# Add alignment - you will have to adjust based on the number of columns you have
# and the desired width, remember to add one leading ghost column for row.names
align(Exec_catch.table) = c('l', 'l', 
                            '>{\\centering}p{1in}', 
                            '>{\\centering}p{1in}',
                            '>{\\centering}p{1in}', 
                            '>{\\centering}p{.9in}',
                            '>{\\centering}p{.9in}')  

  
# =============================================================================
# Spawning output and Depletion -----------------------------------------------

# Retreive data on spawning output and depletion

     mod=mod1
     mod_area='mod1'

  # Extract biomass/output  
  SpawningB = mod$derived_quants[grep('SSB', mod$derived_quants$Label), ]
  SpawningB = SpawningB[c(-1, -2), ]
     
      
  # Spawning biomass and std.dev data, calculate lower and upper 95% CI                 
  SpawningByrs = SpawningB[SpawningB$Label >= paste('SSB_', FirstYR+1,sep='') 
                         & SpawningB$Label <= paste('SSB_', LastYR+1,sep=''), ]     
  
  SpawningByrs$YEAR = seq(FirstYR+1, LastYR+1)
  
  SpawningByrs$lowerCI = round(SpawningByrs$Value + 
                                 qnorm(0.025) * SpawningByrs$StdDev, 
                               digits = 0)
  
  SpawningByrs$upperCI = round(SpawningByrs$Value - 
                                 qnorm(0.025) * SpawningByrs$StdDev, 
                               digits = 0)
  SpawningByrs$Value = round(SpawningByrs$Value, digits = 0) 
   
  # Save individual depletion table before CI combined to character
  assign(paste('SpawnB_', mod_area, sep = ''), SpawningByrs)
  SpawnB = SpawningByrs  
      
  # Calculate confidence intervals
  SpawningByrs$CI = paste0(SpawningByrs$lowerCI, ' - ', SpawningByrs$upperCI)
  SpawningBtab = subset(SpawningByrs, select = c('YEAR', 'Value', 'CI'))
      
  # Assign column names
  colnames(SpawningBtab) = c('Year', paste('Spawning Output (', fecund_unit,')', 
                                           sep=''), '~ 95% confidence interval')
  
  
  
  
  # Extract Depletion values  
  Depletion = mod$derived_quants[grep('Bratio', mod$derived_quants$Label), ]
  Depletion = Depletion[c(-1, -2), ]
     
  # Estimated depletion, pull out correct years, list years, and estimate 95% CI
  Depletionyrs = Depletion[Depletion$Label >= paste('Bratio_', FirstYR+1,sep='') &
                           Depletion$Label <= paste('Bratio_', LastYR+1,sep=''), ]     
  
  Depletionyrs$YEAR = seq(FirstYR+1, LastYR+1)
  
  #Depletion$Value = round(Depletion$Value, digits=1)
  
  Depletionyrs$lowerCI = as.numeric(Depletionyrs$Value + 
                               qnorm(0.025)*Depletionyrs$StdDev)
  
  Depletionyrs$upperCI = Depletionyrs$Value - 
                               qnorm(0.025)*Depletionyrs$StdDev
  #Multiple depletion and CI by 100
  Depletionyrs$Value   = round(Depletionyrs$Value*100,   digits = 2) 
  Depletionyrs$lowerCI = round(Depletionyrs$lowerCI*100, digits = 2) 
  Depletionyrs$upperCI = round(Depletionyrs$upperCI*100, digits = 2)  
  
  # Save individual depletion tables
  assign(paste('Deplete_', mod_area, sep=''), Depletionyrs)
  Deplete = Depletionyrs     
    
  Depletionyrs$CI = paste0(Depletionyrs$lowerCI, ' - ', Depletionyrs$upperCI)
  
  Depletiontab = subset(Depletionyrs, select=c('Value', 'CI'))
  
  colnames(Depletiontab) = c('Estimated depletion', '~ 95% confidence interval')
    
  # Bind the spawning output and depletion data together 
  Spawn_Deplete = cbind(SpawningBtab, Depletiontab)
 
  colnames(Spawn_Deplete) = c('Year', 
                              paste('Spawning Output (', fecund_unit, ')', sep = ''), 
                              '~ 95% confidence interval',
                              'Estimated depletion',
                              '~ 95% confidence interval')
        
  # Assign a model number to the Spawn_deplete table, if you do cbind within this step
  assign(paste('SpawnDeplete_',mod_area,sep=''), Spawn_Deplete)
    
  # 9.1.15 R now won't read the file with any underscores for xtable,
  # so use SpawnDeplete without spaces for that  
  assign(paste('SpawnDeplete',mod_area, sep=''), Spawn_Deplete)
       
  assign(paste('Depl_',mod_area, sep=''), percent(as.numeric(Deplete[nrow(Deplete), 2])))
          
  assign(paste('Depl_',mod_area,'_CI',sep=''), 
         paste(percent(Deplete[nrow(Deplete), 7]), ' - ', 
               percent(Deplete[nrow(Deplete), 8]), sep=''))
        
  assign(paste('Spawn_', mod_area, sep=''), SpawnB[nrow(SpawnB), 2])
    
  assign(paste('Spawn_',mod_area,'_CI',sep=''), 
         paste(SpawnB[nrow(SpawnB), 7], ' - ', SpawnB[nrow(SpawnB), 8], sep=''))



# =============================================================================
# =============================================================================
# Create Spawning/Depletion tables for the correct number of models
# Model 1 table ---------------------------------------------------------------
Spawn_Deplete_mod1.table = xtable(SpawnDepletemod1, 
                           caption = c(paste('Recent trend in beginning of the 
                                      year spawning output and depletion for
                                      the ', mod1_label, ' for ', spp, '.',sep='')), 
                           label='tab:SpawningDeplete_mod1', digits = c(0,0,0,0,2,2))  

# Add column spacing    
align(Spawn_Deplete_mod1.table) = c('l', 'l', 
                                    '>{\\centering}p{1.3in}', 
                                    '>{\\centering}p{1.2in}', 
                                    '>{\\centering}p{1in}', 
                                    '>{\\centering}p{1.3in}')  

# =============================================================================
# Recruitment =================================================================

# # Extract recruitment values
   mod=mod1
   mod_area='mod1'

        
  # Pull out recuitment  
  Recruit = mod$derived_quants[grep('Recr',mod$derived_quants$Label),]
  Recruit = Recruit[c(-1,-2),]
  
  # Recruitment and std.dev data, calculate lower and upper 95% CI                 
  Recruityrs = Recruit[Recruit$Label >= paste('Recr_', FirstYR+1, sep = '') &  
                       Recruit$Label <= paste('Recr_', LastYR+1, sep = ''), ]     
  
  Recruityrs$YEAR = seq(FirstYR+1, LastYR+1)
  
  # assume recruitments have log-normal distribution 
  # from first principals (multiplicative survival probabilities)
  Recruityrs$logint <- sqrt(log(1+(Recruityrs$StdDev/Recruityrs$Value)^2))
  Recruityrs$lowerCI <- exp(log(Recruityrs$Value) + qnorm(0.025)*Recruityrs$logint)
  Recruityrs$upperCI <- exp(log(Recruityrs$Value) + qnorm(0.975)*Recruityrs$logint)
  
  Recruit_units <- "1,000s"
  if(mean(Recruityrs$Value) > 10000){
    Recruit_units <- "millions"
    Recruityrs$Value <- Recruityrs$Value/1000
    Recruityrs$lowerCI <- Recruityrs$lowerCI/1000
    Recruityrs$upperCI <- Recruityrs$upperCI/1000
  }
  
  Recruityrs$CI = paste0(round(Recruityrs$lowerCI, digits = 0), 
                        ' - ', round(Recruityrs$upperCI, digits = 0))
  
  Recruityrs$Value = round(Recruityrs$Value, digits = 0)
  
  Recruittab=subset(Recruityrs, select = c('YEAR', 'Value', 'CI'))
  
  colnames(Recruittab) = c('Year',
                           paste0('Estimated Recruitment (',Recruit_units,')'),
                           '~ 95% confidence interval')
  
  assign(paste('Recruittab_',mod_area,sep=''), Recruittab)


# -----------------------------------------------------------------------------
# Create recruitment tables

# Model 1 table
Recruit_mod1.table = xtable(Recruittab_mod1, 
                            caption = 'Recent recruitment for the GBYR assessment.',
                            label = 'tab:Recruit_mod1', digits = 0)   

align(Recruit_mod1.table) = c('l',
                              '>{\\centering}p{.8in}',
                              '>{\\centering}p{1.6in}',
                              '>{\\centering}p{1.6in}')
      

# =============================================================================
# Exploitation data -----------------------------------------------------------

# Extract exploitation values

    mod = mod1
    mod_area = 'mod1'
 
 #      
  # Extract exploitation and SPR ratio values from r4SS output
  Exploit = mod$derived_quants[grep('F',mod$derived_quants$Label),]
  Exploit = Exploit[c(-1,-2),]
        
  SPRratio = mod$derived_quants[grep('SPRratio',mod$derived_quants$Label),]
  SPRratio = SPRratio[c(-1,-2),]
        
  # Exploitation and calculate lower and upper 95% CI                 
  Exploityrs = Exploit[Exploit$Label >= paste('F_', FirstYR, sep='') &
                       Exploit$Label <= paste('F_', LastYR, sep=''), ]     
  
  Exploityrs$YEAR = seq(FirstYR, LastYR)
  
  Exploityrs$lowerCI = round(Exploityrs$Value +
                            qnorm(0.025) * Exploityrs$StdDev, digits = 2)
  
  Exploityrs$upperCI = round(Exploityrs$Value -
                            qnorm(0.025) * Exploityrs$StdDev, digits = 2)
  
  Exploityrs$CI = paste0(Exploityrs$lowerCI, ' - ', Exploityrs$upperCI)
  
  Exploittab = subset(Exploityrs, select=c('Value', 'CI'))
 
  colnames(Exploittab) = c('Exploitation rate', '95% confidence interval')
        
        
  # Spawning potential ratio and calculate lower and upper 95% CI  
  SPRratioyrs = SPRratio[SPRratio$Label >= paste('SPRratio_', FirstYR, sep='') 
                       & SPRratio$Label <= paste('SPRratio_', LastYR, sep=''), ]     
  
  SPRratioyrs$Year = seq(FirstYR, LastYR)
  
  SPRratioyrs$lowerCI = round(SPRratioyrs$Value +
                              qnorm(0.025) * SPRratioyrs$StdDev, digits = 2)
  
  SPRratioyrs$upperCI = round(SPRratioyrs$Value -
                              qnorm(0.025) * SPRratioyrs$StdDev, digits = 2)
  
  SPRratioyrs$CI = paste0(SPRratioyrs$lowerCI, ' - ', SPRratioyrs$upperCI)
  
  SPRratiotab = subset(SPRratioyrs, select = c('Year', 'Value', 'CI'))
  
  SPRratiotab$Year = as.factor(SPRratiotab$Year)
  
  colnames(SPRratiotab) = c('Year', 'Estimated (1-SPR)/(1-SPR50%)', '~ 95% confidence interval')
      
  assign(paste('SPRratio_Exploit_', mod_area, sep=''), cbind(SPRratiotab, Exploittab))


# =============================================================================
# Create the three tables for SPR Ratio and Exploitation

# Model 1 
SPRratio_Exploit_mod1.table = xtable(SPRratio_Exploit_mod1, 
                              caption=c(paste('Recent trend in spawning potential 
                                        ratio (entered as $(1-SPR)/ (1-SPR_{50\\%})$) 
                                        and exploitation for ', spp, ' in the ', 
                                           mod1_label,'.', sep='')), 
                              label='tab:SPR_Exploit_mod1')  
      
align(SPRratio_Exploit_mod1.table) = c('l','l',
                                       '>{\\centering}p{1.2in}',
                                       '>{\\centering}p{1.2in}',
                                       '>{\\centering}p{1in}',
                                       '>{\\centering}p{1.2in}') 
     


# =============================================================================
# Reference points ------------------------------------------------------------

# Extract reference points table data

   mod = mod1
   mod_area = 'mod1'


  # Rbind all of the data for the big summary reference table  
  Ref_pts = rbind (
  SSB_Unfished    = mod$derived_quants[grep('SSB_I', mod$derived_quants$Label), ],
  SmryBio_Unfished = mod$derived_quants[grep('SmryBio', mod$derived_quants$Label, ignore.case=TRUE), ],
  Recr_Unfished   = mod$derived_quants[grep('Recr_I', mod$derived_quants$Label), ],
  SSB_lastyr      = mod$derived_quants[grep(paste0('SSB_', LastYR), mod$derived_quants$Label), ],
  Depletion_lastyr= mod$derived_quants[grep(paste0('Bratio_', LastYR), mod$derived_quants$Label), ],
  Refpt_sB        = c(NA, NA, NA),
  SSB_Btgt        = mod$derived_quants[grep('SSB_Btgt', mod$derived_quants$Label), ],
  SPR_Btgt        = mod$derived_quants[grep('SPR_Btgt', mod$derived_quants$Label), ],
  Fstd_Btgt       = mod$derived_quants[grep('Fstd_Btgt', mod$derived_quants$Label), ],
  TotYield_Btgt   = mod$derived_quants[grep('Dead_Catch_B', mod$derived_quants$Label), ],  #changed 4/29/2019 from TotYield_Btgt
  Refpt_SPR       = c(NA, NA, NA),
  SSB_SPRtgt      = mod$derived_quants[grep('SSB_SPR', mod$derived_quants$Label), ],
  SPR_proxy       = c('SPR_proxy', .5, NA),
  Fstd_SPRtgt     = mod$derived_quants[grep('Fstd_SPR', mod$derived_quants$Label), ],
  TotYield_SPRtgt = mod$derived_quants[grep('Dead_Catch_SPR', mod$derived_quants$Label), ], #changed 4/29/2019 from TotYield_SPRtgt
  Refpts_MSY      = c(NA, NA, NA),
  SSB_MSY         = mod$derived_quants[grep('SSB_MSY', mod$derived_quants$Label), ],
  SPR_MSY         = mod$derived_quants[grep('SPR_MSY', mod$derived_quants$Label), ],
  Fstd_MSY        = mod$derived_quants[grep('Fstd_MSY', mod$derived_quants$Label), ],
  DeadYield_MSY    = mod$derived_quants[grep('Dead_Catch_MSY', mod$derived_quants$Label), ], #changed 4/29/2019 from TotYield_MSY
  RetYield_MSY    = mod$derived_quants[grep('Ret_Catch_MSY', mod$derived_quants$Label), ]) #changed 4/29/2019 and added as TotYield is now separated 
  Ref_pts         = Ref_pts[, 1:3]
  Ref_pts$Value   = as.numeric(Ref_pts$Value)
  Ref_pts$StdDev  = as.numeric(Ref_pts$StdDev)
  
  
  Ref_pts$places  = ifelse(Ref_pts$Value >= 1, 
                           nchar(round(Ref_pts$Value)), NA) 
  
  Ref_pts$Value1  = ifelse((Ref_pts$Value >= 1 & Ref_pts$Label !='SmryBio_unfished'), 
                           comma(Ref_pts$Value, big.mark=','), 
                           ifelse(Ref_pts$Label == 'SmryBio_unfished', comma(Ref_pts$Value, big.mark=','), 
                                  round(Ref_pts$Value, 3)))  
  
  
  Ref_pts$lowerCI  = round(Ref_pts$Value + qnorm(0.025) * Ref_pts$StdDev, digits = 3)
  
  Ref_pts$upperCI  = round(Ref_pts$Value - qnorm(0.025) * Ref_pts$StdDev, digits = 3)
  
  
  Ref_pts$lowerCI1 = ifelse((abs(Ref_pts$lowerCI) >= 1 & Ref_pts$Label !='SmryBio_unfished'), 
                            comma(Ref_pts$lowerCI, big.mark=','), 
                            ifelse(Ref_pts$Label == 'SmryBio_unfished', comma(Ref_pts$lowerCI, big.mark=','), 
                                   round(Ref_pts$lowerCI, 3)))  
  
  Ref_pts$upperCI1 = ifelse((Ref_pts$upperCI >= 1 & Ref_pts$Label !='SmryBio_unfished'), 
                            comma(Ref_pts$upperCI, big.mark=','), 
                            ifelse(Ref_pts$Label == 'SmryBio_unfished', comma(Ref_pts$upperCI, big.mark=','), 
                                   round(Ref_pts$upperCI, 3)))  
        
  Quantity = c(paste('Unfished spawning output (', fecund_unit, ')', sep = ''),
                     paste('Unfished age ', min_age, ' biomass (mt)', sep = ''),
                    'Unfished recruitment ($R_{0}$)',
                     paste('Spawning output ', '(', LastYR, ' ', fecund_unit, ')', sep = ''),
                     paste('Depletion (', LastYR,')',sep=''),
                    '\\textbf{$\\text{Reference points based on } \\mathbf{SB_{40\\%}}$}',
                    'Proxy spawning output ($B_{40\\%}$)',
                    'SPR resulting in $B_{40\\%}$ ($SPR_{B40\\%}$)',
                    'Exploitation rate resulting in $B_{40\\%}$',
                    'Yield with $SPR_{B40\\%}$ at $B_{40\\%}$ (mt)',
                    '\\textbf{\\textit{Reference points based on SPR proxy for MSY}}',
                    'Spawning output',
                    '$SPR_{proxy}$',
                    'Exploitation rate corresponding to $SPR_{proxy}$',
                    'Yield with $SPR_{proxy}$ at $SB_{SPR}$ (mt)',
                    '\\textbf{\\textit{Reference points based on estimated MSY values}}',
                    'Spawning output at $MSY$ ($SB_{MSY}$)',
                    '$SPR_{MSY}$',
                    'Exploitation rate at $MSY$',
                    'Dead Catch $MSY$ (mt)',
                    'Retained Catch $MSY$ (mt)'  )
        
  Ref_pts = cbind(Quantity, Ref_pts[, c(5, 8, 9)])
  Ref_pts[c(6, 11, 13, 16), 3] = ''
  Ref_pts[c(6, 11, 16), 2] = ''
  colnames(Ref_pts) = c('\\textbf{Quantity}', '\\textbf{Estimate}', 
                        '\\textbf{Low 2.5\\%  limit}',
                        '\\textbf{High 2.5\\%  limit}')
  assign(paste('Ref_pts_', mod_area, sep = ''), Ref_pts)


# =============================================================================
# Create reference point table(s)----------------------------------------------

# Model 1 
Ref_pts_mod1.table = xtable(Ref_pts_mod1, 
                            caption=c(paste('Summary of reference 
                                      points and management quantities for the 
                                      base case ', mod1_label, '.',sep = '')), 
                            label='tab:Ref_pts_mod1')  
# Add alignment      
align(Ref_pts_mod1.table) = c('l',
                              '>{\\raggedright}p{4.1in}',
                              '>{\\raggedleft}p{.62in}',
                              '>{\\raggedleft}p{.62in}',
                              '>{\\raggedleft}p{.62in}')  




# =============================================================================
# Management performance ------------------------------------------------------
# Required: EDIT and READ IN Exec_mngmt_performance.csv FILE ------------------
# Read in the management performance table - get from John Devore
# Will have to change the column names, caption, and the alignment
  
mngmnt = read.csv('./txt_files/Exec_mngmt_performance.csv')

colnames(mngmnt) = c('Year',
                     'GBYR GEMM Total Mortality',
                     'Assessment Total Mortality',
                     'Minor Nearshore Rockfish South Total Mortality', 
                     'Nearshore Rockfish South ACL', 
                     'Nearshore Rockfish South OFL')

#a_header <- construct_header(
  # the data.frame or matrix that should be plotted
#  mngmnt,
  # the labels of the groups that we want to insert
#  grp_names = c("","GBYR", "Shallow Nearshore Rockfish South","Nearshore Rockfish South"),
  # the number of columns each group spans
#  span = c(1, 3, 1,2),
  # the alignment of each group, can be a single character (lcr) or a vector
#  align = "c"
#)



# Create the management performance table
mngmnt.table = xtable(mngmnt, 
                      caption=c('Recent trend in total mortality for gopher and 
                            black-and-yellow rockfishes (GBYR), combined, relative to the 
                             management guidelines for Nearshore Rockfish 
                             South of $40^\\circ 10^\\prime$ N. latitude. 
                             Total mortality estimates are based on annual GEMM reports 
                                from the NMFS NWFSC. * = Total mortality represents gopher 
                                rockfish only. ** = Prior to 2011 the harvest control rule was 
                                based on Optimum Yield (OY).'), 
                      label='tab:mnmgt_perform')  
# Add alignment
align(mngmnt.table) = c('l',
                        '>{\\raggedleft}p{.6in}',
                        '>{\\centering}p{1in}',
                        '>{\\centering}p{.8in}', 
                        '>{\\centering}p{1in}',
                        '>{\\centering}p{.8in}', 
                        '>{\\centering}p{.8in}')  


# =============================================================================
# OFL projection --------------------------------------------------------------

#Define first and last years of the projection
#copied from external piece of code so not using mod1$derived quants exactly
FirstYRFore = 2019
LastYRFore = 2030

#Extract the OFL, ABC, Age 0+, SSB, Depletion
quants = mod1$derived_quants

#extract OFL and ABC
OFLCatch  = quants[grep('OFLCatch', quants$Label), ]
OFLCatch[c(1:2),2] = 154
ForeCatch = quants[grep('ForeCatch', quants$Label), ]

#Extract Age 0+, SSB and Depletion
Age0plus = mod1$timeseries %>%
           select(Yr,Bio_all) %>%
           filter(Yr >= FirstYRFore)


#ssb
SSB       = quants[grep('SSB', quants$Label), ]
SSB       = SSB [SSB$Label >= paste('SSB_', FirstYRFore,sep='') &
                   SSB$Label <= paste('SSB_', LastYRFore,sep=''), ]
#depletion
Bratio    = quants[grep('Bratio', quants$Label), ]
Bratio    = Bratio[Bratio$Label >= paste('Bratio_', FirstYRFore,sep='') &
                     Bratio$Label <= paste('Bratio_', LastYRFore,sep=''), ]  

#Add column that reflects the actual ABC and not the catches


ForeTable = as.data.frame(cbind(c(FirstYRFore:LastYRFore),
                                round(OFLCatch$Value,0),
                                round(ForeCatch$Value,0),
                                round(ForeCatch$Value,0),
                                round(Age0plus$Bio_all,0),
                                round(SSB$Value,1),
                                round((Bratio$Value*100),1)))

colnames(ForeTable) = c('Year','OFL (mt)','ABC (mt)','Assumed Dead Removals (mt)','Age 0+ Biomass (mt)',
                        'Spawning Output (million eggs)',' Fraction Unfished') 

ForeTable[c(1:2),2] = '\\textit{154}'
ForeTable[c(1:2),3] = '\\textit{129}'
ForeTable[c(1:2),4] = '\\textit{114}'

# Create the table
      OFL.table = xtable(ForeTable, caption=c('Projected OFL, default harvest control rule 
                                        catch (ABC = ACL) above 40\\% SSB, biomass, 
                                        and depletion using the post-STAR base case model. The  
                                        2019-2020 assumed dead removals are set equal to the projected catch 
                                        (114 mt) rather than the ABC. The ABC and OFL for 2019-2020 had 
                                        been accepted for management at the time of this assesment.'),
                  label = 'tab:OFL_projection',digits = c(0,0,0,0,0,0,1,1))
      
    align(OFL.table) = c('l','c','c','c','>{\\centering}p{1.1in}',
                         '>{\\centering}p{1in}','>{\\centering}p{1in}',
                         '>{\\centering}p{.8in}')


# =============================================================================
# Decision Table(s) -----------------------------------------------------------
# Required: READ in the DecisionTable_mod CSV files ---------------------------

# Model 1
# Read in decision table file
  decision_mod1 = read.csv('./txt_files/DecisionTable_mod1.csv')
       colnames(decision_mod1) = c('', 
                                   'Year',  
                                   'Catch',	
                                   'Spawning Output',	
                                   'Depletion', 
                                   'Spawning Output',	
                                   'Depletion',	
                                   'Spawning Output',	
                                   'Depletion')
      
       decision_mod1.table = xtable(decision_mod1, 
                                    caption = c(paste('Summary of 10-year 
                                             projections beginning in ', LastYR+2,' 
                                             for alternate states of nature based on 
                                             an axis of uncertainty for the ', mod1_label, 
                                             '.  Columns range over low, mid, and high
                                             states of nature, and rows range over different 
                                             assumptions of catch levels. The low state of nature 
                                             fixed the growth parameter $k$ at 0.046 (estimated: L1 = 14.1 
                                             and L2 = 30.6). The high state fixes all growth parameters to the external 
                                             estimate ($k$ = 0.248, L1 = 13.8, L2 = 28.5). For reference 
                                             the base case estimated $k$ = 0.106, L1 = 13.4 and L2 = 28.9. 
                                            The 2019 and 2020 catches were set to the projected catch of 
                                              114 mt, provided by CDFW.'
                                             , sep = '')), 
                                     label='tab:Decision_table_mod1',
                                    digits = c(0,0,0,0,1,1,1,1,1,1))
      
    # Assign alignment and add the header columns
       align(decision_mod1.table) = c('l','l|','c','c|','>{\\centering}p{.7in}','c|','>{\\centering}p{.7in}','c|','>{\\centering}p{.7in}','c') 
    
        addtorow <- list()
        addtorow$pos <- list()
        addtorow$pos[[1]] <- -1
        addtorow$pos[[2]] <- -1
        addtorow$command <- c( ' \\multicolumn{3}{c}{}  &  \\multicolumn{2}{c}{} 
                               & \\multicolumn{2}{c}{\\textbf{States of nature}} 
                               & \\multicolumn{2}{c}{} \\\\\n', 
                               ' \\multicolumn{3}{c}{}  &  \\multicolumn{2}{c}{Low State} 
                               & \\multicolumn{2}{c}{Base State} 
                               &  \\multicolumn{2}{c}{High State} \\\\\n')
        
  

# =============================================================================
# Base case summary table -----------------------------------------------------
# Required: PARTIALLY READS CSV FILE ------------------------------------------

# Collect the data from all the tables
# Read in the management table
mngmt = read.csv('./txt_files/Exec_basemodel_summary.csv')
mngmt = mngmt[,-1]
    
# Model 1
  # SPR ratio and exploitation
  SPRratio_Exploit_mod1 = SPRratio_Exploit_mod1[2:nrow(SPRratio_Exploit_mod1),c(2,4)]
  SPRratio_Exploit_mod1[,c(1,2)] = round(SPRratio_Exploit_mod1[,c(1,2)],2)

  # SPR blanks for the last year
  blanks = c(NA,NA)
  SPRratio_Exploit_mod1 = rbind(SPRratio_Exploit_mod1,blanks)
  rownames(SPRratio_Exploit_mod1)[10]='Lastyear'
  
  # Age 5+ biomass
  Age5biomass_mod1 = mod1$timeseries[,c('Yr','Bio_smry')]
  Age5biomassyrs_mod1 = subset(Age5biomass_mod1, Yr>=(FirstYR) & Yr<=(LastYR))
  Age5biomassyrs_mod1 = Age5biomassyrs_mod1[,2]
  Age5biomassyrs_mod1 = round(Age5biomassyrs_mod1,2)
  
  # Spawning biomass and depltion
  SpawnDeplete_mod1 = SpawnDeplete_mod1[,c(2:5)]
  SpawnDeplete_mod1[,1] = round(SpawnDeplete_mod1[,1],1)
  SpawnDeplete_mod1[,3] = round(SpawnDeplete_mod1[,3],1)
  
  # Recruitment
  Recruittab_mod1 = Recruittab_mod1[,c(2,3)]
  Recruittab_mod1[,2] = Recruittab_mod1[,2]
  
  # BIND ALL DATA TOGETHER
  mod1_summary = cbind(SPRratio_Exploit_mod1,
                       Age5biomassyrs_mod1,
                       SpawnDeplete_mod1,
                       Recruittab_mod1)
    


# -----------------------------------------------------------------------------    
# CREATE TABLES BASED ON HOW MANY MODELS AND MANAGEMENT AREAS YOU HAVE
  
# ONE MODEL

  # Bind data from all three models together
  base_summary1 = as.data.frame(cbind(mngmt,mod1_summary))

  # Transpose the dataframe to create the table and create data labels  
  base_summary = as.data.frame(t(base_summary1))
  base_summary$names=c('Total mortality (mt)',
                       'Complex OFL (mt)', 
                       'Complex ACL (mt)',
                       
                       '(1-$SPR$)(1-$SPR_{50\\%}$)',
                       'Exploitation rate',
                       paste('Age ',min_age,' biomass (mt)',sep=''),
                       'Spawning Output',
                       '~95\\% CI',
                       'Depletion',
                       '~95\\% CI',
                       'Recruits',
                       '~95\\% CI')
  
  base_summary = base_summary[,c(ncol(base_summary),1:(ncol(base_summary)-1))]
  colnames(base_summary) = c('Quantity',seq(FirstYR+1,LastYR+1))
  
  # # Create the table``
  base_summary.table = xtable(base_summary, caption=c('Base case results summary.'),
                              label='tab:base_summary',digits=0)
  # # Add alignment   

      align(base_summary.table) = c('l',
                                'r',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}',
                                '>{\\centering}p{1.1in}')


  
  ################################################################################################################################################################
  # Executive summary values
  ################################################################################################################################################################
  
  # Lowest four recruitment years 
  RecDevs.all = mod1$recruitpars[grep('Late_RecrDev_', rownames(mod1$recruitpars)), c("Value", "Parm_StDev")]
  ind = sort(RecDevs.all[, "Value"], index.return = TRUE)$ix[1:4]
  find.yr = rownames(mod1$recruitpars[grep('Late_RecrDev', rownames(mod1$recruitpars)), ])
  temp = substring(find.yr,14)
  recdev.lowest = temp[ind]
  
  # Lowest SB
  find.sb = mod$derived_quants[grep('SSB', mod$derived_quants$Label), ]
  temp = find.sb[find.sb$Label >= paste('SSB_', Dat_start_mod1, sep='') & find.sb$Label <= paste('SSB_', Dat_end_mod1,  sep=''), ]  
  ind = sort(temp$Value, index.return = TRUE)$ix[1]
  ssb.yr = substring(temp$Label, 5)
  low.ssb = ssb.yr[ind]
  
  low.dep.value = paste0( round(100*mod$derived_quants[mod$derived_quants$Label == paste0("SSB_", low.ssb), 'Value'] / 
                                  mod$derived_quants[mod$derived_quants$Label == "SSB_Virgin", 'Value'],1), "%")
  
  Tot.catch = aggregate(ret_bio ~ Yr, FUN = sum, mod1$catch)$ret_bio
  Tot.catch = Tot.catch[-1]
  Tot.catch.df = cbind(Dat_start_mod1:Dat_end_mod1, Tot.catch)
  temp = sort(Tot.catch.df[,2], index.return = TRUE)$ix
  max.catch.5 = Tot.catch.df[(temp[length(temp)]-5):temp[length(temp)],]
  
  Tot.catch.df = as.data.frame(Tot.catch.df)
  colnames(Tot.catch.df)<-c("Year", "Catch")
  