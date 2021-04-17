# Walker2014Sampling

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://igutierrezm.github.io/Walker2014Sampling.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://igutierrezm.github.io/Walker2014Sampling.jl/dev)
[![Build Status](https://github.com/igutierrezm/Walker2014Sampling.jl/workflows/CI/badge.svg)](https://github.com/igutierrezm/Walker2014Sampling.jl/actions)
[![codecov](https://codecov.io/gh/igutierrezm/Walker2014Sampling.jl/branch/main/graph/badge.svg?token=o8DGQSTKft)](https://codecov.io/gh/igutierrezm/Walker2014Sampling.jl)

Sampling from an unnormalized [pmf](https://en.wikipedia.org/wiki/Probability_mass_function) in Julia using Walker's MCMC algorithm, see Walker (2014) for details.

## Installation


Install with the Julia package manager Pkg, just like any other registered Julia package:

```julia
# Press ']' to enter the Pkg REPL mode.
pkg> add Walker2014Sampling
```

or

```julia
julia> using Pkg; 
julia> Pkg.add("Walker2014Sampling")
```

## Usage

Suppose we want to draw the next state in a [MCMC](https://en.wikipedia.org/wiki/Markov_chain_Monte_Carlo) with target (unnormalized) pmf `p()` using Walker's algorithm with parameter `k`. Suppose further that the support of `p()` is ℕ and the current state is `x0`.

The first step is to set up the environment:

```julia
using Random, Walker2014Sampling
rng = MersenneTwister(1)
```

Then, we create a sampler `s` using `Walker2014Sampler()`:

```julia
s = Walker2014Sampler(k);
``` 

Finally, we draw the next state using `rand()`:

```julia
x1 = rand(rng, s, p, x0);
``` 

Be aware that both `rng` and `s` are modified in the process. 

## References

Walker, S. G. (2014). Sampling unnormalized probabilities: An alternative to the Metropolis--Hastings algorithm. *SIAM Journal on Scientific Computing*, 36(2), A482–A494. https://doi.org/10.1137/130922549#
