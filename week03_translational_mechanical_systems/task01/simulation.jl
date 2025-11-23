using DifferentialEquations
using Plots

include("model.jl")   # load the system! function

# -----------------------------
# Simulation parameters
# -----------------------------
tspan = (0.0, 10.0)
x0 = [0.0, 0.0]                      # initial position and velocity
p = (10.0, 20.0, 20.0, 40.0)         # m, c1, c2, k

# -----------------------------
# Solve ODE
# -----------------------------
prob = ODEProblem(system!, x0, tspan, p)
sol = solve(prob)

# -----------------------------
# Plot results
# -----------------------------
plot(sol,
    label = ["x1(t)" "x2(t)"],
    lw = 2,
    xticks = 0:1:10,
    xlabel = "t",
    ylabel = "states"
)