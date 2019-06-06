#V3.30.13-safe;_2019_03_09;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_
# ADMB_12.0
#Stock Synthesis (SS) is a work of the U.S. Government and is not subject t
# o copyright protection in the United States.
#Foreign copyrights may apply. See copyright.txt for more information.
#_user_support_available_at:NMFS.Stock.Synthesis@noaa.gov
#_user_info_available_at:https://vlab.ncep.noaa.gov/group/stock-synthesis
#_data_and_control_files: gopher.dat // gopher.ctl
0  # 0 means do not read wtatage.ss; 1 means read and use wtatage.ss and al
# so read and use growth parameters
1  #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern 
#_Cond 1 #_Morph_between/within_stdev_ratio (no read if N_morphs=1)
#_Cond  1 #vector_Morphdist_(-1_in_first_val_gives_normal_approx)
#
4 # recr_dist_method for parameters:  2=main effects for GP, Area, Settle t
# iming; 3=each Settle entity; 4=none (only when N_GP*Nsettle*pop==1)
1 # not yet implemented; Future usage: Spawner-Recruitment: 1=global; 2=by 
# area
1 #  number of recruitment settlement assignments 
0 # unused option
#GPattern month  area  age (for each settlement assignment)
 1 1 1 0
#
#_Cond 0 # N_movement_definitions goes here if Nareas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer
# ) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1
#  dest=2, age1=4, age2=10
#
1 #_Nblock_Patterns
 1 #_blocks_per_pattern 
# begin and end years of blocks
 1999 2018
#
# controls for all timevary parameters 
1 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to
#  base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th re
# served, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying par
# m line; 2 = read then autogen if parm min==-12345
#
#_Available timevary codes
#_Block types: 0: P_block=P_base*exp(TVP); 1: P_block=P_base+TVP; 2: P_bloc
# k=TVP; 3: P_block=P_block(-1) + TVP
#_Block_trends: -1: trend bounded by base parm min-max and parms in transfo
# rmed units (beware); -2: endtrend and infl_year direct values; -3: end an
# d infl as fraction of base range
#_EnvLinks:  1: P(y)=P_base*exp(TVP*env(y));  2: P(y)=P_base+TVP*env(y);  3
# : null;  4: P(y)=2.0/(1.0+exp(-TVP1*env(y) - TVP2))
#_DevLinks:  1: P(y)*=exp(dev(y)*dev_se;  2: P(y)+=dev(y)*dev_se;  3: rando
# m walk;  4: zero-reverting random walk with rho;  21-24 keep last dev for
#  rest of years
#
#
#
# setup for M, growth, maturity, fecundity, recruitment distibution, moveme
# nt 
#
0 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agesp
# ec_withseasinterpolate
  #_no additional input for selected M option; read 1P per morph
#
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specifi
# c_K_incr; 4=age_specific_K_decr; 5=age_specific_K_each; 6=NA; 7=NA; 8=gro
# wth cessation
2 #_Age(post-settlement)_for_L1;linear growth below this
23 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initi
# al Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0  #_placeholder for future growth feature
#
0 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 l
# ogSD=F(A)
#
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturit
# y matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read leng
# th-maturity
3 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)e
# ggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=
# male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-
# GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev
# _maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.05 0.4 0.206651 -1.6458 0.4384 3 2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 4 50 7.90825 22.2 999 0 3 0 0 0 0 1 0 0 # L_at_Amin_Fem_GP_1
 20 60 28.2903 31.2 999 0 3 0 0 0 0 1 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.142705 0.186 999 0 3 0 0 0 0 1 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.257993 0.06 999 0 3 0 0 0 0 1 0 0 # CV_young_Fem_GP_1
 0.03 0.3 0.118964 0.06 999 0 3 0 0 0 0 1 0 0 # CV_old_Fem_GP_1
# Sex: 1  BioPattern: 1  WtLen
 -3 3 8.83694e-06 8.83694e-06 999 0 -3 0 0 0 0 1 0 0 # Wtlen_1_Fem_GP_1
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
 1e-06 0.999999 0.5 0.5 1000 0 -4 0 0 0 0 1 0 0 # FracFemale_GP_1
#
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,m
# alewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=
# B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvatu
# re
#_          LO            HI          INIT         PRIOR         PR_SD     
#   PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_
# PH      Block    Blk_Fxn #  parm_name
             2            15       8.52993           7.7            99     
        0          1          0          0          0          0          1
          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72            99     
        0         -1          0          0          0          0          1
          0          0 # SR_BH_steep
             0             2           0.4           0.4            99     
        0         -2          0          0          0          0          1
          0          0 # SR_sigmaR
            -5             5             0             0            99     
        0         -4          0          0          0          0          1
          0          0 # SR_regime
            -1             1      0.695496          0.72            99     
        0          4          0          0          0          0          1
          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+d
# ev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) addi
# ng penalty
1978 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1960 #_recdev_early_start (0=none; neg value makes relative to recdev_star
# t)
 4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxpha
# se+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1955.48 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1974.52 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2010.41 #_last_yr_fullbias_adj_in_MPD
 2022.62 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS
#  sets bias_adj to 0.0 for fcast yrs)
 0.6629 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for 
# all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
# all recruitment deviations
#  1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 
# 1972E 1973E 1974E 1975E 1976E 1977E 1978R 1979R 1980R 1981R 1982R 1983R 1
# 984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 19
# 96R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 200
# 8R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F
#  -0.371209 -0.459621 -0.52871 -0.57814 -0.60429 -0.603345 -0.573505 -0.51
# 5679 -0.437288 -0.370999 -0.347216 -0.371795 -0.433853 -0.47494 -0.432121
#  -0.316329 -0.194562 -0.116225 -0.0936083 -0.119085 -0.0709319 0.00493923
#  0.0595581 -0.0449561 -0.302015 -0.478117 -0.540366 -0.464571 -0.254526 0
# .0550671 0.378204 0.607712 0.714586 0.738939 0.702397 0.587979 0.403275 0
# .143683 -0.0799371 -0.213861 -0.268486 -0.168332 -0.108177 -0.222031 -0.3
# 71888 -0.440027 -0.451241 -0.420658 -0.346136 -0.230603 -0.171868 -0.2316
# 43 -0.211818 -0.0205537 0.360985 0.637577 0.542723 0.305648 0.0821635 0.0
# 571444
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.5 # F ballpark
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
3 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed input
# s to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2019 2039
# F rates by fleet
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 192
# 9 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1
# 944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958
#  1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 19
# 73 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 
# 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 200
# 2 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2
# 017 2018 2019
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
# 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Com 0.00749939 0.0116862 0.0137191 0.00957039 0.00977943 0.00808731 0.006
# 96212 0.00753123 0.00435216 0.00543606 0.00878573 0.00746718 0.00903304 0
# .00748326 0.0106246 0.00379519 0.0123163 0.00511027 0.00345641 0.00085639
# 9 1.07823e-05 0.014465 0.0205931 0.0264713 0.0343887 0.035054 0.0176503 0
# .0227466 9.73602e-05 0.00121044 0.034376 0.0555592 0.0505399 0.0391529 0.
# 0370843 0.0548085 0.0621986 0.0740244 0.095532 0.0710615 0.0998107 0.0941
# 553 0.0855407 0.0504418 0.0293554 0.0458734 0.0714624 0.0587655 0.0435626
#  0.0565897 0.035409 0.0175236 0.0218226 0.0265713 0.0391361 0.0415783 0.0
# 593218 0.104078 0.121936 0.133045 0.149304 0.142956 0.218536 0.180853 0.3
# 67588 0.344776 0.280236 0.204554 0.120917 0.0749136 0.246574 0.34629 0.55
# ComDisc 0.000310725 0.000483815 0.000567386 0.000395432 0.000403777 0.000
# 333711 0.000287162 0.000310538 0.000179429 0.000224118 0.000362177 0.0003
# 07768 0.000372224 0.000308259 0.000437454 0.000156202 0.000506658 0.00021
# 0084 0.000142044 3.51866e-05 4.42949e-07 0.000593784 0.000843921 0.001082
# 56 0.00140254 0.0014252 0.000716164 0.00092206 3.94655e-06 4.91188e-05 0.
# 00139434 0.00224736 0.00203675 0.00157199 0.00148363 0.00218268 0.0024632
# 9 0.0029156 0.00373854 0.00276259 0.00385439 0.00360844 0.00325182 0.0019
# 0532 0.00110707 0.00173068 0.00269452 0.00221422 0.00164468 0.00214778 0.
# 00135739 0.000682913 0.000867817 0.00107905 0.00161802 0.00174114 0.00249
# 815 0.0043537 0.0050004 0.00529562 0.00573374 0.00530303 0.0078781 0.0063
# RecNorth 0 0 0 0 0 0 0 0 0 0 0 0 0.00153063 0.00306432 0.00352766 0.00470
# 887 0.00589606 0.00708982 0.00827797 0.0094638 0.0106482 0.0126583 0.0125
# 274 0.0110349 0.0160398 0.014976 0.00799542 0.0076563 0.00627291 0.008319
# 25 0.014346 0.0114735 0.0232122 0.0304603 0.037534 0.0469141 0.0415258 0.
# 035937 0.045553 0.0553461 0.0630065 0.0727267 0.112797 0.0910782 0.068180
# 7 0.0656577 0.0664051 0.0653557 0.0513755 0.0734363 0.080307 0.0885911 0.
# 0890929 0.0779656 0.106068 0.0840373 0.11849 0.154824 0.175792 0.183579 0
# .201619 0.184452 0.151407 0.176311 0.427459 0.48703 0.537953 0.572155 1.1
# 0927 1.2658 1.48608 1.06859 0.702214 0.557972 0.654744 0.781827 0.981648 
# 1.27191 1.11271 0.605524 0.464222 0.410634 0.380414 0.335961 0.375551 0.5
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 1.325e-05 2.65263e-05 3.98434e-05 5.3171
# 6e-05 6.65534e-05 7.99906e-05 9.33726e-05 0.000106733 0.000188541 0.00027
# 0965 0.000354697 0.000439577 0.000526207 0.000614421 0.000700967 0.000785
# 803 0.000868397 0.000948432 0.001034 0.00112784 0.00122576 0.0013241 0.00
# 142244 0.00152649 0.00163561 0.0017456 0.00186286 0.00198201 0.00210484 0
# .00223557 0.00237296 0.00249899 0.00259298 0.00267833 0.0027773 0.0028807
# 5 0.00297395 0.00308382 0.00322584 0.0033934 0.00360056 0.00385094 0.0041
# 6269 0.00452468 0.00493727 0.00545684 0.0060592 0.00666847 0.0072545 0.00
# 776969 0.00823401 0.00866921 0.00974227 0.00963166 0.00914521 0.00828933 
# 0.0144685 0.0155075 0.0183827 0.0165852 0.0134649 0.0096539 0.00719684 0.
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3
# =q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         5         1         0         1         0         1  #  DebCPFV
         6         1         0         1         0         1  #  RecOnboard
# North
         7         1         0         1         0         1  #  RecOnboard
# South
         8         1         0         1         0         1  #  PISCO
         9         1         0         1         0         1  #  CCFRP
        10         1         0         1         0         1  #  RecDocksid
# eNorth
        11         1         0         1         0         1  #  RecDocksid
# eSouth
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD     
#   PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_
# PH      Block    Blk_Fxn  #  parm_name
           -15            15      -7.08047             0          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_DebCPFV(5)
        0.0001             2     0.0726599      0.164309          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_DebCPFV(5)
           -15            15      -7.80637             0          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecOnboardNorth(6)
        0.0001             2      0.226522      0.164309          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_RecOnboardNorth(6)
           -15            15       -10.379             0          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecOnboardSouth(7)
        0.0001             2      0.602892      0.164309          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_RecOnboardSouth(7)
           -15            15      -7.69389             0          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_PISCO(8)
        0.0001             2      0.208838             0          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_PISCO(8)
           -15            15       -6.5325             0          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_CCFRP(9)
        0.0001             2      0.183695      0.164309          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_CCFRP(9)
           -15            15      -8.89635             0          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecDocksideNorth(10)
        0.0001             2    0.00010011      0.164309          1000     
        0         -4          0          0          0          0          1
          0          0  #  Q_extraSD_RecDocksideNorth(10)
           -15            15      -9.85705             0          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecDocksideSouth(11)
        0.0001             2      0.278987      0.164309          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_RecDocksideSouth(11)
#_no timevary Q parameters
#
#_size_selex_patterns
#Pattern:_0; parm=0; selex=1.0 for all sizes
#Pattern:_1; parm=2; logistic; with 95% width specification
#Pattern:_5; parm=2; mirror another size selex; PARMS pick the min-max bin 
# to mirror
#Pattern:_15; parm=0; mirror another age or length selex
#Pattern:_6; parm=2+special; non-parm len selex
#Pattern:_43; parm=2+special+2;  like 6, with 2 additional param for scalin
# g (average over bin range)
#Pattern:_8; parm=8; New doublelogistic with smooth transitions and constan
# t above Linf option
#Pattern:_9; parm=6; simple 4-parm double logistic with starting length; pa
# rm 5 is first length; parm 6=1 does desc as offset
#Pattern:_21; parm=2+special; non-parm len selex, read as pairs of size, th
# en selex
#Pattern:_22; parm=4; double_normal as in CASAL
#Pattern:_23; parm=6; double_normal where final value is directly equal to 
# sp(6) so can be >1.0
#Pattern:_24; parm=6; double_normal with sel(minL) and sel(maxL), using joi
# ners
#Pattern:_25; parm=3; exponential-logistic in size
#Pattern:_27; parm=3+special; cubic spline 
#Pattern:_42; parm=2+special+3; // like 27, with 2 additional param for sca
# ling (average over bin range)
#_discard_options:_0=none;_1=define_retention;_2=retention&mortality;_3=all
# _discarded_dead;_4=define_dome-shaped_retention
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
#Pattern:_17; parm=nages+1; empirical as random walk  N parameters to read 
# can be overridden by setting special to non-zero
#Pattern:_41; parm=2+nages+1; // like 17, with 2 additional param for scali
# ng (average over bin range)
#Pattern:_18; parm=8; double logistic - smooth transition
#Pattern:_19; parm=6; simple 4-parm double logistic with starting age
#Pattern:_20; parm=6; double_normal,using joiners
#Pattern:_26; parm=3; exponential-logistic in age
#Pattern:_27; parm=3+special; cubic spline in age
#Pattern:_42; parm=2+special+3; // cubic spline; with 2 additional param fo
# r scaling (average over bin range)
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
#_          LO            HI          INIT         PRIOR         PR_SD     
#   PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_
# PH      Block    Blk_Fxn  #  parm_name
# 1   Com LenSelex
            19            38       32.3398       43.8236            99     
        0          1          0          0          0          0        0.5
          1          2  #  Size_DblN_peak_Com(1)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_Com(1)
            -9            10       3.13889       4.66827            99     
        0          5          0          0          0          0        0.5
          1          2  #  Size_DblN_ascend_se_Com(1)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_Com(1)
           -15            -5      -11.5722      -12.0962            99     
        0          5          0          0          0          0        0.5
          1          2  #  Size_DblN_start_logit_Com(1)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_Com(1)
# 2   ComDisc LenSelex
            19            38        24.988       43.8236            99     
        0          2          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_ComDisc(2)
           -15            10      -9.59822      -1.42363            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_ComDisc(2)
            -9            10       2.03798       4.66827            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_ComDisc(2)
            -9             9       5.31908       4.31619            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_ComDisc(2)
           -15            -5      -14.0525      -12.0962            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_ComDisc(2)
            -5            10          -999          -999            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_ComDisc(2)
# 3   RecNorth LenSelex
            19            39       32.3853       43.8236            99     
        0          3          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_RecNorth(3)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_RecNorth(3)
            -9            10       3.28225       4.66827            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_RecNorth(3)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_RecNorth(3)
           -15            -5      -11.8465      -12.0962            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_RecNorth(3)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_RecNorth(3)
# 4   RecSouth LenSelex
            19            38       27.6185       43.8236            99     
        0          4          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_RecSouth(4)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_RecSouth(4)
            -9            10       3.21955       4.66827            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_RecSouth(4)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_RecSouth(4)
           -15            -5      -8.73108      -12.0962            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_RecSouth(4)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_RecSouth(4)
# 5   DebCPFV LenSelex
            19            38       30.8686       43.8236            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_DebCPFV(5)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_DebCPFV(5)
            -9            10       3.01055       4.66827            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_DebCPFV(5)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_DebCPFV(5)
           -15            -5      -14.8883      -12.0962            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_DebCPFV(5)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_DebCPFV(5)
# 6   RecOnboardNorth LenSelex
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P1_RecOnboardNorth(6)
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P2_RecOnboardNorth(6)
# 7   RecOnboardSouth LenSelex
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P1_RecOnboardSouth(7)
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P2_RecOnboardSouth(7)
# 8   PISCO LenSelex
            19            38       30.4015       43.8236            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_PISCO(8)
           -15            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_PISCO(8)
            -9            10       3.93914       4.66827            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_PISCO(8)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_PISCO(8)
           -15            15      -2.64485      -12.0962            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_PISCO(8)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_PISCO(8)
# 9   CCFRP LenSelex
            19            38       31.0344       43.8236            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_CCFRP(9)
           -15            10      -10.6381      -1.42363            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_CCFRP(9)
            -9            10       3.15144       4.66827            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_CCFRP(9)
           -15             9       1.65435       4.31619            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_CCFRP(9)
           -15            -5          -999          -999            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_CCFRP(9)
            -5            10          -999          -999            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_CCFRP(9)
# 10   RecDocksideNorth LenSelex
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P1_RecDocksideNorth(10)
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P2_RecDocksideNorth(10)
# 11   RecDocksideSouth LenSelex
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P1_RecDocksideSouth(11)
            -1            10            -1            -1            99     
        0         -5          0          0          0          0        0.5
          0          0  #  SizeSel_P2_RecDocksideSouth(11)
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
#_          LO            HI          INIT         PRIOR         PR_SD     
#   PR_type    PHASE  #  parm_name
            19            38       28.8663       43.8236            10     
        0      6  # Size_DblN_peak_Com(1)_BLK1repl_1999
            -9            10        1.5816       4.66827            10     
        0      6  # Size_DblN_ascend_se_Com(1)_BLK1repl_1999
           -15            -5      -11.6389      -12.0962            10     
        0      6  # Size_DblN_start_logit_Com(1)_BLK1repl_1999
# info on dev vectors created for selex parms are reported with other devs 
# after tag parameter section 
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
#  type  index  parm trend pattern link  var  vectr link _mnyr  mxyr phase 
#  dev_vector
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
4 1 0.1620615
4 2 0.1514209
4 3 0.3839312
4 4 0.08276595
4 5 0.3247787
4 6 1
4 7 1
4 8 0.1598847
4 9 0.1227663
4 10 1
4 11 1
4 12 1
5 1 0.543085
5 2 1
5 3 0.2320575
5 4 1
5 5 1
5 6 1
5 7 1
5 8 1
5 9 0.04459266
5 10 1
5 11 1
5 12 0.1070038
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an e
# stimated parameter
# read 1 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=
# sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag
# -comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
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
#  1 1 1 1 #_agecomp:_1
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
 # 0 0 0 0 0 0 0 0 0 # placeholder for # selex_fleet, 1=len/2=age/3=both, y
# ear, N selex bins, 0 or Growth pattern, N growth ages, 0 or NatAge_area(-
# 1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

