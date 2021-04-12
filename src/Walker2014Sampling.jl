module Walker2014Sampling

import Base:
    rand

using Distributions: 
    Discrete, 
    Univariate, 
    Sampleable

using Random:
    AbstractRNG

export 
    rand,
    TransitionDistribution

"""
    Walker2014Sampler(k::Int, p::Vector{Float64})

The transition pmf proposed by Walker (2014), with parameter `k` and target 
pmf π(⋅), represented by a `(2k - 1)` dimensional vector `p` such that 
`p[j] ∝ π(x - k + j)`, where `x` is the current value in the MC.
"""
struct TransitionDistribution <: Sampleable{Univariate, Discrete}
    k::Int
    p::Vector{Float64}
    q::Vector{Float64} # internal parameter
    r::Vector{Float64} # internal parameter
end

function TransitionDistribution(k::Int, p::Vector{Float64})
    @assert length(p) == 2k - 1 "length(p) = $(length(p)) ≠ $k = k"
    TransitionDistribution(k, p, zeros(k), zeros(2k - 1))
end

function get_q!(q, p)
    k = length(q)
    for j = 1:k 
        q[j] = 0.0
        for l = j:(j + k - 1)
            q[j] += p[l]
        end
    end
    q .^= -1
    return nothing
end

function get_r!(r, q)
    k = length(q)
    for j = 1:(2k - 1)
        r[j] = 0.0
        for l in max(1, 1 + j - k):min(j, k)
            r[j] += q[l]
        end
    end
    return nothing
end

function rcat(rng, p)
    k = 0
    u = rand(rng)
    F = zero(eltype(p))
    while F < u
        k += 1
        F += p[k]
    end
    return k
end

"""
    rand(rng::AbstractRNG, s::Walker2014Sampler, x::Int)

Update the current value in the MC, `x`, using the transition kernel `s`.
Both `rng` and `s` are modified in the process.
"""
function rand(rng::AbstractRNG, s::TransitionDistribution, x::Int)
    # @. s.p = round(s.p, digits = 16)
    get_q!(s.q, s.p)
    get_r!(s.r, s.q)
    @inbounds for j in 1:(2s.k - 1)
        s.r[j] = iszero(s.p[j]) ? 0.0 : s.p[j] * s.r[j]
    end
    sumr = sum(s.r)
    s.r ./= sumr
    return x += rcat(rng, s.r) - s.k
end

end # module 
