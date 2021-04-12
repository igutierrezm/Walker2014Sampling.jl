using Walker2014Sampling
using Random
using Test

##### Example 1

k = 3;
x = 5;
p(x) = 1.0
td = Walker2014Sampler(k);
rng = MersenneTwister(0);
rand(rng, td, p, x)

@test sum(td.r) ≈ 1.0
@test td.q[1] ≈ (td.p[1] + td.p[2] + td.p[3])^(-1)
@test td.q[2] ≈ (td.p[2] + td.p[3] + td.p[4])^(-1)
@test td.q[3] ≈ (td.p[3] + td.p[4] + td.p[5])^(-1)
