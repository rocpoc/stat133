README
================

Overview
--------

"Roller" is an R package that is used for creating devices with programmable amounts of sides and probabilities, as well as rolling the devices and visualizing the frequencies of the rolls. It provides the following functions:

-   `device()` creates a device object (of class `"device"`).
-   `roll()` to roll a device object, creating a `"rolls"` object.
-   `plot()` method for a `"roll"` object to plot frequencies of a series of rolls.
-   `summary()` method for a `"roll"` object.

Motivation
----------

The motivation for this project was to learn how to create and operate building an entire R package.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# install.packages("devtools") 
# install "cointoss" (without vignettes)
devtools::install_github("rocpoc/roller")
# install "cointoss" (with vignettes)
devtools::install_github("rocpoc/roller", build_vignettes = TRUE)
```

Usage
-----

``` r
library(roller)

# default device
default_device = device()
default_device
#> object "device"
#> 
#>   side prob
#> 1    1  0.5
#> 2    2  0.5

# default roll the default device
default_roll = roll(default_device)
default_roll
#> object "rolls"
#> 
#> [1] 2


# create fair die device
die = device(sides = 1:6, prob = rep(1/6, 6))
die
#> object "device"
#> 
#>   side      prob
#> 1    1 0.1666667
#> 2    2 0.1666667
#> 3    3 0.1666667
#> 4    4 0.1666667
#> 5    5 0.1666667
#> 6    6 0.1666667

# roll the die 5 times or 100 times
die_roll5 = roll(die, 5)
die_roll100 = roll(die, 100)

die_roll5
#> object "rolls"
#> 
#> [1] 6 6 4 2 6
die_roll100
#> object "rolls"
#> 
#>   [1] 2 3 4 1 2 5 1 1 4 6 5 2 1 1 4 4 1 3 3 4 4 3 5 6 5 6 1 4 5 5 1 1 5 2 1
#>  [36] 4 1 2 6 4 6 3 2 2 2 4 2 4 6 2 3 4 1 1 3 2 5 2 6 6 4 3 3 6 4 5 4 6 6 5
#>  [71] 4 1 1 6 6 6 3 5 4 3 4 1 4 6 2 2 5 1 6 6 1 3 4 4 6 1 3 5 5 4
```

``` r
# summary of the 5 roll
summary.rolls(die_roll5)
#> summary "rolls"
#> 
#>   side count prop
#> 1    1     1  0.2
#> 2    2     1  0.2
#> 3    3     3  0.6
#> 4    4     1  0.2
#> 5    5     1  0.2
#> 6    6     3  0.6

# summary of the 100 roll
summary.rolls(die_roll100)
#> summary "rolls"
#> 
#>   side count prop
#> 1    1    19 0.19
#> 2    2    14 0.14
#> 3    3    13 0.13
#> 4    4    22 0.22
#> 5    5    14 0.14
#> 6    6    18 0.18
```
