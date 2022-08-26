
<!-- README.md is generated from README.Rmd. Please edit that file -->

# CSIAConcCalc

<!-- badges: start -->
<!-- badges: end -->

The goal of CSIAConcCalc is to …

## Installation

You can install the released version of CSIAConcCalc from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("CSIAConcCalc")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(CSIAConcCalc)

## Load data from a hand full of runs
data(df_runinfo)

## Calculated the mass that went into the machine on those runs
df_runinfo$massin <- calc_massinmachine(smp_mass = df_runinfo$smp_mass, 
                                        cut_vol = df_runinfo$cut, 
                                        EA_vol = df_runinfo$EA, 
                                        inj_vol = df_runinfo$inj)
```

``` r
#' Look at the peak size that resulted, and then calculated what mass would have
#' gone in if it was an ideal case
### CYNO BACTERIA
df_Carbon_cyno <- df_runinfo[df_runinfo$C_N == "C" & df_runinfo$species =="cyno", ]
df_Carbon_cyno$TargetMassIn <- calc_target_mass(goal_peak = 2500, 
                                                test_mass = df_Carbon_cyno$massin, 
                                                actual_peak = df_Carbon_cyno$peak_average)

df_Nitrogen_cyno <- df_runinfo[df_runinfo$C_N == "N" & df_runinfo$species =="cyno", ]
df_Nitrogen_cyno$TargetMassIn <- calc_target_mass(goal_peak = 700, 
                                                test_mass = df_Nitrogen_cyno$massin, 
                                                actual_peak = df_Nitrogen_cyno$peak_average)

mean(df_Carbon_cyno$TargetMassIn)   ## 0.002 mg of cyno for carbon 
#> [1] 0.002028125
mean(df_Nitrogen_cyno$TargetMassIn) ## 0.039 mg of cyno for nitrogen 
#> [1] 0.03927743

### New England Black Seabass
df_Carbon_fish <- df_runinfo[df_runinfo$C_N == "C" & df_runinfo$species =="fish", ]
df_Carbon_fish$TargetMassIn <- calc_target_mass(goal_peak = 2500, 
                                                test_mass = df_Carbon_fish$massin, 
                                                actual_peak = df_Carbon_fish$peak_average)

df_Nitrogen_fish <- df_runinfo[df_runinfo$C_N == "N" & df_runinfo$species =="fish", ]
df_Nitrogen_fish$TargetMassIn <- calc_target_mass(goal_peak = 700, 
                                                test_mass = df_Nitrogen_fish$massin, 
                                                actual_peak = df_Nitrogen_fish$peak_average)

mean(df_Carbon_fish$TargetMassIn)   ## 0.0015 mg of fish for carbon 
#> [1] 0.00148628
mean(df_Nitrogen_fish$TargetMassIn) ## 0.0314 mg of fish for nitrogen 
#> [1] 0.03145949
```

``` r

### Example for how to calculate the EA volume to dilute the sample at all 
## possible injection sizes
calc_EA_vol(smp_mass = df_Carbon_cyno$smp_mass[1], cut_vol = 100, massinmachine = 0.002)
#>   inj_vols_ul EA_vols_ul cut_ul massinmachine_mg smp_mass_mg
#> 1         1.0        310    100            0.002         6.2
#> 2         1.5        465    100            0.002         6.2
#> 3         2.0        620    100            0.002         6.2
#> 4         2.5        775    100            0.002         6.2
#> 5         3.0        930    100            0.002         6.2
#> 6         3.5       1085    100            0.002         6.2
#> 7         4.0       1240    100            0.002         6.2
calc_EA_vol(smp_mass = df_Carbon_fish$smp_mass[1], cut_vol = 100, massinmachine = 0.0015)
#>   inj_vols_ul EA_vols_ul cut_ul massinmachine_mg smp_mass_mg
#> 1         1.0        390    100           0.0015        5.85
#> 2         1.5        585    100           0.0015        5.85
#> 3         2.0        780    100           0.0015        5.85
#> 4         2.5        975    100           0.0015        5.85
#> 5         3.0       1170    100           0.0015        5.85
#> 6         3.5       1365    100           0.0015        5.85
#> 7         4.0       1560    100           0.0015        5.85
```

``` r
### Need a new starting point target mass for coral samples: 
### We know the percent carbon and nitrogen for the black seabass from bulk data 
## 42.75% Carbon 13.23% Nitrogen 
## Using the average mass in for carbon and nitrogen for the black sea bass we see
## its about 6.4117 *10^-4 mg of carbon to get peaks of about 3000
## and then it's about 1.979 *10^-4 mg of nitrogen to get peaks of about 1000

# This gives:
## C 2.137 *10^-7/mv
## N 1.979 *10^-7/mv

# So a good starting point would be to aim for about 2*10^-7/mv for a new species 
# Things that could change this are species by species
# Error from Lab work 
# Machine sensitivity and repairs 
```
