#V3.30.13.09-opt;_2019_06_30;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#C  generic forecast file
# for all year entries except rebuilder; enter either: actual year, -999 for styr, 0 for endyr, neg number for rel. endyr
1 # Benchmarks: 0=skip; 1=calc F_spr,F_btgt,F_msy; 2=calc F_spr,F0.1,F_msy 
2 # MSY: 1= set to F(SPR); 2=calc F(MSY); 3=set to F(Btgt) or F0.1; 4=set to F(endyr) 
0.5 # SPR target (e.g. 0.40)
0.4 # Biomass target (e.g. 0.40)
#_Bmark_years: beg_bio, end_bio, beg_selex, end_selex, beg_relF, end_relF, beg_recr_dist, end_recr_dist, beg_SRparm, end_SRparm (enter actual year, or values of 0 or -integer to be rel. endyr)
 0 0 0 0 0 0 0 0 0 0
2 #Bmark_relF_Basis: 1 = use year range; 2 = set relF same as forecast below
#
1 # Forecast: 0=none; 1=F(SPR); 2=F(MSY) 3=F(Btgt) or F0.1; 4=Ave F (uses first-last relF yrs); 5=input annual F scalar
12 # N forecast years 
1 # F scalar (only used for Do_Forecast==5)
#_Fcast_years:  beg_selex, end_selex, beg_relF, end_relF, beg_mean recruits, end_recruits  (enter actual year, or values of 0 or -integer to be rel. endyr)
0 0 0 0 0 0
0 # Forecast selectivity (0=fcast selex is mean from year range; 1=fcast selectivity from annual time-vary parms)
1 # Control rule method (1: ramp does catch=f(SSB), buffer on F; 2: ramp does F=f(SSB), buffer on F; 3: ramp does catch=f(SSB), buffer on catch; 4: ramp does F=f(SSB), buffer on catch) 
0.4 # Control rule Biomass level for constant F (as frac of Bzero, e.g. 0.40); (Must be > the no F level below) 
0.1 # Control rule Biomass level for no F (as frac of Bzero, e.g. 0.10) 
-1 # Sigma = 0.72 and P* = 0.45; Control rule target as fraction of Flimit (e.g. 0.75) 
2019 1
2020 1
# pstar = 0.45; sigma = 1.0
2021 0.874
2022 0.865
2023 0.857
2024 0.849
2025 0.841
2026 0.833
2027 0.826
2028 0.818
2029 0.810
2030 0.803
-9999 0
3 #_N forecast loops (1=OFL only; 2=ABC; 3=get F from forecast ABC catch with allocations applied)
3 #_First forecast loop with stochastic recruitment
0 #_Forecast loop control #3 (reserved for future bells&whistles) 
0 #_Forecast loop control #4 (reserved for future bells&whistles) 
0 #_Forecast loop control #5 (reserved for future bells&whistles) 
2031  #FirstYear for caps and allocations (should be after years with fixed inputs) 
0 # stddev of log(realized catch/target catch) in forecast (set value>0.0 to cause active impl_error)
0 # Do West Coast gfish rebuilder output (0/1) 
2001 # Rebuilder:  first year catch could have been set to zero (Ydecl)(-1 to set to 1999)
2017 # Rebuilder:  year for current age structure (Yinit) (-1 to set to endyear+1)
1 # fleet relative F:  1=use first-last alloc year; 2=read seas, fleet, alloc list below
# Note that fleet allocation is used directly as average F if Do_Forecast=4 
2 # basis for fcast catch tuning and for fcast catch caps and allocation  (2=deadbio; 3=retainbio; 5=deadnum; 6=retainnum)
# Conditional input if relative F choice = 2
# Fleet relative F:  rows are seasons, columns are fleets
#_Fleet:  Fishery ASHOP Foreign POP EarlyTriennial LateTriennial AFSCSlope NWFSCSlope NWFSCcombo
#  1 0 0 0 0 0 0
# enter list of fleet number and max for fleets with max annual catch; terminate with fleet=-9999
-9999 -1
# enter list of area ID and max annual catch; terminate with area=-9999
-9999 -1 
# enter list of fleet number and allocation group assignment, if any; terminate with fleet=-9999
-9999 -1
#_if N allocation groups >0, list year, allocation fraction for each group 
# list sequentially because read values fill to end of N forecast
# terminate with -9999 in year field 
# no allocation groups
2 # basis for input Fcast catch: -1=read basis with each obs; 2=dead catch; 3=retained catch; 99=input Hrate(F)
#enter list of Fcast catches; terminate with line having year=-9999
#_Yr Seas Fleet Catch(or_F) Basis 
2019 	1 	1 	51.5
2019 	1 	2 	54.1
2019 	1 	3 	8.4
2020 	1 	1 	51.5
2020 	1 	2 	54.1
2020 	1 	3 	8.4
2021	1	1	65.99	#sum_for_2021: 126.75
2021	1	2	50.17	
2021	1	3	10.59	
2022	1	1	66.25	#sum_for_2022: 127.93
2022	1	2	50.65	
2022	1	3	11.03	
2023	1	1	69.06	#sum_for_2023: 133.21
2023	1	2	52.71	
2023	1	3	11.44	
2024	1	1	72.61	#sum_for_2024: 139.4
2024	1	2	55.1	
2024	1	3	11.69	
2025	1	1	75.34	#sum_for_2025: 143.89
2025	1	2	56.83	
2025	1	3	11.72	
2026	1	1	76.43	#sum_for_2026: 145.44
2026	1	2	57.42	
2026	1	3	11.59	
2027	1	1	75.93	#sum_for_2027: 144.27
2027	1	2	56.96	
2027	1	3	11.38	
2028	1	1	74.46	#sum_for_2028: 141.52
2028	1	2	55.89	
2028	1	3	11.17	
2029	1	1	72.79	#sum_for_2029: 138.53
2029	1	2	54.73	
2029	1	3	11.01	
2030	1	1	71.43	#sum_for_2030: 136.15
2030	1	2	53.8	
2030	1	3	10.92	
-9999 1 1 0  2 
#
999 # verify end of input 
