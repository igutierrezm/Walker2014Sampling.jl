# Walker2014Sampling

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://igutierrezm.github.io/Walker2014Sampling.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://igutierrezm.github.io/Walker2014Sampling.jl/dev)
[![Build Status](https://github.com/igutierrezm/Walker2014Sampling.jl/workflows/CI/badge.svg)](https://github.com/igutierrezm/Walker2014Sampling.jl/actions)
[![codecov](https://codecov.io/gh/igutierrezm/Walker2014Sampling.jl/branch/master/graph/badge.svg?token=o8DGQSTKft)](https://codecov.io/gh/igutierrezm/Walker2014Sampling.jl)

Sampling from a discrete unnormalized [pmf](https://en.wikipedia.org/wiki/Probability_mass_function) in Julia using Walker's MCMC algorithm, see Walker (2014) for details.

## Installation


Install with the Julia package manager Pkg:

```julia
# Press ']' to enter the Pkg REPL mode.
pkg> add https://github.com/igutierrezm/Walker2014Sampling.jl  
```

or

```julia
julia> using Pkg; 
julia> Pkg.add("https://github.com/igutierrezm/Walker2014Sampling.jl")
```

## Usage

Suppose we want to draw the next state in a [MCMC](https://en.wikipedia.org/wiki/Markov_chain_Monte_Carlo) with target (unnormalized) pmf `p()` using the algorithm proposed by Walker (2014) with parameter `k`. Suppose further that the support of `p()` is ℕ and the current state is `xold`.

The first step is to set up the environment:

```julia
using Random, Walker2014Sampling
rng = MersenneTwister(1)
```

Then, we create a sampler `s` and draw the next state using `rand()`:

```julia
s = Walker2014Sampler(k);
xnew = rand(rng, s, p, xold);
``` 

We note that both `rng` and `s` are modified in the process. 

## References

Walker, S. G. (2014). Sampling unnormalized probabilities: An alternative to the Metropolis--Hastings algorithm. *SIAM Journal on Scientific Computing*, 36(2), A482–A494. https://doi.org/10.1137/130922549#
