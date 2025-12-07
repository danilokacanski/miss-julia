# ============================================
# simulation.jl  (Task 3)
# ============================================

using DifferentialEquations, Plots, LinearAlgebra
include("model.jl")

# --------------------------------------------
# Simulation parameters
# --------------------------------------------

tspan = (0.0, 10.0)
x0 = [0.0, 0.0, 0.0, 0.0]

# m1, m2, c1, c2, c3, k1, k2
p = (10.0, 15.0, 20.0, 20.0, 20.0, 40.0, 40.0)

# Create and solve the ODE problem
prob = ODEProblem(system!, x0, tspan, p)
sol = solve(prob)

# --------------------------------------------
# Extract positions of both bodies
# --------------------------------------------

pos1 = [x[1] for x in sol.u]
pos2 = [x[3] for x in sol.u]

# Find indices of maximum absolute displacement
_, i1 = findmax(abs.(pos1))
_, i2 = findmax(abs.(pos2))

# --------------------------------------------
# Plot motion of both bodies
# --------------------------------------------

plot(sol.t, pos1, lw=2, label="x1(t)", xticks=0:1:10)
plot!(sol.t, pos2, lw=2, label="x2(t)")

# Mark maximum displacement points
plot!([sol.t[i1]], [pos1[i1]], seriestype=:scatter,
      markershape=:o, color=:red, label="max x1")

plot!([sol.t[i2]], [pos2[i2]], seriestype=:scatter,
      markershape=:star5, color=:blue, label="max x2")

# --------------------------------------------
# Compute traveled distance using total variation
# --------------------------------------------

dist1 = sum(abs.(diff(pos1)))
dist2 = sum(abs.(diff(pos2)))

println("Travelled distance of body 1: $dist1")
println("Travelled distance of body 2: $dist2")