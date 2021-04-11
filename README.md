# Walker2014Sampling

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://igutierrezm.github.io/Walker2014Sampling.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://igutierrezm.github.io/Walker2014Sampling.jl/dev)
[![Build Status](https://github.com/igutierrezm/Walker2014Sampling.jl/workflows/CI/badge.svg)](https://github.com/igutierrezm/Walker2014Sampling.jl/actions)
[![codecov](https://codecov.io/gh/igutierrezm/Walker2014Sampling.jl/branch/master/graph/badge.svg?token=o8DGQSTKft)](https://codecov.io/gh/igutierrezm/Walker2014Sampling.jl)

A minimalist implementation of the MCMC sampler proposed by Walker (2014).

## Installation


Install with the Julia package manager Pkg, just like any other registered Julia package:

```julia
# Press ']' to enter the Pkg REPL mode.
pkg> add https://github.com/igutierrezm/Walker2014Sampler.jl  
```

or

```julia
julia> using Pkg; 
julia> Pkg.add("https://github.com/igutierrezm/Walker2014Sampler.jl")
```

## Usage

Let π(⋅) be your target distribution, and let `x` the current value in your MC. Then, you can define the transition distribution for the next iteration as follows:

```julia
td = TransitionDistribution(k, p);
``` 

where `k` is the tuning parameter described in the article, and `p` is a `(2k - 1)` dimensional vector such that each `p[j]` is proportional to π(x - k + j).

Once the transition distribution is defined, you can sample the next value in your MC as follows:

```julia
xnew = rand(rng, td, x);
``` 

where `rng` is any `AbstractRNG` object. Note that both `rng` and `s` are modified in the process.

## References

Walker, S. G. (2014). Sampling unnormalized probabilities: An alternative to the Metropolis--Hastings algorithm. *SIAM Journal on Scientific Computing*, 36(2), A482–A494. https://doi.org/10.1137/130922549#
