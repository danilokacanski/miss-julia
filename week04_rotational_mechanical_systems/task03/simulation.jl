using DifferentialEquations, Plots, LinearAlgebra
include("model.jl")

# --------------------------------------------
# Simulation parameters
# --------------------------------------------
x0 = [-1.0, 0.0, 0.0]
tspan = (0.0, 100.0)

# params: m, c1, c2, k1, k2, g
p = (10.0, 10.0, 10.0, 15.0, 10.0, 9.81)

prob = ODEProblem(sistem!, x0, tspan, p)
sol = solve(prob)

# --------------------------------------------
# (d) Plot v(t) for t ≤ 20
# --------------------------------------------
v = [x[2] for x in sol.u]

idx = sol.t .<= 20
plot(sol.t[idx], v[idx], lw=2, label="v(t)",
     xlabel="t", ylabel="v(t)", title="Velocity response")

# --------------------------------------------
# (e) Plot x1(t) and x2(t)
# --------------------------------------------
x1 = [x[1] for x in sol.u]
x2 = [x[3] for x in sol.u]

plot(sol.t, [x1, x2], lw=2,
     label=["x₁(t)" "x₂(t)"],
     legend=:bottomright, yticks=-1:6,
     xlabel="t", ylabel="position",
     title="Displacements x₁(t) and x₂(t)")