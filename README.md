
<!-- README.md is generated from README.Rmd. Please edit that file -->

# mortyr <img src='man/figures/logo.png' align="right" height="150" /></a>

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis build
status](https://travis-ci.org/MikeJohnPage/mortyr.svg?branch=master)](https://travis-ci.org/MikeJohnPage/mortyr)
<!-- badges: end -->

## Overview

mortyr is an R wrapper to the [The Rick and Morty
API](https://rickandmortyapi.com/) and the most rickdiculous package in
the R-verse. Use it to return information about your favourite
characters, locations, and episodes from the show.

## Installation

You can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("MikeJohnPage/mortyr")
```

## Usage

``` r

mortyr::get_characters()
#> # A tibble: 493 x 14
#>      id name  status species type  gender image episode url   created
#>   <int> <chr> <chr>  <chr>   <chr> <chr>  <chr> <list>  <chr> <chr>  
#> 1     1 Rick… Alive  Human   ""    Male   http… <chr [… http… 2017-1…
#> 2     2 Mort… Alive  Human   ""    Male   http… <chr [… http… 2017-1…
#> 3     3 Summ… Alive  Human   ""    Female http… <chr [… http… 2017-1…
#> 4     4 Beth… Alive  Human   ""    Female http… <chr [… http… 2017-1…
#> 5     5 Jerr… Alive  Human   ""    Male   http… <chr [… http… 2017-1…
#> # … with 488 more rows, and 4 more variables
```

## Rate limit

The Rick and Morty API is an open API, no authentication is required for
use. Nonetheless, to prevent malicious usage of the API there is a limit
on the number of requests a given IP address can make. This limit is
10000 requests per day. If you happen to hit the limit you’ll receive a
429 status (Too Many Requests) on all your requests during a period of
12 hours.

## Getting help

If you encounter a clear bug, please file a minimal reproducible example
in [issues](https://github.com/MikeJohnPage/mortyr/issues).
