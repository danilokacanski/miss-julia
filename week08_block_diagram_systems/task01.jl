using DifferentialEquations
using Plots
using LinearAlgebra

# ============================================================
# Task 01: System described by a block diagram
#
# States:
#   x1, x2
#
# Output:
#   y(t) = x1 - 2*x2
#
# Reference signal:
#   r(t) = sin(2t)
#
# Control law (from block diagram):
#   u(t) = r(t) - 0.1 * y(t)^2
#
# State equations:
#   x1' = -0.1*x1 + 0.25*x2
#   x2' = -0.5*x1 + 0.75*u
# ============================================================

function system!(dx, x, p, t)
    # Output signal
    y = x[1] - 2*x[2]

    # Reference input
    r = sin(2*t)

    # Control input
    u = r - 0.1*(y^2)

    # State equations
    dx[1] = -0.1*x[1] + 0.25*x[2]
    dx[2] = -0.5*x[1] + 0.75*u
end

# ------------------------------------------------------------
# Simulation parameters
# ------------------------------------------------------------
tspan = (0.0, 5.0)
x0 = [0.5, -0.2]

# Define and solve ODE problem
prob = ODEProblem(system!, x0, tspan)
sol = solve(prob)

# ------------------------------------------------------------
# Extract states and signals
# ------------------------------------------------------------
x1 = [xi[1] for xi in sol.u]
x2 = [xi[2] for xi in sol.u]

y = x1 .- 2 .* x2
r = sin.(2 .* sol.t)

# ------------------------------------------------------------
# Plot results
# ------------------------------------------------------------
plot(sol.t, r, lw=2, label="r(t)")
plot!(sol.t, y, lw=2, label="y(t)", xlabel="t [s]", ylabel="Amplitude")