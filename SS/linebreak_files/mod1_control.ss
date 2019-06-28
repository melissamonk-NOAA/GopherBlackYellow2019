#V3.30.13.08-safe;_2019_06_16;_Stock_Synthesis_by_Richard_Methot_(NOAA)_usi
# ng_ADMB_12.0
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
 1 7 1 0
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
#_Prior_codes:  0=none; 6=normal; 1=symmetric beta; 2=CASAL's beta; 3=logno
# rmal; 4=lognormal with biascorr; 5=gamma
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
 0.05 0.4 0.216369 -1.6458 0.4384 3 2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 4 50 9.62581 9.58981 999 0 3 0 0 0 0 1 0 0 # L_at_Amin_Fem_GP_1
 20 60 28.5709 28.5486 999 0 3 0 0 0 0 1 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.128358 0.129089 999 0 3 0 0 0 0 1 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.256894 0.257658 999 0 3 0 0 0 0 1 0 0 # CV_young_Fem_GP_1
 0.03 0.3 0.116376 0.116626 999 0 3 0 0 0 0 1 0 0 # CV_old_Fem_GP_1
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
             2            15       8.54252       8.47334            99     
        0          1          0          0          0          0          1
          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72          0.16     
        2         -1          0          0          0          0          1
          0          0 # SR_BH_steep
             0             2           0.4           0.4            99     
        0         -2          0          0          0          0          1
          0          0 # SR_sigmaR
            -5             5             0             0            99     
        0         -4          0          0          0          0          1
          0          0 # SR_regime
            -1             1      0.678861      0.677701            99     
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
 1955.81 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1974.38 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2010.87 #_last_yr_fullbias_adj_in_MPD
 2021.72 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS
#  sets bias_adj to 0.0 for fcast yrs)
 0.6491 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for 
# all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 60 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# Specified recr devs to read
#_Yr Input_value # Final_value
 1960 -0.361114 # -0.361112
 1961 -0.451391 # -0.451385
 1962 -0.522326 # -0.52232
 1963 -0.573761 # -0.573757
 1964 -0.601615 # -0.601613
 1965 -0.601353 # -0.601354
 1966 -0.570256 # -0.570257
 1967 -0.50809 # -0.50809
 1968 -0.421683 # -0.42168
 1969 -0.34653 # -0.346527
 1970 -0.316204 # -0.316206
 1971 -0.336783 # -0.336785
 1972 -0.399321 # -0.39932
 1973 -0.443029 # -0.443027
 1974 -0.393164 # -0.393163
 1975 -0.267087 # -0.26709
 1976 -0.138562 # -0.138564
 1977 -0.0550872 # -0.055086
 1978 -0.0287701 # -0.0287712
 1979 -0.0641968 # -0.0641977
 1980 -0.0440186 # -0.0440221
 1981 -0.0184803 # -0.0184804
 1982 -0.00576173 # -0.00575855
 1983 -0.118917 # -0.118916
 1984 -0.355454 # -0.355454
 1985 -0.513279 # -0.513282
 1986 -0.568359 # -0.568361
 1987 -0.493743 # -0.493743
 1988 -0.287405 # -0.287403
 1989 0.0239851 # 0.023982
 1990 0.363115 # 0.363113
 1991 0.616613 # 0.616617
 1992 0.73051 # 0.73051
 1993 0.739854 # 0.739852
 1994 0.69218 # 0.69218
 1995 0.577053 # 0.577055
 1996 0.397811 # 0.397811
 1997 0.146966 # 0.146965
 1998 -0.0700179 # -0.0700189
 1999 -0.199768 # -0.19977
 2000 -0.247351 # -0.247352
 2001 -0.139037 # -0.139038
 2002 -0.0544681 # -0.0544679
 2003 -0.216964 # -0.216962
 2004 -0.383228 # -0.383226
 2005 -0.440989 # -0.440988
 2006 -0.440644 # -0.440642
 2007 -0.400097 # -0.400096
 2008 -0.316132 # -0.316134
 2009 -0.19317 # -0.193169
 2010 -0.143015 # -0.143011
 2011 -0.232801 # -0.232801
 2012 -0.199348 # -0.199349
 2013 0.0129219 # 0.012923
 2014 0.420838 # 0.420839
 2015 0.712737 # 0.712738
 2016 0.518536 # 0.518535
 2017 0.217536 # 0.217535
 2018 0.00476082 # 0.00475994
 2019 0.00323257 # 0.00323156
#
# all recruitment deviations
#  1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 
# 1972E 1973E 1974E 1975E 1976E 1977E 1978R 1979R 1980R 1981R 1982R 1983R 1
# 984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 19
# 96R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 200
# 8R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020
# F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F 2029F 2030F
#  -0.361112 -0.451385 -0.52232 -0.573757 -0.601613 -0.601354 -0.570257 -0.
# 50809 -0.42168 -0.346527 -0.316206 -0.336785 -0.39932 -0.443027 -0.393163
#  -0.26709 -0.138564 -0.055086 -0.0287712 -0.0641977 -0.0440221 -0.0184804
#  -0.00575855 -0.118916 -0.355454 -0.513282 -0.568361 -0.493743 -0.287403 
# 0.023982 0.363113 0.616617 0.73051 0.739852 0.69218 0.577055 0.397811 0.1
# 46965 -0.0700189 -0.19977 -0.247352 -0.139038 -0.0544679 -0.216962 -0.383
# 226 -0.440988 -0.440642 -0.400096 -0.316134 -0.193169 -0.143011 -0.232801
#  -0.199349 0.012923 0.420839 0.712738 0.518535 0.217535 0.00475994 0.0032
# 3156 0.00219378 0.00148904 0.00101061 0.000686495 0.000466374 0.00031649 
# 0.000214715 0.000145768 9.89805e-005 6.69344e-005 4.564e-005
# implementation error by year in forecast:  0 0 0 0 0 0 0 0 0 0 0 0
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
#2030 2039
# F rates by fleet
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 192
# 9 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1
# 944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958
#  1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 19
# 73 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 
# 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 200
# 2 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2
# 017 2018 2019 2020 2021 2022 2023 2024 2025 2026 2027 2028 2029 2030
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
# 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
#  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 
# 1 1 1 1 1 1 1 1 1
# Com 0.00804207 0.0125344 0.0147184 0.0102693 0.0104947 0.00867934 0.00747
# 191 0.00808271 0.0046707 0.00583363 0.0094283 0.00801349 0.00969427 0.008
# 03156 0.0114041 0.00407385 0.0132218 0.00548658 0.003711 0.00091947 1.157
# 61e-005 0.0155326 0.0221217 0.0284487 0.0369778 0.0377153 0.0189941 0.024
# 4772 0.000104739 0.0013016 0.0369675 0.0597875 0.0544304 0.0421956 0.0399
# 883 0.0591456 0.0671799 0.0800144 0.103361 0.076951 0.108173 0.102141 0.0
# 928875 0.0547979 0.0318714 0.0497658 0.0774993 0.0637162 0.0472082 0.0613
# 071 0.038358 0.0189761 0.0236173 0.0287336 0.0422953 0.0449148 0.0640803 
# 0.112579 0.132212 0.144603 0.162563 0.155677 0.237585 0.195937 0.396611 0
# .369789 0.297423 0.229022 0.141844 0.0777096 0.244251 0.340919 0.537921 0
# ComDisc 0.000328388 0.000511371 0.000599775 0.000418038 0.000426876 0.000
# 352807 0.000303592 0.000328301 0.000189687 0.000236922 0.000382867 0.0003
# 25352 0.000393498 0.000325886 0.000462489 0.000165145 0.000535686 0.00022
# 213 0.000150189 3.72036e-005 4.6833e-007 0.000627862 0.000892527 0.001145
# 15 0.00148402 0.00150839 0.000758007 0.00097586 4.17605e-006 5.19614e-005
#  0.00147508 0.00237831 0.00215629 0.00166476 0.00157155 0.00231279 0.0026
# 1112 0.00309153 0.0039657 0.00293141 0.00409121 0.00383153 0.00345416 0.0
# 0202401 0.00117553 0.00183681 0.0028591 0.0023492 0.0017447 0.00227833 0.
# 00143954 0.000723668 0.000918623 0.00114098 0.00170972 0.00183923 0.00263
# 923 0.00460366 0.00529321 0.0056078 0.00606684 0.00559785 0.00828514 0.00
# RecNorth 0 0 0 0 0 0 0 0 0 0 0 0 0.00166042 0.00332436 0.00382738 0.00510
# 921 0.00639792 0.00769413 0.00898372 0.0102706 0.0115557 0.0137394 0.0136
# 026 0.0119872 0.0174336 0.0162867 0.00869699 0.00832772 0.00682122 0.0090
# 4244 0.0155943 0.0124801 0.025269 0.0331817 0.0409099 0.0511723 0.0453349
#  0.0392637 0.0498172 0.060579 0.0690214 0.0797461 0.123806 0.100012 0.074
# 8255 0.0720017 0.0727976 0.0716328 0.0562821 0.080426 0.0879409 0.0969669
#  0.0974454 0.0851946 0.115818 0.0917135 0.129302 0.169174 0.192542 0.2015
# 51 0.221748 0.202899 0.166275 0.192959 0.46592 0.527452 0.576923 0.607483
#  1.16528 1.31042 1.5119 1.07321 0.703111 0.562196 0.667573 0.807843 1.028
# 71 1.34996 1.18507 0.645342 0.497168 0.441638 0.410079 0.362342 0.404989 
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 1.44484e-005 2.89269e-005 4.34518e-005 5
# .79889e-005 7.25875e-005 8.72492e-005 0.000101846 0.000116417 0.000205644
#  0.000295579 0.000387019 0.000479774 0.000574537 0.00067111 0.000765722 0
# .00085834 0.000948353 0.00103541 0.00112888 0.00123189 0.00133957 0.00144
# 77 0.00155576 0.0016704 0.00179083 0.00191218 0.00204186 0.00217362 0.002
# 30951 0.00245441 0.00260685 0.00274594 0.00284784 0.00293985 0.0030477 0.
# 00316074 0.00326151 0.00337997 0.00353253 0.00371087 0.00393137 0.0041988
# 6 0.00453509 0.00492827 0.00537999 0.00595578 0.00662779 0.00730627 0.007
# 95161 0.00850384 0.00898351 0.00941599 0.0105302 0.010347 0.00974784 0.00
# 876965 0.0151903 0.0161285 0.0189444 0.0170375 0.0138932 0.0100536 0.0075
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
           -15            15       -7.0419      -6.98277          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_DebCPFV(5)
        0.0001             2    0.000010011    0.000010011        1000     
        0         -4          0          0          0          0          1
          0          0  #  Q_extraSD_DebCPFV(5)
           -15            15      -7.73974      -7.71816          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecOnboardNorth(6)
        0.0001             2      0.227619      0.229558          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_RecOnboardNorth(6)
           -15            15      -10.2962      -10.3005          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecOnboardSouth(7)
        0.0001             2      0.598238      0.597079          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_RecOnboardSouth(7)
           -15            15      -7.62668      -7.60551          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_PISCO(8)
        0.0001             2      0.207638       0.20918          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_PISCO(8)
           -15            15      -6.46943      -6.44959          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_CCFRP(9)
        0.0001             2      0.183118      0.184573          1000     
        0          4          0          0          0          0          1
          0          0  #  Q_extraSD_CCFRP(9)
           -15            15      -8.85533      -8.79837          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecDocksideNorth(10)
        0.0001             2    0.000010011    0.000010011        1000     
        0         -4          0          0          0          0          1
          0          0  #  Q_extraSD_RecDocksideNorth(10)
           -15            15        -9.772      -9.77089          1000     
        0         -1          0          0          0          0          1
          0          0  #  LnQ_base_RecDocksideSouth(11)
        0.0001             2      0.268066      0.275938          1000     
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
            19            38        32.292        32.339            99     
        0          1          0          0          0          0        0.5
          1          2  #  Size_DblN_peak_Com(1)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_Com(1)
            -9            10       3.11727       3.12435            99     
        0          5          0          0          0          0        0.5
          1          2  #  Size_DblN_ascend_se_Com(1)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_Com(1)
           -15            -5      -11.7332      -11.7081            99     
        0          5          0          0          0          0        0.5
          1          2  #  Size_DblN_start_logit_Com(1)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_Com(1)
# 2   ComDisc LenSelex
            19            38       25.0532        25.041            99     
        0          2          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_ComDisc(2)
           -15            10      -9.30556      -9.37674            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_ComDisc(2)
            -9            10       2.03392       2.03482            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_ComDisc(2)
            -9             9       5.52912       5.46908            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_ComDisc(2)
           -15            -5      -14.1384      -14.1176            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_ComDisc(2)
            -5            10          -999          -999            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_ComDisc(2)
# 3   RecNorth LenSelex
            19            39       32.3899       32.3789            99     
        0          3          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_RecNorth(3)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_RecNorth(3)
            -9            10       3.26225       3.26365            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_RecNorth(3)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_RecNorth(3)
           -15            -5      -12.0177      -11.9717            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_RecNorth(3)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_RecNorth(3)
# 4   RecSouth LenSelex
            19            38       27.5874       27.7317            99     
        0          4          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_RecSouth(4)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_RecSouth(4)
            -9            10       3.08713       3.21209            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_RecSouth(4)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_RecSouth(4)
           -15            -5      -8.68391      -8.81965            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_RecSouth(4)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_RecSouth(4)
# 5   DebCPFV LenSelex
            19            38        30.832       30.8941            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_DebCPFV(5)
            -5            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_DebCPFV(5)
            -9            10       2.99126       2.99934            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_DebCPFV(5)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_DebCPFV(5)
           -20            -5      -17.9571      -17.8513            99     
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
            19            38       30.5162       30.4521            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_PISCO(8)
           -15            10             8             8            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_PISCO(8)
            -9            10       3.91356       3.90714            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_PISCO(8)
            -9             9             5             5            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_descend_se_PISCO(8)
           -15            15      -2.85636      -2.80113            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_start_logit_PISCO(8)
            -5            15            10            10            99     
        0         -5          0          0          0          0        0.5
          0          0  #  Size_DblN_end_logit_PISCO(8)
# 9   CCFRP LenSelex
            19            38       31.0604       31.0502            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_peak_CCFRP(9)
           -15            10      -10.6262       -10.648            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_top_logit_CCFRP(9)
            -9            10       3.13144       3.13457            99     
        0          5          0          0          0          0        0.5
          0          0  #  Size_DblN_ascend_se_CCFRP(9)
           -15             9       1.64221       1.64329            99     
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
            19            38       28.9022       43.8236            10     
        0      6  # Size_DblN_peak_Com(1)_BLK1repl_1999
            -9            10       1.58807       4.66827            10     
        0      6  # Size_DblN_ascend_se_Com(1)_BLK1repl_1999
           -15            -5      -11.9401      -12.0962            10     
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
4 1 0.163753
4 2 0.151272
4 3 0.355424
4 4 0.077641
4 5 0.392615
4 6 1
4 7 1
4 8 0.170249
4 9 0.119435
4 10 1
4 11 1
4 12 1
5 1 0.558129
5 2 1
5 3 0.24088
5 4 1
5 5 1
5 6 1
5 7 1
5 8 1
5 9 0.044981
5 10 1
5 11 1
5 12 0.097321
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

