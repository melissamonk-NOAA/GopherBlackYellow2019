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
 0.05 0.4 0.217405 -1.6458 0.4384 3 2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 4 50 9.72078 9.58981 999 0 3 0 0 0 0 1 0 0 # L_at_Amin_Fem_GP_1
 20 60 28.3613 28.5486 999 0 3 0 0 0 0 1 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.121317 0.129089 999 0 3 0 0 0 0 1 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.268405 0.257658 999 0 3 0 0 0 0 1 0 0 # CV_young_Fem_GP_1
 0.03 0.3 0.116289 0.116626 999 0 3 0 0 0 0 1 0 0 # CV_old_Fem_GP_1
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
             2            15       8.66479       8.47334            99             0          1          0          0          0          0          1          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72          0.16             2         -1          0          0          0          0          1          0          0 # SR_BH_steep
             0             2           0.5           0.5            99             0         -2          0          0          0          0          1          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -4          0          0          0          0          1          0          0 # SR_regime
            -1             1      0.651883      0.677701            99             0          4          0          0          0          0          1          0          0 # SR_autocorr
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
 1960 -0.430542 # -0.468811
 1961 -0.544373 # -0.587624
 1962 -0.631434 # -0.677026
 1963 -0.693482 # -0.739671
 1964 -0.725326 # -0.771122
 1965 -0.720561 # -0.765375
 1966 -0.674926 # -0.718172
 1967 -0.586526 # -0.627248
 1968 -0.461546 # -0.498317
 1969 -0.353235 # -0.383832
 1970 -0.312475 # -0.336046
 1971 -0.344711 # -0.360999
 1972 -0.441522 # -0.448984
 1973 -0.515569 # -0.51603
 1974 -0.458002 # -0.451829
 1975 -0.299599 # -0.287179
 1976 -0.149141 # -0.132097
 1977 -0.060598 # -0.0396755
 1978 -0.0388527 # -0.0150776
 1979 -0.109635 # -0.0830009
 1980 -0.0803798 # -0.0560198
 1981 -0.033649 # -0.0268034
 1982 0.0261875 # 0.00608363
 1983 -0.0902183 # -0.13135
 1984 -0.405277 # -0.446851
 1985 -0.598045 # -0.626585
 1986 -0.663674 # -0.67425
 1987 -0.57959 # -0.573284
 1988 -0.348772 # -0.329143
 1989 -0.000987798 # 0.0281257
 1990 0.372912 # 0.4082
 1991 0.634749 # 0.672363
 1992 0.736092 # 0.768768
 1993 0.740181 # 0.768678
 1994 0.710538 # 0.753604
 1995 0.609743 # 0.657108
 1996 0.432496 # 0.439626
 1997 0.142232 # 0.107636
 1998 -0.108109 # -0.160886
 1999 -0.252627 # -0.281102
 2000 -0.306606 # -0.281433
 2001 -0.12246 # -0.0955729
 2002 0.0281682 # 0.0502509
 2003 -0.210118 # -0.158377
 2004 -0.438539 # -0.371495
 2005 -0.487846 # -0.447527
 2006 -0.465232 # -0.483414
 2007 -0.406651 # -0.454495
 2008 -0.299012 # -0.354859
 2009 -0.128466 # -0.187749
 2010 -0.0687141 # -0.140723
 2011 -0.259814 # -0.297973
 2012 -0.267943 # -0.286344
 2013 -0.0192963 # -0.0200447
 2014 0.555226 # 0.549814
 2015 0.980917 # 0.962672
 2016 0.670448 # 0.658847
 2017 0.226102 # 0.225101
 2018 -0.075477 # -0.072518
 2019 -0.0484112 # -0.047273
#
# all recruitment deviations
#  1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F 2029F 2030F
#  -0.468811 -0.587624 -0.677026 -0.739671 -0.771122 -0.765375 -0.718172 -0.627248 -0.498317 -0.383832 -0.336046 -0.360999 -0.448984 -0.51603 -0.451829 -0.287179 -0.132097 -0.0396755 -0.0150776 -0.0830009 -0.0560198 -0.0268034 0.00608363 -0.13135 -0.446851 -0.626585 -0.67425 -0.573284 -0.329143 0.0281257 0.4082 0.672363 0.768768 0.768678 0.753604 0.657108 0.439626 0.107636 -0.160886 -0.281102 -0.281433 -0.0955729 0.0502509 -0.158377 -0.371495 -0.447527 -0.483414 -0.454495 -0.354859 -0.187749 -0.140723 -0.297973 -0.286344 -0.0200447 0.549814 0.962672 0.658847 0.225101 -0.072518 -0.047273 -0.0308165 -0.0200889 -0.0130959 -0.00853668 -0.00556454 -0.00362755 -0.00236481 -0.0015416 -0.00100519 -0.000655404 -0.000426959
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
# Com 0.00804638 0.0125387 0.0147198 0.0102683 0.0104923 0.00867655 0.00746917 0.00807953 0.00466892 0.0058316 0.0094249 0.00801033 0.00968995 0.00802732 0.0113968 0.00407091 0.0132108 0.00548124 0.0037072 0.000918507 1.1564e-005 0.0155134 0.0220851 0.0283877 0.0368752 0.0375841 0.0189215 0.0243817 0.000104348 0.00129725 0.0368402 0.0595377 0.054151 0.0419411 0.0397148 0.0586774 0.0665625 0.079182 0.102132 0.0759235 0.106565 0.100441 0.0911609 0.0537051 0.031238 0.0488008 0.0759965 0.0624722 0.0463074 0.0601723 0.0376802 0.0186777 0.023319 0.0284979 0.0421898 0.0451334 0.0649865 0.115427 0.137354 0.152508 0.174156 0.169134 0.260945 0.216731 0.440795 0.411355 0.329597 0.252105 0.15464 0.0836555 0.259131 0.357029 0.558801 0.435567 0.424559 0.633935 0.855997 0.875352 0.757393 1.37083 1.44097 0.942015 0.710531 0.435253 0.298975 0.24243 0.16352 0.071145 0.0797783 0.0801327 0.0641453 0.0790552 0.0942961 0.0954749 0.111324 0.132323 0.111554 0.116164 0.133419 0.169975 0.155749 0.187766 0.217421 0.555162 0.555163 0.555163 0.555163 0.555179 0.555295 0.555712 0.556679 0.558394 0.560886 0.563892 0.566838
# ComDisc 0.000304913 0.000474757 0.000556751 0.000388013 0.000396195 0.00032744 0.000281765 0.000304699 0.000176054 0.000219902 0.000355359 0.000301969 0.000365205 0.000302438 0.000429183 0.000153246 0.000497057 0.000206098 0.000139347 3.4518e-005 4.34527e-007 0.000582476 0.000827798 0.0010618 0.0013755 0.00139756 0.000702224 0.000904079 3.86959e-006 4.81622e-005 0.00136711 0.00220315 0.00199628 0.00154043 0.00145356 0.00213789 0.00241204 0.00285409 0.00365828 0.00270219 0.00376838 0.00352594 0.00317536 0.00185952 0.0010803 0.00168875 0.0026287 0.00215983 0.00160516 0.00209904 0.00132941 0.000670951 0.00085644 0.00107153 0.0016201 0.00176162 0.00255899 0.00452368 0.00527353 0.00565847 0.00618489 0.00574663 0.00853961 0.0068933 0.0135244 0.0120293 0.00923193 0.00680644 0.00401144 0.00208419 0.00626131 0.00850509 0.0134298 0.0107373 0.0108359 0.0166759 0.0228417 0.0230533 0.0190339 0.0317356 0.0301466 0.0184592 0.0138246 0.0108284 0.00794299 0.00693517 0.00505291 0.0149721 0.00296083 0.00364727 0.00451754 0.00503941 0.00186284 0.00640581 0.00498522 0.00787848 0.00282378 0.00435483 0.00455336 0.00492459 0.00423924 0.0029813 0.00461529 0.0117847 0.0117847 0.0117847 0.011785 0.0117882 0.011799 0.0118211 0.0118554 0.0118992 0.0119467 0.0119893 0.0120188
# RecNorth 0 0 0 0 0 0 0 0 0 0 0 0 0.00167688 0.00335705 0.00386459 0.0051585 0.00645893 0.00776648 0.00906776 0.0103664 0.0116636 0.0138651 0.0137216 0.0120864 0.0175673 0.0164006 0.00875498 0.00838271 0.00686743 0.0091072 0.0157044 0.0125594 0.0254061 0.033333 0.0410646 0.051313 0.0454041 0.0392781 0.0497649 0.0604306 0.0687523 0.0792999 0.122883 0.0991382 0.0741791 0.0714149 0.0722048 0.0710408 0.055843 0.0798488 0.0873926 0.0965637 0.097356 0.085509 0.116931 0.0932936 0.132765 0.175647 0.202585 0.215279 0.240538 0.22312 0.184769 0.21587 0.5236 0.593235 0.646448 0.676256 1.28514 1.42787 1.62473 1.13923 0.740664 0.590106 0.699903 0.845905 1.07505 1.40882 1.23941 0.677566 0.521829 0.461026 0.425075 0.372944 0.414092 0.551971 0.37803 0.445804 0.151913 0.160252 0.15541 0.103847 0.142407 0.212883 0.369624 0.286653 0.193351 0.160759 0.25126 0.273987 0.331341 0.263017 0.200676 0.512404 0.512404 0.512404 0.512409 0.512453 0.512644 0.513146 0.514135 0.515738 0.517951 0.520532 0.523001
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 1.41109e-005 2.82492e-005 4.24299e-005 5.66217e-005 7.08696e-005 8.51752e-005 9.94219e-005 0.000113645 0.000200748 0.000288496 0.000377617 0.000467935 0.000560079 0.000653868 0.000745878 0.00083608 0.000923921 0.00100908 0.00110005 0.00119968 0.00130353 0.00140776 0.00151191 0.00162199 0.00173728 0.00185336 0.00197688 0.00210221 0.00223117 0.00236807 0.00251155 0.00264311 0.00274172 0.00283155 0.00293542 0.0030442 0.00314365 0.00326245 0.00341772 0.0036046 0.00384032 0.00413197 0.00450299 0.00494563 0.00546424 0.00612768 0.00691037 0.00771292 0.0084804 0.00913358 0.00968814 0.0101708 0.0113753 0.0111505 0.0104507 0.0093389 0.0160428 0.0168743 0.0196252 0.0175076 0.0142125 0.0102722 0.00774457 0.00556014 0.00339668 0.00740417 0.0125931 0.00497203 0.0200758 0.00914821 0.00655783 0.0221771 0.00785553 0.00518619 0.00309137 0.00367104 0.00127345 0.00839435 0.00270747 0.00346849 0.00472428 0.00585356 0.00567606 0.0161257 0.0165391 0.0154635 0.0165717 0.00962418 0.0132674 0.023257 0.0132284 0.0337772 0.0337772 0.0337774 0.0337792 0.0337898 0.0338202 0.0338798 0.0339717 0.034092 0.034227 0.0343538 0.0344478
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
           -15            15      -7.03311      -6.98277          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_DebCPFV(5)
             0             2     0.0753996     0.0695633          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_DebCPFV(5)
           -15            15      -7.75083      -7.71816          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardNorth(6)
        0.0001             2      0.234964      0.229558          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardNorth(6)
           -15            15      -10.3319      -10.3005          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardSouth(7)
        0.0001             2      0.595154      0.597079          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardSouth(7)
           -15            15       -7.6292      -7.60551          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_PISCO(8)
        0.0001             2       0.19997       0.20918          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_PISCO(8)
           -15            15      -6.50322      -6.44959          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_CCFRP(9)
        0.0001             2      0.186386      0.184573          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_CCFRP(9)
           -15            15      -8.79829      -8.79837          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideNorth(10)
             0             2             0             0          1000             0         -4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideNorth(10)
           -15            15      -9.73598      -9.77089          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideSouth(11)
        0.0001             2      0.282353      0.275938          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideSouth(11)
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
            19            38       32.3083        32.339            99             0          1          0          0          0          0        0.5          1          2  #  Size_DblN_peak_Com(1)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Com(1)
            -9            10       3.10668       3.12435            99             0          5          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_Com(1)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Com(1)
           -15            -5      -11.8924      -11.7081            99             0          5          0          0          0          0        0.5          1          2  #  Size_DblN_start_logit_Com(1)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Com(1)
# 2   ComDisc LenSelex
            19            38       25.0601        25.041            99             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_peak_ComDisc(2)
           -15            10        1.2461      -9.37674            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_ComDisc(2)
            -9            10       2.03537       2.03482            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_ComDisc(2)
            -9             9      -3.35852       5.46908            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_ComDisc(2)
           -15            -5      -14.1808      -14.1176            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_ComDisc(2)
            -5            10          -999          -999            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_ComDisc(2)
# 3   RecNorth LenSelex
            19            39       32.4892       32.3789            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecNorth(3)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecNorth(3)
            -9            10       3.26259       3.26365            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecNorth(3)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecNorth(3)
           -15            -5      -12.1694      -11.9717            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecNorth(3)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecNorth(3)
# 4   RecSouth LenSelex
            19            38       27.7104       27.7317            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecSouth(4)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecSouth(4)
            -9            10       3.09431       3.21209            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecSouth(4)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecSouth(4)
           -15            -5      -8.78691      -8.81965            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecSouth(4)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecSouth(4)
# 5   DebCPFV LenSelex
            19            38       30.8738       30.8941            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_DebCPFV(5)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_DebCPFV(5)
            -9            10        2.9841       2.99934            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_DebCPFV(5)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_DebCPFV(5)
           -20            -5      -18.0699      -17.8513            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_DebCPFV(5)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_DebCPFV(5)
# 6   RecOnboardNorth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardNorth(6)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardNorth(6)
# 7   RecOnboardSouth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardSouth(7)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardSouth(7)
# 8   PISCO LenSelex
            19            38        30.994       30.4521            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_PISCO(8)
           -15            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_PISCO(8)
            -9            10       3.96833       3.90714            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_PISCO(8)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_PISCO(8)
           -15            15       -2.9948      -2.80113            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_PISCO(8)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_PISCO(8)
# 9   CCFRP LenSelex
            19            38       31.1328       31.0502            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_CCFRP(9)
           -15            10      -10.6109       -10.648            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_CCFRP(9)
            -9            10       3.13469       3.13457            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_CCFRP(9)
           -15             9       1.64644       1.64329            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_CCFRP(9)
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
            19            38        28.951       43.8236            10             0      6  # Size_DblN_peak_Com(1)_BLK1repl_1999
            -9            10       1.60178       4.66827            10             0      6  # Size_DblN_ascend_se_Com(1)_BLK1repl_1999
           -15            -5      -12.3209      -12.0962            10             0      6  # Size_DblN_start_logit_Com(1)_BLK1repl_1999
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
4 1 0.1635632
4 2 0.1521576
4 3 0.3810675
4 4 0.07680663
4 5 0.3927221
4 6 1
4 7 1
4 8 0.1755707
4 9 0.1252601
4 10 1
4 11 1
4 12 1
5 1 1
5 2 1
5 3 0.2508219
5 4 1
5 5 1
5 6 1
5 7 1
5 8 1
5 9 0.04486284
5 10 1
5 11 1
5 12 0.09943042
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

