# ============================================
# simulation.jl  (Rotational Mechanical Systems - Task 1)
# ============================================

using DifferentialEquations, Plots
include("model.jl")

# --------------------------------------------
# Simulation parameters
# --------------------------------------------

tspan = (0.0, 20.0)

# Initial conditions: theta, omega, z, z_dot
x0 = [0.0, 0.0, 2.0, 0.0]

# Parameters: m1, m2, c, k1, k2, R, g
p = (10.0, 5.0, 10.0, 15.0, 10.0, 1.0, 9.81)

prob = ODEProblem(system!, x0, tspan, p)
sol = solve(prob)

# --------------------------------------------
# Extract theta, omega and compute alpha
# --------------------------------------------

theta = [u[1] for u in sol.u]
omega = [u[2] for u in sol.u]
alpha = diff(omega) ./ diff(sol.t)

# --------------------------------------------
# Plot results
# --------------------------------------------

plot(sol.t, [theta omega], lw=2, label=["theta(t)" "omega(t)"],
     xlabel="t", ylabel="states")

plot!(sol.t[1:end-1], alpha, lw=2, label="alpha(t)")