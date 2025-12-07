# ============================================
# simulation.jl  (Task 4)
# ============================================

using DifferentialEquations, Plots, LinearAlgebra
include("model.jl")

# --------------------------------------------
# Simulation parameters
# --------------------------------------------

tspan = (0.0, 20.0)

# initial conditions: x1, v1, x2, v2
x0 = [2.0, 0.0, 0.0, 0.0]

# parameters: m1, m2, c, k1, k2, k3, g
p = (5.0, 8.0, 10.0, 20.0, 20.0, 20.0, 9.81)

prob = ODEProblem(system!, x0, tspan, p)
sol = solve(prob)

# --------------------------------------------
# Extract velocities (not positions here!)
# --------------------------------------------

v1 = [x[2] for x in sol.u]
v2 = [x[4] for x in sol.u]

# Find peaks (max absolute velocity)
_, idx1 = findmax(abs.(v1))
_, idx2 = findmax(abs.(v2))

# --------------------------------------------
# Plot velocities
# --------------------------------------------

plot(sol.t, [v1 v2], lw=2, label=["v1(t)" "v2(t)"],
     xlabel="t", ylabel="velocity", xticks=0:2:20)

plot!([sol.t[idx1]], [v1[idx1]], markershape=:o, label="max_v1")
plot!([sol.t[idx2]], [v2[idx2]], markershape=:o, label="max_v2")


# --------------------------------------------
# Compute accelerations a1(t), a2(t) using numerical derivative
# --------------------------------------------

a1 = diff(v1) ./ diff(sol.t)
a2 = diff(v2) ./ diff(sol.t)

plot(sol.t[1:end-1], [a1 a2], lw=2, label=["a1(t)" "a2(t)"],
     xlabel="t", ylabel="acceleration")