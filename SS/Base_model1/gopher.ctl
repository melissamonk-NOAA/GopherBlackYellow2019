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
0 0 0 0 0 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
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
 0.05 0.4 0.193 -1.6458 0.4384 3 -2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 4 50 13.4419 9.58981 999 0 3 0 0 0 0 1 0 0 # L_at_Amin_Fem_GP_1
 20 60 28.9276 28.5486 999 0 3 0 0 0 0 1 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.104917 0.129089 999 0 3 0 0 0 0 1 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.166824 0.257658 999 0 3 0 0 0 0 1 0 0 # CV_young_Fem_GP_1
 0.03 0.3 0.12014 0.116626 999 0 3 0 0 0 0 1 0 0 # CV_old_Fem_GP_1
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
             2            15       8.05851       8.47334            99             0          1          0          0          0          0          1          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72          0.16             2         -1          0          0          0          0          1          0          0 # SR_BH_steep
             0             2           0.5           0.5            99             0         -2          0          0          0          0          1          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -4          0          0          0          0          1          0          0 # SR_regime
            -1             1             0             0            99             0         -4          0          0          0          0          1          0          0 # SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1978 # first year of main recr_devs; early devs can preceed this era
2018 # last year of main recr_devs; forecast devs start in following year
3 #_recdev phase 
1 # (0/1) to read 13 advanced options
 0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 -4 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1978 #_last_yr_nobias_adj_in_MPD; begin of ramp
 1979 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2014.63 #_last_yr_fullbias_adj_in_MPD
 2019 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.32 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#  1978R 1979R 1980R 1981R 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018R 2019F 2020F 2021F 2022F 2023F 2024F 2025F 2026F 2027F 2028F 2029F 2030F
#  0.0858161 0.0641797 0.21541 0.152056 0.245099 0.0322956 -0.319414 -0.289413 -0.337346 -0.288015 -0.147998 0.0604671 1.17719 0.478848 0.700331 0.474884 0.549718 0.535135 0.284492 0.000494428 -0.111175 -0.105938 -0.303725 0.164332 -0.12816 0.354612 -0.435815 -0.447089 -0.153707 -0.612088 -0.396063 -0.580714 -0.16794 -0.353498 -0.455724 -0.576597 0.484977 0.633893 -0.111573 0.289242 -0.661482 0 0 0 0 0 0 0 0 0 0 0 0
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
# Com 0.00817578 0.0127506 0.0149842 0.0104619 0.010697 0.00885045 0.00762152 0.00824666 0.0047661 0.00595306 0.00962299 0.00818075 0.00989905 0.00820385 0.0116535 0.00416428 0.0135211 0.0056137 0.00379802 0.000941214 1.18515e-005 0.0159131 0.0226955 0.0292369 0.0380868 0.0389447 0.019644 0.025335 0.000108414 0.00134628 0.0382636 0.0620464 0.0566758 0.0440776 0.0418993 0.0622214 0.071018 0.0850054 0.110473 0.082755 0.117098 0.111411 0.102161 0.060665 0.0353555 0.0552378 0.0861897 0.0710125 0.0526148 0.0682772 0.0426054 0.0208965 0.025595 0.0303809 0.0432482 0.0440244 0.0597116 0.0989148 0.108779 0.11122 0.117308 0.106463 0.155779 0.124451 0.242587 0.217072 0.170236 0.13025 0.0808538 0.0449653 0.145966 0.213225 0.353013 0.287519 0.288766 0.438543 0.594455 0.602527 0.513889 0.921744 0.973057 0.651815 0.512892 0.410641 0.303187 0.265144 0.191884 0.130605 0.103908 0.108358 0.0923227 0.112231 0.121789 0.135724 0.151699 0.18615 0.145223 0.153436 0.173999 0.220583 0.20543 0.2495 0.305394 0.526991 0.526991 0.526991 0.526991 0.526991 0.526991 0.526991 0.526991 0.526991 0.526991 0.526991 0.526991
# RecNorth 0 0 0 0 0 0 0 0 0 0 0 0 0.00165787 0.00332033 0.00382431 0.00510674 0.00639757 0.00769771 0.00899041 0.0102802 0.0115682 0.0137638 0.0136458 0.0120456 0.0175572 0.0164434 0.00879444 0.00842795 0.00690381 0.00914565 0.0157836 0.0126645 0.0257269 0.0338905 0.04191 0.0526317 0.0468522 0.0407764 0.0520451 0.0636743 0.0730184 0.0849952 0.133033 0.108163 0.0810932 0.0780852 0.0791053 0.0780055 0.0612892 0.0874941 0.0953534 0.104134 0.102857 0.0876132 0.115031 0.0872217 0.116823 0.144091 0.153643 0.150551 0.155714 0.135335 0.106555 0.119984 0.279408 0.304073 0.324859 0.34048 0.655564 0.748775 0.891225 0.660534 0.453142 0.376887 0.460697 0.566447 0.722202 0.935633 0.80685 0.433424 0.33267 0.300946 0.291192 0.27178 0.322969 0.461732 0.337396 0.420315 0.148849 0.160601 0.158055 0.106253 0.145874 0.218147 0.379795 0.29498 0.197744 0.162811 0.253405 0.278239 0.343222 0.281414 0.223611 0.385866 0.385866 0.385866 0.385866 0.385866 0.385866 0.385866 0.385866 0.385866 0.385866 0.385866 0.385866
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 1.49717e-005 2.99804e-005 4.5046e-005 6.01284e-005 7.52863e-005 9.05225e-005 0.000105686 0.000120823 0.00021345 0.000306936 0.000402241 0.000499162 0.000598551 0.000700213 0.000799652 0.000896789 0.000990848 0.00108137 0.00117955 0.00128925 0.00140476 0.00152108 0.00163761 0.00176254 0.00189508 0.00202937 0.00217465 0.00232325 0.00247798 0.00264504 0.00282302 0.00298503 0.00309963 0.00320125 0.00332301 0.00345044 0.00355627 0.0036679 0.0037908 0.0039004 0.00400754 0.00411301 0.00423597 0.00436495 0.00450413 0.00470235 0.00494027 0.00517599 0.00540406 0.00560487 0.00578837 0.00596317 0.0065109 0.00623921 0.00582843 0.00529407 0.00931122 0.0100847 0.0121338 0.0112202 0.00942747 0.00701161 0.00539379 0.00390408 0.00236694 0.00502681 0.00822979 0.00315051 0.0127119 0.00604146 0.00464691 0.0170221 0.00652357 0.00463314 0.00293889 0.00366405 0.00131163 0.00878409 0.00285221 0.00364669 0.00493426 0.00606941 0.00585585 0.0165743 0.0169212 0.0157881 0.0170241 0.0100573 0.0142425 0.0258116 0.0151985 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268 0.0262268
#
#_Q_setup for fleets with cpue or survey data
#_1:  fleet number
#_2:  link type: (1=simple q, 1 parm; 2=mirror simple q, 1 mirrored parm; 3=q and power, 2 parm; 4=mirror with offset, 2 parm)
#_3:  extra input for link, i.e. mirror fleet# or dev index number
#_4:  0/1 to select extra sd parameter
#_5:  0/1 for biasadj or not
#_6:  0/1 to float
#_   fleet      link link_info  extra_se   biasadj     float  #  fleetname
         4         1         0         1         0         1  #  DebCPFV
         5         1         0         1         0         1  #  RecOnboardNorth
         6         1         0         1         0         1  #  PISCO
         7         1         0         1         0         1  #  CCFRP
         8         1         0         0         0         1  #  RecDocksideNorth
        10         1         0         0         0         1  #  PISCOage0
-9999 0 0 0 0 0
#
#_Q_parms(if_any);Qunits_are_ln(q)
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
           -15            15      -7.17185      -6.98277          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_DebCPFV(4)
             0             2      0.057617     0.0695633          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_DebCPFV(4)
           -15            15      -7.75606      -7.71816          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardNorth(5)
        0.0001             2       0.23836      0.229558          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardNorth(5)
           -15            15      -6.41279      -7.60551          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_PISCO(6)
        0.0001             2        0.1528       0.20918          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_PISCO(6)
           -15            15      -6.19097      -6.44959          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_CCFRP(7)
        0.0001             2      0.213261      0.184573          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_CCFRP(7)
           -15            15          -9.3      -8.79837          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideNorth(8)
           -15            15      -10.1874      -9.77089          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_PISCOage0(10)
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
 24 0 0 0 # 2 RecNorth
 24 0 0 0 # 3 RecSouth
 5 0 0 2 # 4 DebCPFV
 5 0 0 2 # 5 RecOnboardNorth
 24 0 0 0 # 6 PISCO
 5 0 0 2 # 7 CCFRP
 5 0 0 2 # 8 RecDocksideNorth
 0 0 0 0 # 9 Dummy1
 0 0 0 0 # 10 PISCOage0
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
 0 0 0 0 # 2 RecNorth
 0 0 0 0 # 3 RecSouth
 0 0 0 0 # 4 DebCPFV
 0 0 0 0 # 5 RecOnboardNorth
 0 0 0 0 # 6 PISCO
 0 0 0 0 # 7 CCFRP
 0 0 0 0 # 8 RecDocksideNorth
 0 0 0 0 # 9 Dummy1
 11 0 0 0 # 10 PISCOage0
#
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn  #  parm_name
# 1   Com LenSelex
            19            38       31.0637        32.339            99             0          1          0          0          0          0        0.5          0          0  #  Size_DblN_peak_Com(1)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Com(1)
            -9            10       2.73392       3.12435            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_Com(1)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Com(1)
           -15            -5      -9.34073      -11.7081            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_Com(1)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Com(1)
# 2   RecNorth LenSelex
            19            39       32.1269       32.3789            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecNorth(2)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecNorth(2)
            -9            10       3.20366       3.26365            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecNorth(2)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecNorth(2)
           -15            -5      -11.0912      -11.9717            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecNorth(2)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecNorth(2)
# 3   RecSouth LenSelex
            19            38       27.5612       27.7317            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecSouth(3)
            -5            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecSouth(3)
            -9            10       3.07522       3.21209            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecSouth(3)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecSouth(3)
           -15            -5      -7.48436      -8.81965            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecSouth(3)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecSouth(3)
# 4   DebCPFV LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_DebCPFV(4)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_DebCPFV(4)
# 5   RecOnboardNorth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardNorth(5)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardNorth(5)
# 6   PISCO LenSelex
            19            38            38       30.4521            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_peak_PISCO(6)
           -15            10             8             8            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_PISCO(6)
            -9            10       4.69493       3.90714            99             0          5          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_PISCO(6)
            -9             9             5             5            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_PISCO(6)
           -25            15      -17.0292      -2.80113            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_PISCO(6)
            -5            15            10            10            99             0         -5          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_PISCO(6)
# 7   CCFRP LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_CCFRP(7)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_CCFRP(7)
# 8   RecDocksideNorth LenSelex
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecDocksideNorth(8)
            -1            10            -1            -1            99             0         -5          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecDocksideNorth(8)
# 9   Dummy1 LenSelex
# 10   PISCOage0 LenSelex
# 1   Com AgeSelex
# 2   RecNorth AgeSelex
# 3   RecSouth AgeSelex
# 4   DebCPFV AgeSelex
# 5   RecOnboardNorth AgeSelex
# 6   PISCO AgeSelex
# 7   CCFRP AgeSelex
# 8   RecDocksideNorth AgeSelex
# 9   Dummy1 AgeSelex
# 10   PISCOage0 AgeSelex
             0             1             0             0            99             0         -5          0          0          0          0        0.5          0          0  #  minage@sel=1_PISCOage0(10)
             0             1             0             0            99             0         -5          0          0          0          0        0.5          0          0  #  maxage@sel=1_PISCOage0(10)
#_no timevary selex parameters
#
0   #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
#
# Tag loss and Tag reporting parameters go next
0  # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# no timevary parameters
#
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
      4      1  0.110867
      4      2  0.406211
      4      3  0.083914
      4      4  0.526488
      4      6  0.315271
      4      7  0.125555
      5      2   0.20045
      5      7  0.027633
      5      9  0.071128
 -9999   1    0  # terminator
#
4 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 0 changes to default Lambdas (default value is 1.0)
# Like_comp codes:  1=surv; 2=disc; 3=mnwt; 4=length; 5=age; 6=SizeFreq; 7=sizeage; 8=catch; 9=init_equ_catch; 
# 10=recrdev; 11=parm_prior; 12=parm_dev; 13=CrashPen; 14=Morphcomp; 15=Tag-comp; 16=Tag-negbin; 17=F_ballpark; 18=initEQregime
#like_comp fleet  phase  value  sizefreq_method
-9999  1  1  1  1  #  terminator
#
# lambdas (for info only; columns are phases)
#  0 0 0 0 #_CPUE/survey:_1
#  0 0 0 0 #_CPUE/survey:_2
#  0 0 0 0 #_CPUE/survey:_3
#  1 1 1 1 #_CPUE/survey:_4
#  1 1 1 1 #_CPUE/survey:_5
#  1 1 1 1 #_CPUE/survey:_6
#  1 1 1 1 #_CPUE/survey:_7
#  1 1 1 1 #_CPUE/survey:_8
#  0 0 0 0 #_CPUE/survey:_9
#  1 1 1 1 #_CPUE/survey:_10
#  1 1 1 1 #_lencomp:_1
#  1 1 1 1 #_lencomp:_2
#  1 1 1 1 #_lencomp:_3
#  1 1 1 1 #_lencomp:_4
#  0 0 0 0 #_lencomp:_5
#  1 1 1 1 #_lencomp:_6
#  1 1 1 1 #_lencomp:_7
#  0 0 0 0 #_lencomp:_8
#  0 0 0 0 #_lencomp:_9
#  0 0 0 0 #_lencomp:_10
#  0 0 0 0 #_agecomp:_1
#  1 1 1 1 #_agecomp:_2
#  0 0 0 0 #_agecomp:_3
#  0 0 0 0 #_agecomp:_4
#  0 0 0 0 #_agecomp:_5
#  0 0 0 0 #_agecomp:_6
#  1 1 1 1 #_agecomp:_7
#  0 0 0 0 #_agecomp:_8
#  1 1 1 1 #_agecomp:_9
#  0 0 0 0 #_agecomp:_10
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

