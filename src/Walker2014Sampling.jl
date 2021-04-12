module Walker2014Sampling

import Base:
    rand

using Random:
    AbstractRNG

export 
    rand,
    Walker2014Sampler

"""
    Walker2014Sampler(k::Int, p::Vector{Float64})

The transition pmf proposed by Walker (2014), with parameter `k` and target 
pmf π(⋅), represented by a `(2k - 1)` dimensional vector `p` such that 
`p[j] ∝ π(x - k + j)`, where `x` is the current value in the MC.
"""
struct Walker2014Sampler
    k::Int
    p::Vector{Float64}
    q::Vector{Float64} # internal parameter
    r::Vector{Float64} # internal parameter
end

function Walker2014Sampler(k::Int)
    Walker2014Sampler(k, zeros(2k - 1), zeros(k), zeros(2k - 1))
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

function get_r!(r, q, p)
    k = length(q)
    for j = 1:(2k - 1)
        r[j] = 0.0
        for l in max(1, 1 + j - k):min(j, k)
            r[j] += q[l]
        end
    end
    @inbounds for j in 1:(2k - 1)
        r[j] = iszero(p[j]) ? 0.0 : p[j] * r[j]
    end
    sumr = sum(r)
    r ./= sumr
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
    rand(rng::AbstractRNG, s::Walker2014Sampler, p::Function, x::Int)

Draw the next value of a MCMC with target distribution `p` and current value 
`x`, using the algorithm proposed by Walker (2014), represented by `s`.
"""
function rand(rng::AbstractRNG, s::Walker2014Sampler, p::Function, x::Int)
    lmin = max(1 + s.k - x, 1)
    for l = 1:(lmin - 1)
        p[l] = 0.0
    end
    for l = lmin:(2 * s.k - 1)
        j = x - s.k + l
        s.p[l] = p(j)
    end
    get_q!(s.q, s.p)
    get_r!(s.r, s.q, s.p)
    return x += rcat(rng, s.r) - s.k
end

end # module 
