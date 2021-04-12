using Walker2014Sampling
using Random
using Test

##### Example 1

k = 3;
x = 5;
p(x) = 1.0
s = Walker2014Sampler(k);
rng = MersenneTwister(0);
rand(rng, s, p, x)

@test sum(s.r) ≈ 1.0
@test s.q[1] ≈ (s.p[1] + s.p[2] + s.p[3])^(-1)
@test s.q[2] ≈ (s.p[2] + s.p[3] + s.p[4])^(-1)
@test s.q[3] ≈ (s.p[3] + s.p[4] + s.p[5])^(-1)

##### Example 2

k = 3;
x = 2;
p(x) = 1.0
s = Walker2014Sampler(k);
rng = MersenneTwister(0);
rand(rng, s, p, x)

@test sum(s.r) ≈ 1.0
@test s.q[1] ≈ (s.p[1] + s.p[2] + s.p[3])^(-1)
@test s.q[2] ≈ (s.p[2] + s.p[3] + s.p[4])^(-1)
@test s.q[3] ≈ (s.p[3] + s.p[4] + s.p[5])^(-1)

##### Example 3

k = 3;
x = 5;
p(x) = Float64(x >= 2)
s = Walker2014Sampler(k);
rng = MersenneTwister(0);
rand(rng, s, p, x)

@test sum(s.r) ≈ 1.0
@test s.q[1] ≈ (s.p[1] + s.p[2] + s.p[3])^(-1)
@test s.q[2] ≈ (s.p[2] + s.p[3] + s.p[4])^(-1)
@test s.q[3] ≈ (s.p[3] + s.p[4] + s.p[5])^(-1)
