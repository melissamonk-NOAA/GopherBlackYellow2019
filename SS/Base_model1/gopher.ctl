#V3.30.13.08-safe;_2019_06_16;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
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
 0.05 0.4 0.223427 -1.6458 0.4384 3 2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 4 50 9.66993 9.58981 999 0 3 0 0 0 0 1 0 0 # L_at_Amin_Fem_GP_1
 20 60 28.3495 28.5486 999 0 3 0 0 0 0 1 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.125016 0.129089 999 0 3 0 0 0 0 1 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.260177 0.257658 999 0 3 0 0 0 0 1 0 0 # CV_young_Fem_GP_1
 0.03 0.3 0.118948 0.116626 999 0 3 0 0 0 0 1 0 0 # CV_old_Fem_GP_1
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
             2            15       8.69191       8.47334            99             0          1          0          0          0          0          1          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72          0.16             2         -1          0          0          0          0          1          0          0 # SR_BH_steep
             0             2           0.5           0.5            99             0         -2          0          0          0          0          1          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -4          0          0          0          0          1          0          0 # SR_regime
            -1             1      0.641403      0.677701            99             0          4          0          0          0          0          1          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1978 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1960 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1955.9 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1972.56 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2014.55 #_last_yr_fullbias_adj_in_MPD
 2020.25 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.66 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
 0 #_period of cycles in recruitment (N parms read below)
 -5 #min rec_dev
 5 #max rec_dev
 60 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# Specified recr devs to read
#_Yr Input_value # Final_value
1960	-0.430542
1961	-0.544373
1962	-0.631434
1963	-0.693482
1964	-0.725326
1965	-0.720561
1966	-0.674926
1967	-0.586526
1968	-0.461546
1969	-0.353235
1970	-0.312475
1971	-0.344711
1972	-0.441522
1973	-0.515569
1974	-0.458002
1975	-0.299599
1976	-0.149141
1977	-0.060598
1978	-0.0388527
1979	-0.109635
1980	-0.0803798
1981	-0.033649
1982	0.0261875
1983	-0.0902183
1984	-0.405277
1985	-0.598045
1986	-0.663674
1987	-0.57959
1988	-0.348772
1989	-0.000987798
1990	0.372912
1991	0.634749
1992	0.736092
1993	0.740181
1994	0.710538
1995	0.609743
1996	0.432496
1997	0.142232
1998	-0.108109
1999	-0.252627
2000	-0.306606
2001	-0.12246
2002	0.0281682
2003	-0.210118
2004	-0.438539
2005	-0.487846
2006	-0.465232
2007	-0.406651
2008	-0.299012
2009	-0.128466
2010	-0.0687141
2011	-0.259814
2012	-0.267943
2013	-0.0192963
2014	0.555226
2015	0.980917
2016	0.670448
2017	0.226102
2018	-0.075477
2019	-0.0484112

#
# all recruitment deviations
#  1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F 2029F 2030F
#  -0.430542 -0.544373 -0.631434 -0.693482 -0.725326 -0.720561 -0.674926 -0.586526 -0.461546 -0.353235 -0.312475 -0.344711 -0.441522 -0.515569 -0.458002 -0.299599 -0.149141 -0.060598 -0.0388527 -0.109635 -0.0803798 -0.033649 0.0261875 -0.0902183 -0.405277 -0.598045 -0.663674 -0.57959 -0.348772 -0.000987798 0.372912 0.634749 0.736092 0.740181 0.710538 0.609743 0.432496 0.142232 -0.108109 -0.252627 -0.306606 -0.12246 0.0281682 -0.210118 -0.438539 -0.487846 -0.465232 -0.406651 -0.299012 -0.128466 -0.0687141 -0.259814 -0.267943 -0.0192963 0.555226 0.980917 0.670448 0.226102 -0.075477 -0.0484112 -0.0310511 -0.0199163 -0.0127744 -0.00819352 -0.00525535 -0.0033708 -0.00216204 -0.00138674 -0.000889461 -0.000570503 -0.000365923
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
# Com 0.00856335 0.0133456 0.015669 0.0109313 0.0111701 0.0092372 0.00795167 0.00860125 0.0049702 0.0062076 0.0100324 0.00852664 0.0103146 0.00854501 0.0121323 0.00433371 0.0140641 0.00583557 0.00394683 0.000977861 1.23109e-005 0.0165166 0.0235178 0.0302356 0.0392859 0.040052 0.020165 0.0259818 0.000111173 0.00138168 0.0392375 0.0634321 0.0577162 0.0447173 0.0423544 0.0625999 0.0710416 0.0845388 0.109088 0.0811242 0.113904 0.107404 0.0975242 0.0574612 0.0334055 0.0521539 0.0811906 0.0667264 0.0494386 0.0642131 0.0401942 0.0199124 0.0248472 0.0303528 0.0449299 0.048063 0.069201 0.122931 0.14625 0.162144 0.184577 0.178401 0.273723 0.22621 0.458667 0.428144 0.3443 0.264862 0.163821 0.0894968 0.279956 0.388497 0.609526 0.474297 0.460461 0.685149 0.923865 0.946542 0.822882 1.49968 1.58753 1.03946 0.781296 0.470678 0.322224 0.261157 0.17637 0.0768816 0.0863029 0.0866983 0.0694578 0.0856958 0.102408 0.104033 0.122003 0.146056 0.123824 0.129399 0.149059 0.190143 0.173668 0.207479 0.237021 0.59245 0.59245 0.59245 0.592451 0.592465 0.59258 0.593028 0.594117 0.596103 0.599022 0.602517 0.605834
# ComDisc 0.000319183 0.000497009 0.000582889 0.000406246 0.000414817 0.000342829 0.000295001 0.000319006 0.000184315 0.000230212 0.000372019 0.000316127 0.000382331 0.000316627 0.00044933 0.000160441 0.000520406 0.000215784 0.000145895 3.61393e-005 4.54928e-007 0.000609854 0.000866814 0.00111199 0.00144075 0.00146408 0.000735645 0.000947023 4.05274e-006 5.04314e-005 0.00143155 0.00230753 0.00209142 0.00161417 0.00152334 0.00224099 0.00252891 0.00299287 0.00383702 0.00283471 0.00395385 0.00370028 0.00333316 0.00195195 0.00113354 0.00177123 0.00275657 0.00226453 0.00168217 0.00219834 0.00139139 0.000701741 0.000895178 0.00111929 0.0016912 0.00183722 0.00266522 0.00470339 0.0054692 0.00584733 0.00636401 0.00588883 0.00872597 0.00703766 0.0138309 0.0123545 0.0095344 0.00706845 0.00419232 0.00219281 0.00662936 0.00903552 0.0142517 0.0113457 0.0113941 0.0174824 0.0239501 0.0242726 0.0201812 0.0339017 0.0323655 0.0198166 0.014804 0.0115766 0.00849155 0.0074257 0.00541922 0.016076 0.00317921 0.00391456 0.00485075 0.00541542 0.00200478 0.00691409 0.00540876 0.00859968 0.00309371 0.0047718 0.00497528 0.0053466 0.00455672 0.00316793 0.00485445 0.012134 0.012134 0.012134 0.0121343 0.0121373 0.0121484 0.0121722 0.0122099 0.0122585 0.0123109 0.0123566 0.0123862
# RecNorth 0 0 0 0 0 0 0 0 0 0 0 0 0.00177701 0.0035576 0.00409563 0.00546699 0.00684544 0.00823159 0.00961075 0.010987 0.0123614 0.0146958 0.0145463 0.0128154 0.0186316 0.0173987 0.0092882 0.00889245 0.00728353 0.00965618 0.0166509 0.0133204 0.026956 0.0353778 0.0435941 0.0544925 0.0482365 0.0417416 0.0529073 0.0642684 0.0731424 0.0843968 0.130836 0.105566 0.0789484 0.0759594 0.0767741 0.0755192 0.0593366 0.0848061 0.0927785 0.102455 0.103241 0.0906403 0.123932 0.0988723 0.140688 0.186138 0.2146 0.227665 0.253538 0.234047 0.19277 0.224153 0.542207 0.614668 0.672368 0.707406 1.35532 1.52019 1.74614 1.23267 0.803077 0.638588 0.754321 0.908546 1.15322 1.51445 1.33899 0.737144 0.571598 0.505669 0.464633 0.406015 0.449575 0.599041 0.410617 0.48484 0.165284 0.174295 0.169104 0.113087 0.155336 0.232965 0.406854 0.317811 0.215539 0.179761 0.281579 0.307174 0.370073 0.291176 0.219399 0.548404 0.548404 0.548404 0.548408 0.548451 0.548648 0.549196 0.550314 0.552171 0.554759 0.557757 0.560536
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 1.49005e-005 2.98305e-005 4.48064e-005 5.97939e-005 7.48422e-005 8.99526e-005 0.000104998 0.000120016 0.000211998 0.000304682 0.000398861 0.000494337 0.000591794 0.000691025 0.000788277 0.000883533 0.000976195 0.00106593 0.00116205 0.00126762 0.00137778 0.00148831 0.00159871 0.00171554 0.001838 0.00196124 0.00209256 0.00222576 0.00236284 0.00250855 0.00266138 0.00280096 0.00290427 0.00299805 0.00310736 0.00322193 0.0033255 0.00344894 0.00361056 0.0038049 0.00405059 0.00435489 0.00474264 0.0052043 0.00574334 0.00643185 0.00723875 0.00805477 0.00882231 0.00946444 0.0100088 0.0104939 0.0117511 0.0115651 0.0109001 0.00979718 0.016945 0.0179515 0.0210169 0.0188176 0.0152643 0.010989 0.0082458 0.00590185 0.00360537 0.00789061 0.013514 0.0053767 0.0218287 0.00995078 0.00711598 0.0240183 0.00850225 0.00561801 0.00335238 0.00398403 0.0013817 0.00910146 0.00293606 0.00376363 0.00513357 0.0063794 0.00621825 0.0177737 0.0182985 0.017116 0.0183046 0.0105758 0.0144526 0.025063 0.0141078 0.0352635 0.0352635 0.0352636 0.0352653 0.0352757 0.0353075 0.035372 0.0354741 0.0356093 0.0357607 0.0359001 0.035998
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
           -15            15      -6.94803      -6.98277          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_DebCPFV(5)
             0             2     0.0757314     0.0695633          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_DebCPFV(5)
           -15            15      -7.65499      -7.71816          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardNorth(6)
        0.0001             2      0.227028      0.229558          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardNorth(6)
           -15            15      -10.2459      -10.3005          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardSouth(7)
        0.0001             2      0.596314      0.597079          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardSouth(7)
           -15            15      -7.51643      -7.60551          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_PISCO(8)
        0.0001             2      0.198341       0.20918          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_PISCO(8)
           -15            15       -6.4032      -6.44959          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_CCFRP(9)
        0.0001             2      0.180607      0.184573          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_CCFRP(9)
           -15            15      -8.71973      -8.79837          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideNorth(10)
             0             2             0             0          1000             0         -4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideNorth(10)
           -15            15      -9.67221      -9.77089          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideSouth(11)
        0.0001             2      0.274419      0.275938          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideSouth(11)
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
            19            38       32.3755        32.339            99             0          1          0          0          0          0        0.5          1          2  #  Size_DblN_peak_Com(1)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Com(1)
            -9            10       3.10857       3.12435            99             0          5          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_Com(1)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Com(1)
           -15            -5      -11.9635      -11.7081            99             0          5          0          0          0          0        0.5          1          2  #  Size_DblN_start_logit_Com(1)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Com(1)
# 2   ComDisc LenSelex
            19            38       25.1105        25.041            99             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_peak_ComDisc(2)
           -15            10       1.24055      -9.37674            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_ComDisc(2)
            -9            10       2.03665       2.03482            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_ComDisc(2)
            -9             9      -3.35252       5.46908            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_ComDisc(2)
           -15            -5      -14.2241      -14.1176            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_ComDisc(2)
            -5            10          -999          -999            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_ComDisc(2)
# 3   RecNorth LenSelex
            19            39       32.5191       32.3789            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecNorth(3)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecNorth(3)
            -9            10       3.25533       3.26365            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecNorth(3)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecNorth(3)
           -15            -5      -12.2639      -11.9717            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecNorth(3)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecNorth(3)
# 4   RecSouth LenSelex
            19            38       27.8371       27.7317            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecSouth(4)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecSouth(4)
            -9            10       3.10718       3.21209            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecSouth(4)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecSouth(4)
           -15            -5      -8.90493      -8.81965            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecSouth(4)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecSouth(4)
# 5   DebCPFV LenSelex
            19            38        30.945       30.8941            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_DebCPFV(5)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_DebCPFV(5)
            -9            10       2.98761       2.99934            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_DebCPFV(5)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_DebCPFV(5)
           -20            -5      -18.1166      -17.8513            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_DebCPFV(5)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_DebCPFV(5)
# 6   RecOnboardNorth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardNorth(6)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardNorth(6)
# 7   RecOnboardSouth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardSouth(7)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardSouth(7)
# 8   PISCO LenSelex
            19            38       31.3835       30.4521            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_PISCO(8)
           -15            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_PISCO(8)
            -9            10       4.01189       3.90714            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_PISCO(8)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_PISCO(8)
           -15            15      -3.13411      -2.80113            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_PISCO(8)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_PISCO(8)
# 9   CCFRP LenSelex
            19            38       31.1682       31.0502            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_CCFRP(9)
           -15            10      -10.5823       -10.648            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_CCFRP(9)
            -9            10       3.12384       3.13457            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_CCFRP(9)
           -15             9       1.62181       1.64329            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_CCFRP(9)
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
            19            38       28.9836       43.8236            10             0      6  # Size_DblN_peak_Com(1)_BLK1repl_1999
            -9            10       1.60986       4.66827            10             0      6  # Size_DblN_ascend_se_Com(1)_BLK1repl_1999
           -15            -5       -12.497      -12.0962            10             0      6  # Size_DblN_start_logit_Com(1)_BLK1repl_1999
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
4 1 0.1643055
4 2 0.1505834
4 3 0.377381
4 4 0.07699878
4 5 0.3918643
4 6 1
4 7 1
4 8 0.1762978
4 9 0.1201929
4 10 1
4 11 1
4 12 1
5 1 0.5594636
5 2 1
5 3 0.2449681
5 4 1
5 5 1
5 6 1
5 7 1
5 8 1
5 9 0.04527898
5 10 1
5 11 1
5 12 0.09886902
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
 # 0 0 0 0 0 0 0 0 0 # placeholder for # selex_fleet, 1=len/2=age/3=both, year, N selex bins, 0 or Growth pattern, N growth ages, 0 or NatAge_area(-1 for all), NatAge_yr, N Natages
 # placeholder for vector of selex bins to be reported
 # placeholder for vector of growth ages to be reported
 # placeholder for vector of NatAges ages to be reported
999

