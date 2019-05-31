#V3.30.13-safe;_2019_03_09;_Stock_Synthesis_by_Richard_Methot_(NOAA)_using_ADMB_12.0
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
 1 1 1 0
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
#
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
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
1 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_ LO HI INIT PRIOR PR_SD PR_type PHASE env_var&link dev_link dev_minyr dev_maxyr dev_PH Block Block_Fxn
# Sex: 1  BioPattern: 1  NatMort
 0.05 0.4 0.196804 -1.6458 0.4384 3 2 0 0 0 0 0.5 0 0 # NatM_p_1_Fem_GP_1
# Sex: 1  BioPattern: 1  Growth
 4 50 7.84911 22.2 999 0 3 0 0 0 0 1 0 0 # L_at_Amin_Fem_GP_1
 20 60 29.0659 31.2 999 0 3 0 0 0 0 1 0 0 # L_at_Amax_Fem_GP_1
 0.01 0.3 0.146235 0.186 999 0 3 0 0 0 0 1 0 0 # VonBert_K_Fem_GP_1
 0.05 0.5 0.243054 0.06 999 0 3 0 0 0 0 1 0 0 # CV_young_Fem_GP_1
 0.03 0.3 0.108823 0.06 999 0 3 0 0 0 0 1 0 0 # CV_old_Fem_GP_1
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
 0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; Options: 2=Ricker; 3=std_B-H; 4=SCAA; 5=Hockey; 6=B-H_flattop; 7=survival_3Parm; 8=Shepherd_3Parm; 9=RickerPower_3parm
0  # 0/1 to use steepness in initial equ recruitment calculation
0  #  future feature:  0/1 to make realized sigmaR a function of SR curvature
#_          LO            HI          INIT         PRIOR         PR_SD       PR_type      PHASE    env-var    use_dev   dev_mnyr   dev_mxyr     dev_PH      Block    Blk_Fxn #  parm_name
             2            15       8.22905           7.7            99             0          1          0          0          0          0          1          0          0 # SR_LN(R0)
           0.2             1          0.72          0.72            99             0         -1          0          0          0          0          1          0          0 # SR_BH_steep
             0             2          0.35          0.35            99             0         -2          0          0          0          0          1          0          0 # SR_sigmaR
            -5             5             0             0            99             0         -4          0          0          0          0          1          0          0 # SR_regime
            -1             1             0             0            99             0         -3          0          0          0          0          1          0          0 # SR_autocorr
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1982 # first year of main recr_devs; early devs can preceed this era
2017 # last year of main recr_devs; forecast devs start in following year
1 #_recdev phase 
1 # (0/1) to read 13 advanced options
 1960 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
 2 #_recdev_early_phase
 0 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
 1 #_lambda for Fcast_recr_like occurring before endyr+1
 1901 #_last_yr_nobias_adj_in_MPD; begin of ramp
 2060 #_first_yr_fullbias_adj_in_MPD; begin of plateau
 2013.2 #_last_yr_fullbias_adj_in_MPD
 2013.3 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
 0.1178 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
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
#  1960E 1961E 1962E 1963E 1964E 1965E 1966E 1967E 1968E 1969E 1970E 1971E 1972E 1973E 1974E 1975E 1976E 1977E 1978E 1979E 1980E 1981E 1982R 1983R 1984R 1985R 1986R 1987R 1988R 1989R 1990R 1991R 1992R 1993R 1994R 1995R 1996R 1997R 1998R 1999R 2000R 2001R 2002R 2003R 2004R 2005R 2006R 2007R 2008R 2009R 2010R 2011R 2012R 2013R 2014R 2015R 2016R 2017R 2018F 2019F
#  -0.136853 -0.15639 -0.178915 -0.201309 -0.218891 -0.228303 -0.228275 -0.21524 -0.176666 -0.146996 -0.147597 -0.165236 -0.223654 -0.279128 -0.243665 -0.139323 -0.0399271 0.0116587 0.0773325 -0.0125265 0.0353819 0.0948925 0.0915788 0.0345585 -0.242859 -0.325824 -0.355735 -0.296867 -0.144061 0.109081 0.429487 0.614056 0.587709 0.603823 0.582189 0.444458 0.343653 0.0963951 -0.0530308 -0.117541 -0.246574 -0.0981786 0.0105673 -0.162749 -0.30718 -0.334023 -0.352456 -0.355743 -0.331112 -0.204825 -0.0966661 -0.24292 -0.27456 -0.217589 0.134814 0.484016 0.190661 0.00344939 -0.116026 0
# implementation error by year in forecast:  0
#
#Fishing Mortality info 
0.5 # F ballpark
-1999 # F ballpark year (neg value to disable)
3 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
3 # max F or harvest rate, depends on F_Method
# no additional F input needed for Fmethod 1
# if Fmethod=2; read overall start F value; overall phase; N detailed inputs to read
# if Fmethod=3; read N iterations for tuning for Fmethod 3
5  # N iterations for tuning F in hybrid method (recommend 3 to 7)
#
#_initial_F_parms; count = 0
#_ LO HI INIT PRIOR PR_SD  PR_type  PHASE
#2019 2039
# F rates by fleet
# Yr:  1916 1917 1918 1919 1920 1921 1922 1923 1924 1925 1926 1927 1928 1929 1930 1931 1932 1933 1934 1935 1936 1937 1938 1939 1940 1941 1942 1943 1944 1945 1946 1947 1948 1949 1950 1951 1952 1953 1954 1955 1956 1957 1958 1959 1960 1961 1962 1963 1964 1965 1966 1967 1968 1969 1970 1971 1972 1973 1974 1975 1976 1977 1978 1979 1980 1981 1982 1983 1984 1985 1986 1987 1988 1989 1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019
# seas:  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
# Com 0.00656178 0.0102333 0.0120329 0.00839754 0.00858866 0.00709247 0.00611951 0.00660534 0.0038189 0.00478034 0.0077069 0.00655921 0.00792715 0.0065752 0.00933744 0.00334178 0.0108257 0.00448663 0.00304596 0.000748716 1.74136e-05 0.0127004 0.0181037 0.0232942 0.0303053 0.0309565 0.0156086 0.0201167 9.12396e-05 0.00107026 0.0303816 0.0491781 0.044802 0.0347136 0.0329723 0.0485528 0.0550352 0.0656637 0.0847665 0.0627339 0.0884938 0.0838392 0.0771504 0.0460104 0.0265013 0.0407874 0.0634549 0.0521841 0.0385719 0.0499803 0.0313102 0.0156121 0.0193681 0.0234807 0.0339006 0.0350825 0.0485236 0.0821191 0.0923677 0.0966108 0.10409 0.0962356 0.143111 0.116004 0.230633 0.21153 0.169663 0.123334 0.0726376 0.0449082 0.148308 0.210677 0.343472 0.27129 0.26981 0.403703 0.537079 0.546037 0.504731 0.827865 0.869748 0.5854 0.467203 0.32076 0.230149 0.195971 0.137222 0.0592883 0.0706171 0.0701475 0.0572343 0.0706209 0.084518 0.0855812 0.100204 0.119793 0.100847 0.103819 0.118782 0.151748 0.138685 0.165438 0.189852 0.310918
# ComDisc 0.000430993 0.000671526 0.000788652 0.000549765 0.000561783 0.000463575 0.000399775 0.000431343 0.000249335 0.000312109 0.000503114 0.000428102 0.000517251 0.000428867 0.000608702 0.000217749 0.000704982 0.00029195 0.000198124 4.86878e-05 1.13222e-06 0.00082506 0.00117379 0.00150666 0.00195389 0.00198845 0.00100013 0.00128741 5.83841e-06 6.8569e-05 0.00194547 0.00313894 0.00284704 0.00219617 0.00207711 0.00304186 0.00342518 0.00405963 0.00519988 0.00381761 0.00534176 0.00501415 0.00456854 0.0027029 0.00155343 0.00239166 0.00371812 0.00305502 0.00226193 0.00294038 0.00185083 0.000930561 0.00116587 0.00142736 0.00207594 0.00215771 0.00298681 0.00501861 0.00556188 0.00570823 0.00602526 0.00547199 0.00803246 0.00645429 0.0125977 0.0111607 0.00862019 0.00603691 0.00340196 0.00200114 0.00630938 0.00866624 0.014003 0.0111947 0.0114352 0.0175373 0.0235494 0.023549 0.0208252 0.0318602 0.0307327 0.019526 0.0154921 0.0128132 0.00977684 0.00893629 0.0067338 0.00313255 0.00401056 0.00425851 0.00366048 0.00468651 0.00572587 0.0058357 0.00679052 0.00801785 0.00670943 0.00689882 0.0078238 0.00976664 0.0086471 0.0100094 0.0112423 0.0184114
# RecNorth 0 0 0 0 0 0 0 0 0 0 0 0 0.00131947 0.00264199 0.00304212 0.00406133 0.00508627 0.00611753 0.00714321 0.00816643 0.00918803 0.0109255 0.0108205 0.00954037 0.0138849 0.0129825 0.00693729 0.0066459 0.00544482 0.00721706 0.0124492 0.00997179 0.0202135 0.0265715 0.0327926 0.0410691 0.036439 0.0316121 0.0401916 0.0489739 0.0559158 0.0647677 0.100843 0.0816744 0.0611788 0.058896 0.059586 0.0586737 0.0461001 0.0658273 0.0718124 0.0787397 0.0783406 0.067464 0.0898325 0.0692971 0.094673 0.119291 0.130102 0.130382 0.137697 0.121856 0.0974632 0.11134 0.276042 0.30806 0.336219 0.356392 0.68709 0.781612 0.92375 0.67038 0.445666 0.359585 0.428585 0.518006 0.654308 0.85553 0.751739 0.399547 0.338576 0.28583 0.274144 0.295326 0.299144 0.390384 0.29227 0.357524 0.118363 0.135952 0.132646 0.08872 0.121721 0.182145 0.317253 0.246916 0.166299 0.137505 0.213723 0.232424 0.2806 0.222433 0.169673 0.277871
# RecSouth 0 0 0 0 0 0 0 0 0 0 0 0 1.2463e-05 2.49539e-05 3.7487e-05 5.00323e-05 6.26336e-05 7.52928e-05 8.78919e-05 0.000100465 0.000180669 0.000261532 0.00034383 0.000427416 0.000512958 0.000600291 0.000685855 0.000769576 0.00085082 0.000929194 0.00101366 0.00110739 0.00120573 0.0013045 0.00140325 0.00150836 0.00161925 0.00173141 0.00185199 0.0019747 0.00210159 0.00223782 0.00238205 0.00251382 0.00260902 0.00269395 0.00279422 0.00289925 0.0029898 0.00309013 0.00320925 0.00333197 0.00346812 0.00361838 0.00379799 0.0039955 0.00421201 0.00449197 0.00481521 0.00513404 0.00543941 0.00571203 0.00597102 0.00622892 0.00748977 0.00739052 0.00705987 0.00649582 0.0122898 0.0140631 0.0157356 0.0145139 0.0130326 0.0104577 0.0102204 0.0104596 0.0113098 0.00499934 0.00838441 0.00331154 0.0136889 0.00652315 0.00492297 0.0175843 0.00654696 0.00450478 0.00277746 0.00337387 0.00118327 0.00784306 0.00253449 0.00323744 0.00439463 0.00542982 0.00526074 0.0149394 0.0152609 0.0141725 0.0150881 0.008721 0.0119783 0.0209901 0.0120301 0.0197016
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
           -15            15      -7.46644             0          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_DebCPFV(5)
        0.0001             2     0.0573353      0.164309          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_DebCPFV(5)
           -15            15      -7.92241             0          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardNorth(6)
        0.0001             2       0.23031      0.164309          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardNorth(6)
           -15            15      -10.4336             0          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecOnboardSouth(7)
        0.0001             2      0.589351      0.164309          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecOnboardSouth(7)
           -15            15      -7.86198             0          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_PISCO(8)
        0.0001             2      0.227125             0          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_PISCO(8)
           -15            15      -6.51655             0          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_CCFRP(9)
        0.0001             2      0.187984      0.164309          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_CCFRP(9)
           -15            15      -9.29171             0          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideNorth(10)
        0.0001             2    0.00010011      0.164309          1000             0         -4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideNorth(10)
           -15            15      -10.1469             0          1000             0         -1          0          0          0          0          1          0          0  #  LnQ_base_RecDocksideSouth(11)
        0.0001             2      0.240974      0.164309          1000             0          4          0          0          0          0          1          0          0  #  Q_extraSD_RecDocksideSouth(11)
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
            19            38       32.0227       43.8236            99             0          1          0          0          0          0        0.5          1          2  #  Size_DblN_peak_Com(1)
            -5            10             8             8            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_Com(1)
            -9            10       3.15742       4.66827            99             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_ascend_se_Com(1)
            -9             9             5             5            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_Com(1)
           -15            -5      -10.8949      -12.0962            99             0          3          0          0          0          0        0.5          1          2  #  Size_DblN_start_logit_Com(1)
            -5            15            10            10            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_Com(1)
# 2   ComDisc LenSelex
            19            38       25.3646       43.8236            99             0          2          0          0          0          0        0.5          0          0  #  Size_DblN_peak_ComDisc(2)
           -15            10      -10.4997      -1.42363            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_ComDisc(2)
            -9            10       2.14505       4.66827            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_ComDisc(2)
            -9             9      -6.23374       4.31619            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_ComDisc(2)
           -15            -5      -14.0043      -12.0962            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_ComDisc(2)
            -5            10       0.41326      -2.34605            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_ComDisc(2)
# 3   RecNorth LenSelex
            19            39       32.1793       43.8236            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecNorth(3)
            -5            10             8             8            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecNorth(3)
            -9            10       3.31256       4.66827            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecNorth(3)
            -9             9             5             5            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecNorth(3)
           -15            -5      -11.3739      -12.0962            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecNorth(3)
            -5            15            10            10            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecNorth(3)
# 4   RecSouth LenSelex
            19            38       27.0611       43.8236            99             0          4          0          0          0          0        0.5          0          0  #  Size_DblN_peak_RecSouth(4)
            -5            10             8             8            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_RecSouth(4)
            -9            10       3.17642       4.66827            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_RecSouth(4)
            -9             9             5             5            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_RecSouth(4)
           -15            -5      -8.24277      -12.0962            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_RecSouth(4)
            -5            15            10            10            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_RecSouth(4)
# 5   DebCPFV LenSelex
            19            38       30.4725       43.8236            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_DebCPFV(5)
            -5            10             8             8            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_DebCPFV(5)
            -9            10       3.01333       4.66827            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_DebCPFV(5)
            -9             9             5             5            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_DebCPFV(5)
           -15            -5      -14.8064      -12.0962            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_DebCPFV(5)
            -5            15            10            10            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_DebCPFV(5)
# 6   RecOnboardNorth LenSelex
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardNorth(6)
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardNorth(6)
# 7   RecOnboardSouth LenSelex
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecOnboardSouth(7)
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecOnboardSouth(7)
# 8   PISCO LenSelex
            19            38       28.0665       43.8236            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_PISCO(8)
           -15            10             8             8            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_PISCO(8)
            -9            10       3.55056       4.66827            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_PISCO(8)
            -9             9             5             5            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_PISCO(8)
           -15            15      -2.13767      -12.0962            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_PISCO(8)
            -5            15            10            10            99             0         -3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_PISCO(8)
# 9   CCFRP LenSelex
            19            38       31.4848       43.8236            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_peak_CCFRP(9)
           -15            10        -9.723      -1.42363            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_top_logit_CCFRP(9)
            -9            10       3.26605       4.66827            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_ascend_se_CCFRP(9)
           -15             9      -10.4259       4.31619            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_descend_se_CCFRP(9)
           -15            -5      -9.76241      -12.0962            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_start_logit_CCFRP(9)
            -5            10      -1.00239      -2.34605            99             0          3          0          0          0          0        0.5          0          0  #  Size_DblN_end_logit_CCFRP(9)
# 10   RecDocksideNorth LenSelex
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecDocksideNorth(10)
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecDocksideNorth(10)
# 11   RecDocksideSouth LenSelex
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P1_RecDocksideSouth(11)
            -1            10            -1            -1            99             0         -3          0          0          0          0        0.5          0          0  #  SizeSel_P2_RecDocksideSouth(11)
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
            19            38       28.7047       43.8236            10             0      3  # Size_DblN_peak_Com(1)_BLK1repl_1999
            -9            10       1.53832       4.66827            10             0      3  # Size_DblN_ascend_se_Com(1)_BLK1repl_1999
           -15            -5      -10.9944      -12.0962            10             0      3  # Size_DblN_start_logit_Com(1)_BLK1repl_1999
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
4 1 0.1639605
4 2 0.1506085
4 3 0.3915603
4 4 0.08474782
4 5 0.3316395
4 6 1
4 7 1
4 8 0.1526709
4 9 0.1201217
4 10 1
4 11 1
4 12 1
5 1 0.5704239
5 2 1
5 3 0.2377773
5 4 1
5 5 1
5 6 1
5 7 1
5 8 1
5 9 0.04423211
5 10 1
5 11 1
5 12 0.102117
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

