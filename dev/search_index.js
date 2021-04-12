var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Walker2014Sampling","category":"page"},{"location":"#Walker2014Sampling","page":"Home","title":"Walker2014Sampling","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for Walker2014Sampling.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Walker2014Sampling]","category":"page"},{"location":"#Walker2014Sampling.Walker2014Sampler","page":"Home","title":"Walker2014Sampling.Walker2014Sampler","text":"Walker2014Sampler(k::Int, p::Vector{Float64})\n\nThe transition pmf proposed by Walker (2014), with parameter k and target  pmf π(⋅), represented by a (2k - 1) dimensional vector p such that  p[j] ∝ π(x - k + j), where x is the current value in the MC.\n\n\n\n\n\n","category":"type"},{"location":"#Base.rand-Tuple{Random.AbstractRNG, Walker2014Sampler, Function, Int64}","page":"Home","title":"Base.rand","text":"rand(rng::AbstractRNG, s::Walker2014Sampler, p::Function, x::Int)\n\nDraw the next value of a MCMC with target distribution p and current value  x, using the algorithm proposed by Walker (2014), represented by s.\n\n\n\n\n\n","category":"method"}]
}
