using Walker2014Sampling
using Random
using Test

##### Example 1

k = 3;
x = 5;
p = [
    0.0024919665723877, 
    3.559677803609295e-5, 
    5.4931160517927575e-33, 
    3.139159432776654e-36, 
    1.0484896565628862e-24
]
td = TransitionDistribution(k, p);
rng = MersenneTwister(0);
rand(rng, td, x)

@test sum(td.r) ≈ 1.0
@test td.q[1] ≈ (td.p[1] + td.p[2] + td.p[3])^(-1)
@test td.q[2] ≈ (td.p[2] + td.p[3] + td.p[4])^(-1)
@test td.q[3] ≈ (td.p[3] + td.p[4] + td.p[5])^(-1)
@test_throws AssertionError TransitionDistribution(2, ones(4))
