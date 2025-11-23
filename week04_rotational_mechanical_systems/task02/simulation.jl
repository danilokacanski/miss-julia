# ============================================
# simulation.jl  (Rotational Mechanical System - Task 2)
# ============================================

using DifferentialEquations, Plots, LinearAlgebra
include("model.jl")

# --------------------------------------------------------
# Simulation parameters
# --------------------------------------------------------
tspan = (0.0, 15.0)

# initial conditions: θ, ω, x, v
x0 = [0.0, 0.0, 0.0, 0.0]

# parameters: m1, m2, c, k1, k2, R, g
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)

# --------------------------------------------------------
# Solve the ODE system
# --------------------------------------------------------
prob = ODEProblem(system!, x0, tspan, p)
sol = solve(prob)

# --------------------------------------------------------
# d) Total linear distance travelled by the second body
# --------------------------------------------------------
x_vec = [u[3] for u in sol.u]      # extract linear displacement
total_distance = sum(abs.(diff(x_vec)))

println("Total traveled distance of the mass: $total_distance")

# --------------------------------------------------------
# e) Plot θ(t) and ω(t)
# --------------------------------------------------------
θ = [u[1] for u in sol.u]
ω = [u[2] for u in sol.u]

plot(sol.t, [θ, ω], lw=2, label=["θ(t)" "ω(t)"], xlabel="t", ylabel="states")