# SloanUGRIZFilters

[![Build Status](https://github.com/ngiann/SloanUGRIZFilters.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/ngiann/SloanUGRIZFilters.jl/actions/workflows/CI.yml?query=branch%3Amain)

# Methods

Exports methods `filter_u`, `filter_g`, `filter_r`, `filter_i`, `filter_z` that linearly interpolate the SDSS discretised filters  download from [here](http://svo2.cab.inta-csic.es/svo/theory/fps3/). The filters are normalised in that their integral equals 1.

Produce plot with
```
using SloanUGRIZFilters
using PyPlot # must be independently installed

λ = 0:0.1:11300

plot(λ, filter_u.(λ),"m");fill_between(λ, 0*λ, filter_u.(λ),color="m",alpha=0.3)

plot(λ, filter_g.(λ),"c");fill_between(λ, 0*λ, filter_g.(λ),color="c",alpha=0.3)

plot(λ, filter_r.(λ),"g");fill_between(λ, 0*λ, filter_r.(λ),color="g",alpha=0.3)

plot(λ, filter_i.(λ),"y");fill_between(λ, 0*λ, filter_i.(λ),color="y",alpha=0.3)

plot(λ, filter_z.(λ),"r");fill_between(λ, 0*λ, filter_z.(λ),color="r",alpha=0.3)

```
