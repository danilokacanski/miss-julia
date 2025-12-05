# =========================================
# simulation.jl — Run simulation for Task 2
# =========================================

using DifferentialEquations
using Plots
include("model.jl")

# Time span
tspan = (0.0, 20.0)

# Initial conditions: x(0) = 0,  x'(0) = 0
x0 = [0.0, 0.0]

# Parameters: m, c, k, g
p = (5.0, 10.0, 20.0, 9.81)

# Define ODE problem
prob = ODEProblem(system!, x0, tspan, p)

# Solve system
sol = solve(prob)

# Plot solution
plot(sol, 
    label = ["x₁(t)" "x₂(t)"],
    lw = 2,
    xticks = 0:2:20,
    xlabel = "t",
    ylabel = "x(t)",
    title = "Task 2 — System Response"
)