#V3.30.13.09-opt;_2019_06_30;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject to copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: gopher.dat // gopher.ctl
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and also read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle timing; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 7 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1999 2018
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_block=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transformed units (beware); -2: endtrend and infl_year direct values; -3: end and infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3: null;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: random walk;  4: zero-reverting random walk with rho;  21-24 keep last dev for rest of years
#
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=lognormal; 4=lognormal with biascorr; 5=gamma
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
2 #_Age(post-settlement)_for_L1;linear growth below this
23 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.05 0.4 0.212477 -1.6458 0.4384 3 2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 4 50 9.66611 9.58981 999 0 3 0 0 0 0 1 0 0 # L_at_Amin_Fem_GP_1
 20 60 28.444 28.5486 999 0 3 0 0 0 0 1 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.124742 0.129089 999 0 3 0 0 0 0 1 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.268207 0.257658 999 0 3 0 0 0 0 1 0 0 # CV_young_Fem_GP_1
 0.03 0.3 0.114746 0.116626 999 0 3 0 0 0 0 1 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 8.84e-006 8.84e-006 999 0 -3 0 0 0 0 1 0 0 # Wtlen_1_Fem_GP_1
 2 4 3.25584 3.25584 999 0 -3 0 0 0 0 1 0 0 # Wtlen_2_Fem_GP_1
# Sex: 1  BioPattern: 1  Maturity&Fecundity
 -3 3 21.6658 21.6658 1000 -1 -3 0 0 0 0 1 0 0 # Mat50%_Fem_GP_1
 -6 3 -0.905692 -0.905692 1000 -1 -3 0 0 0 0 1 0 0 # Mat_slope_Fem_GP_1
 -3 3 1 1 999 0 -3 0 0 0 0 1 0 0 # Eggs/kg_inter_Fem_GP_1
 -3 3 0 0 999 0 -3 0 0 0 0 1 0 0 # Eggs/kg_slope_wt_Fem_GP_1
# Hermaphroditism
#  Recruitment Distribution  
#  Cohort growth dev base
 0.1 10 1 1 1 0 -1 0 0 0 0 1 0 0 # CohortGrowDev
#  Movement
#  Age Error from parameters
#  catch multiplier
#  fraction female, by GP
 1e-006 0.999999 0.5 0.5 1000 0 -4 0 0 0 0 1 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             2            15        8.5992       8.47334            99             0          1          0          0          0          0          1          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72          0.16             2         -1          0          0          0          0          1          0          0 # SR_BH_steep
             0             2           0.5           0.5            99             0         -2          0          0          0          0          1          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -4          0          0          0          0          1          0          0 # SR_regime
            -1             1      0.652673      0.677701            99             0          4          0          0          0          0          1          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1978 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1960 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1955.52 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1972.34 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2015.16 #_last_yr_fullbias_adj_in_MPD
 2019.87 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.6504 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 60 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# Specified recr devs to read
#_Yr Input_value # Final_value
 1960 -0.479728 # -0.479726
 1961 -0.599827 # -0.599826
 1962 -0.689117 # -0.689115
 1963 -0.750669 # -0.750667
 1964 -0.780328 # -0.780327
 1965 -0.772247 # -0.772247
 1966 -0.722305 # -0.722306
 1967 -0.628467 # -0.628469
 1968 -0.496742 # -0.496742
 1969 -0.379877 # -0.379874
 1970 -0.330599 # -0.330598
 1971 -0.354343 # -0.354345
 1972 -0.440985 # -0.440987
 1973 -0.507443 # -0.507444
 1974 -0.443346 # -0.443347
 1975 -0.279017 # -0.279018
 1976 -0.124052 # -0.124054
 1977 -0.0317483 # -0.0317499
 1978 -0.00837857 # -0.00837913
 1979 -0.0774037 # -0.0774053
 1980 -0.0518616 # -0.0518644
 1981 -0.0218301 # -0.0218309
 1982 0.0137321 # 0.0137329
 1983 -0.11974 # -0.119741
 1984 -0.43311 # -0.433111
 1985 -0.613299 # -0.613302
 1986 -0.662186 # -0.662188
 1987 -0.562896 # -0.562896
 1988 -0.320175 # -0.320175
 1989 0.0363476 # 0.0363466
 1990 0.416013 # 0.416013
 1991 0.678915 # 0.678915
 1992 0.773425 # 0.773427
 1993 0.773581 # 0.773581
 1994 0.758642 # 0.758641
 1995 0.659825 # 0.659825
 1996 0.440518 # 0.440519
 1997 0.108047 # 0.10805
 1998 -0.160738 # -0.160736
 1999 -0.281676 # -0.281676
 2000 -0.284009 # -0.28401
 2001 -0.101062 # -0.101063
 2002 0.0425881 # 0.042588
 2003 -0.167451 # -0.167451
 2004 -0.378019 # -0.378019
 2005 -0.453396 # -0.453396
 2006 -0.488737 # -0.488737
 2007 -0.459357 # -0.459357
 2008 -0.359833 # -0.359833
 2009 -0.193117 # -0.193116
 2010 -0.14913 # -0.14913
 2011 -0.306693 # -0.306694
 2012 -0.294006 # -0.294005
 2013 -0.025755 # -0.025753
 2014 0.541956 # 0.541958
 2015 0.951483 # 0.951485
 2016 0.646466 # 0.646465
 2017 0.213169 # 0.213168
 2018 -0.0808479 # -0.0808481
 2019 -0.0527687 # -0.0527674
#
# all recruitment deviations
#  1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F 2029F 2030F
#  -0.479726 -0.599826 -0.689115 -0.750667 -0.780327 -0.772247 -0.722306 -0.628469 -0.496742 -0.379874 -0.330598 -0.354345 -0.440987 -0.507444 -0.443347 -0.279018 -0.124054 -0.0317499 -0.00837913 -0.0774053 -0.0518644 -0.0218309 0.0137329 -0.119741 -0.433111 -0.613302 -0.662188 -0.562896 -0.320175 0.0363466 0.416013 0.678915 0.773427 0.773581 0.758641 0.659825 0.440519 0.10805 -0.160736 -0.281676 -0.28401 -0.101063 0.042588 -0.167451 -0.378019 -0.453396 -0.488737 -0.459357 -0.359833 -0.193116 -0.14913 -0.306694 -0.294005 -0.025753 0.541958 0.951485 0.646465 0.213168 -0.0808481 -0.0527674 -0.0344399 -0.022478 -0.0146713 -0.00957551 -0.00624903 -0.00407839 -0.00266234 -0.00173818 -0.00113398 -0.000739625 -0.000483396
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
#
#Fishing Mortality info 
0.5 # F ballpark
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
4 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2030 2039
# F rates by fleet
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028 2029 2030
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Com 0.00748024 0.0116556 0.013682 0.00954377 0.0097517 0.00806404 0.00694194 0.00750928 0.00433948 0.00542028 0.00876017 0.00744536 0.00900643 0.00746095 0.0105924 0.00378354 0.0122779 0.005094 0.0034453 0.000853627 1.07473e-005 0.014417 0.0205215 0.0263741 0.0342534 0.0349055 0.0175723 0.0226443 9.69247e-005 0.00120518 0.0342253 0.0552997 0.0502832 0.0389374 0.036865 0.054455 0.0617573 0.0734515 0.0947177 0.0703978 0.0987916 0.0930963 0.0844779 0.049768 0.0289576 0.0452552 0.0704896 0.0579541 0.042969 0.0558458 0.034978 0.0173446 0.021665 0.0264913 0.0392377 0.0419921 0.0604761 0.107381 0.127675 0.141602 0.161482 0.156622 0.241363 0.200285 0.406717 0.378946 0.303397 0.231987 0.142219 0.0769176 0.238417 0.329026 0.515944 0.402781 0.393002 0.587093 0.792709 0.810224 0.700491 1.26639 1.32955 0.868799 0.655609 0.405974 0.279245 0.226775 0.153196 0.0667514 0.0749531 0.0753711 0.0603877 0.0744715 0.0888579 0.089969 0.10487 0.124616 0.105081 0.109488 0.125823 0.160371 0.147013 0.177331 0.205493 0.501377 0.501378 0.501378 0.501378 0.501393 0.50151 0.50193 0.502904 0.504618 0.507087 0.510043 0.512932
# ComDisc 0.000303365 0.000472315 0.000553841 0.000385961 0.000394086 0.00032569 0.000280256 0.000303066 0.000175112 0.000218729 0.000353463 0.000300356 0.000363248 0.000300812 0.000426862 0.000152414 0.000494343 0.000204964 0.000138579 3.43279e-005 4.32136e-007 0.000579236 0.000823085 0.00105559 0.00136721 0.00138886 0.000697798 0.000898387 3.84553e-006 4.78695e-005 0.00135877 0.00218922 0.00198313 0.00152993 0.00144337 0.00212236 0.00239379 0.00283175 0.00362848 0.00267939 0.00373551 0.00349405 0.0031456 0.00184178 0.00107016 0.00167326 0.00260484 0.00214034 0.00159101 0.00208133 0.00131912 0.000666528 0.000852047 0.00106776 0.00161677 0.00176007 0.0025584 0.00452102 0.0052627 0.00563365 0.00613982 0.00568834 0.00843198 0.00679304 0.0132953 0.0117942 0.00903372 0.00665095 0.00391465 0.00203229 0.00610598 0.00830108 0.0131225 0.0105029 0.0106097 0.0163391 0.0223847 0.0225796 0.0186175 0.030974 0.0293551 0.0179541 0.0134498 0.0105478 0.00775169 0.00678393 0.00495577 0.014726 0.00292058 0.00360764 0.0044794 0.00500681 0.00185346 0.00637942 0.00496667 0.00785095 0.00281535 0.00434449 0.00454367 0.00491297 0.00422744 0.00297215 0.00460076 0.0112253 0.0112253 0.0112253 0.0112256 0.011229 0.0112406 0.0112645 0.0113013 0.0113479 0.0113976 0.0114414 0.0114713
# RecNorth 0 0 0 0 0 0 0 0 0 0 0 0 0.00155622 0.00311544 0.00358635 0.00478705 0.00599368 0.00720681 0.00841432 0.00961952 0.0108233 0.0128656 0.0127308 0.011212 0.0162935 0.0152087 0.00811841 0.00777359 0.00636921 0.00844802 0.0145675 0.0116476 0.0235557 0.030899 0.0380603 0.0475488 0.0420631 0.0363808 0.0460829 0.0559486 0.0636419 0.0733909 0.113704 0.0917326 0.06866 0.0661253 0.06687 0.0658017 0.0517372 0.0739939 0.081003 0.08954 0.0903223 0.0793789 0.108605 0.0866872 0.123391 0.163193 0.188062 0.199613 0.222718 0.206308 0.17064 0.199174 0.482339 0.545588 0.594026 0.62116 1.17972 1.31037 1.49196 1.04777 0.682439 0.544532 0.646505 0.781752 0.993487 1.30126 1.1438 0.624502 0.4803 0.424111 0.391218 0.343621 0.382102 0.510179 0.350012 0.413453 0.141107 0.149049 0.144699 0.0967647 0.132756 0.198478 0.344527 0.267122 0.180215 0.14992 0.234435 0.255734 0.309378 0.245701 0.187593 0.457704 0.457704 0.457704 0.457708 0.457752 0.457943 0.458445 0.459431 0.461018 0.463185 0.465693 0.468085
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 1.3354e-005 2.67335e-005 4.01528e-005 5.35827e-005 6.7065e-005 8.06014e-005 9.40835e-005 0.000107544 0.000189973 0.000273003 0.00035731 0.000442737 0.000529869 0.000618542 0.000705579 0.000790946 0.000874126 0.000954807 0.00104088 0.00113501 0.00123308 0.00133154 0.00142996 0.0015339 0.00164274 0.00175237 0.00186897 0.00198732 0.0021091 0.00223837 0.00237384 0.00249833 0.00259215 0.00267774 0.00277635 0.00287952 0.00297414 0.00308739 0.00323575 0.00341492 0.00364101 0.00392049 0.00427509 0.0046972 0.00519022 0.00581773 0.00655444 0.00730608 0.00802119 0.00862743 0.00914123 0.00958856 0.0107108 0.0104851 0.00981813 0.00876858 0.0150562 0.0158374 0.0184332 0.0164645 0.0133818 0.00968073 0.00730324 0.00524494 0.00320388 0.00697998 0.0118593 0.00467541 0.0188537 0.00858881 0.00616099 0.0208619 0.00740152 0.00489519 0.00292328 0.00347759 0.00120826 0.00797468 0.00257451 0.0033001 0.00449636 0.00557202 0.00540341 0.0153541 0.0157554 0.0147388 0.0158011 0.00917873 0.0126567 0.0221972 0.0126336 0.0308244 0.0308244 0.0308245 0.0308263 0.0308371 0.0308685 0.0309298 0.0310238 0.0311455 0.0312804 0.031406 0.0314986
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         5         1         0         1         0         1  #  DebCPFV
         6         1         0         1         0         1  #  RecOnboardNorth
         7         1         0         1         0         1  #  RecOnboardSouth
         8         1         0         1         0         1  #  PISCO
         9         1         0         1         0         1  #  CCFRP
        10         1         0         1         0         1  #  RecDocksideNorth
        11         1         0         1         0         1  #  RecDocksideSouth
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -7.10752      -6.98277          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_DebCPFV(5)
             0             2     0.0754974     0.0695633          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_DebCPFV(5)
           -15            15      -7.82202      -7.71816          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardNorth(6)
        0.0001             2      0.234122      0.229558          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardNorth(6)
           -15            15      -10.3806      -10.3005          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardSouth(7)
        0.0001             2      0.598025      0.597079          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardSouth(7)
           -15            15      -7.71572      -7.60551          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_PISCO(8)
        0.0001             2      0.199688       0.20918          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_PISCO(8)
           -15            15      -6.56422      -6.44959          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_CCFRP(9)
        0.0001             2      0.186918      0.184573          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_CCFRP(9)
           -15            15      -8.88184      -8.79837          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideNorth(10)
             0             2             0             0          1000             0         -4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideNorth(10)
           -15            15      -9.79792      -9.77089          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideSouth(11)
        0.0001             2      0.282239      0.275938          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideSouth(11)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scaling (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constant above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; parm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, then selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joiners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for scaling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all_discarded_dead;_4=define_dome-shaped_retention
#_Pattern Discard Male Special
 24 0 0 0 # 1 Com
 24 0 0 0 # 2 ComDisc
 24 0 0 0 # 3 RecNorth
 24 0 0 0 # 4 RecSouth
 24 0 0 0 # 5 DebCPFV
 5 0 0 3 # 6 RecOnboardNorth
 5 0 0 4 # 7 RecOnboardSouth
 24 0 0 0 # 8 PISCO
 24 0 0 0 # 9 CCFRP
 5 0 0 3 # 10 RecDocksideNorth
 5 0 0 4 # 11 RecDocksideSouth
 0 0 0 0 # 12 Dummy1
#
#_age_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for ages 0 to maxage
#Pattern:_10; parm=0; selex=1.0 for ages 1 to maxage
#Pattern:_11; parm=2; selex=1.0  for specified min-max age
#Pattern:_12; parm=2; age logistic
#Pattern:_13; parm=8; age double logistic
#Pattern:_14; parm=nages+1; age empirical
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_16; parm=2; Coleraine - Gaussian
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scaling (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param for scaling (average over bin range)
#_Pattern Discard Male Special
 0 0 0 0 # 1 Com
 0 0 0 0 # 2 ComDisc
 0 0 0 0 # 3 RecNorth
 0 0 0 0 # 4 RecSouth
 0 0 0 0 # 5 DebCPFV
 0 0 0 0 # 6 RecOnboardNorth
 0 0 0 0 # 7 RecOnboardSouth
 0 0 0 0 # 8 PISCO
 0 0 0 0 # 9 CCFRP
 0 0 0 0 # 10 RecDocksideNorth
 0 0 0 0 # 11 RecDocksideSouth
 0 0 0 0 # 12 Dummy1
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Com LenSelex
            19            38       32.2472        32.339            99             0          1          0          0          0          0        0.5          1          2  #  Size_DblN_peak_Com(1)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Com(1)
            -9            10       3.11141       3.12435            99             0          5          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_Com(1)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Com(1)
           -15            -5      -11.7583      -11.7081            99             0          5          0          0          0          0        0.5          1          2  #  Size_DblN_start_logit_Com(1)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Com(1)
# 2   ComDisc LenSelex
            19            38       25.0254        25.041            99             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_peak_ComDisc(2)
           -15            10      -9.37971      -9.37674            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_ComDisc(2)
            -9            10        2.0346       2.03482            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_ComDisc(2)
            -9             9       5.51808       5.46908            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_ComDisc(2)
           -15            -5      -14.1419      -14.1176            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_ComDisc(2)
            -5            10          -999          -999            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_ComDisc(2)
# 3   RecNorth LenSelex
            19            39       32.4184       32.3789            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecNorth(3)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecNorth(3)
            -9            10       3.26951       3.26365            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecNorth(3)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecNorth(3)
           -15            -5      -12.0416      -11.9717            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecNorth(3)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecNorth(3)
# 4   RecSouth LenSelex
            19            38       27.5486       27.7317            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecSouth(4)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecSouth(4)
            -9            10       3.08118       3.21209            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecSouth(4)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecSouth(4)
           -15            -5      -8.65485      -8.81965            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecSouth(4)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecSouth(4)
# 5   DebCPFV LenSelex
            19            38       30.7985       30.8941            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_DebCPFV(5)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_DebCPFV(5)
            -9            10       2.98558       2.99934            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_DebCPFV(5)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_DebCPFV(5)
           -20            -5      -17.9784      -17.8513            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_DebCPFV(5)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_DebCPFV(5)
# 6   RecOnboardNorth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardNorth(6)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardNorth(6)
# 7   RecOnboardSouth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardSouth(7)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardSouth(7)
# 8   PISCO LenSelex
            19            38       30.5095       30.4521            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_PISCO(8)
           -15            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_PISCO(8)
            -9            10       3.92455       3.90714            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_PISCO(8)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_PISCO(8)
           -15            15      -2.82855      -2.80113            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_PISCO(8)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_PISCO(8)
# 9   CCFRP LenSelex
            19            38       31.0672       31.0502            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_CCFRP(9)
           -15            10        -10.63       -10.648            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_CCFRP(9)
            -9            10       3.14268       3.13457            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_CCFRP(9)
           -15             9       1.66359       1.64329            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_CCFRP(9)
           -15            -5          -999          -999            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_CCFRP(9)
            -5            10          -999          -999            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_CCFRP(9)
# 10   RecDocksideNorth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecDocksideNorth(10)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecDocksideNorth(10)
# 11   RecDocksideSouth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecDocksideSouth(11)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecDocksideSouth(11)
# 12   Dummy1 LenSelex
# 1   Com AgeSelex
# 2   ComDisc AgeSelex
# 3   RecNorth AgeSelex
# 4   RecSouth AgeSelex
# 5   DebCPFV AgeSelex
# 6   RecOnboardNorth AgeSelex
# 7   RecOnboardSouth AgeSelex
# 8   PISCO AgeSelex
# 9   CCFRP AgeSelex
# 10   RecDocksideNorth AgeSelex
# 11   RecDocksideSouth AgeSelex
# 12   Dummy1 AgeSelex
# timevary selex parameters 
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type    PHASE  #  parm_name
            19            38          28.9       43.8236            10             0      6  # Size_DblN_peak_Com(1)_BLK1repl_1999
            -9            10        1.5884       4.66827            10             0      6  # Size_DblN_ascend_se_Com(1)_BLK1repl_1999
           -15            -5      -12.0881      -12.0962            10             0      6  # Size_DblN_start_logit_Com(1)_BLK1repl_1999
# info on dev vectors created for selex parms are reported with other devs after tag parameter section 
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# deviation vectors for timevary parameters
#  base   base first block   block  env  env   dev   dev   dev   dev   dev
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase  dev_vector
#      5     1     1     1     2     0     0     0     0     0     0     0
#      5     3     2     1     2     0     0     0     0     0     0     0
#      5     5     3     1     2     0     0     0     0     0     0     0
     #
# Input variance adjustments factors: 
 #_1=add_to_survey_CV
 #_2=add_to_discard_stddev
 #_3=add_to_bodywt_CV
 #_4=mult_by_lencomp_N
 #_5=mult_by_agecomp_N
 #_6=mult_by_size-at-age_N
 #_7=mult_by_generalized_sizecomp
#_Factor  Fleet  Value
4 1 0.1636
4 2 0.1523141
4 3 0.3816127
4 4 0.07677502
4 5 0.3925985
4 6 1
4 7 1
4 8 0.1752846
4 9 0.1253266
4 10 1
4 11 1
4 12 1
5 1 1
5 2 1
5 3 0.2517878
5 4 1
5 5 1
5 6 1
5 7 1
5 8 1
5 9 0.04487722
5 10 1
5 11 1
5 12 0.09938951
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 1 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
 1 8 1 1 1
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  0 0 0 0 #_CPUE/survey:_4
#  1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 #_CPUE/survey:_8
#  1 1 1 1 #_CPUE/survey:_9
#  1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 #_CPUE/survey:_11
#  0 0 0 0 #_CPUE/survey:_12
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  1 1 1 1 #_lencomp:_5
#  0 0 0 0 #_lencomp:_6
#  0 0 0 0 #_lencomp:_7
#  1 1 1 1 #_lencomp:_8
#  1 1 1 1 #_lencomp:_9
#  0 0 0 0 #_lencomp:_10
#  0 0 0 0 #_lencomp:_11
#  0 0 0 0 #_lencomp:_12
#  0 0 0 0 #_agecomp:_1
#  0 0 0 0 #_agecomp:_2
#  1 1 1 1 #_agecomp:_3
#  0 0 0 0 #_agecomp:_4
#  0 0 0 0 #_agecomp:_5
#  0 0 0 0 #_agecomp:_6
#  0 0 0 0 #_agecomp:_7
#  0 0 0 0 #_agecomp:_8
#  1 1 1 1 #_agecomp:_9
#  0 0 0 0 #_agecomp:_10
#  0 0 0 0 #_agecomp:_11
#  1 1 1 1 #_agecomp:_12
#  1 1 1 1 #_init_equ_catch
#  1 1 1 1 #_recruitments
#  1 1 1 1 #_parameter-priors
#  1 1 1 1 #_parameter-dev-vectors
#  1 1 1 1 #_crashPenLambda
#  0 0 0 0 # F_ballpark_lambda
0 # (0/1) read specs for more stddev reporting 
 # 0 0 0 0 0 0 0 0 0 # placeholder for # selex_fleet, 1=len/2=age/3=both, year, N selex bins, 0 or Growth pattern, N growth ages, 0 or NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

