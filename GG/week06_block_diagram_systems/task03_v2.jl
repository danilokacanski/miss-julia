using DifferentialEquations
using Plots

# ============================================================
# Task 03 (Method 2): Full block diagram as ONE augmented ODE
# States:
#   x1, x2  -> upper nonlinear branch states
#   x3, x4  -> lower branch (2nd order LTI part)
#   x5      -> additional 1st order dynamics
# Output:
#   y(t) = x1(t)
#   p(y) = static nonlinearity
#   k(t) = 4*x3 + x4
#   z(t) = p(t) + k(t)
# ============================================================

# ------------------------------------------------------------
# Input signal u(t): piecewise (works for scalar and vectors)
# ------------------------------------------------------------
function signal(t)
    return t .* (t .< 2) .+
           2 .* ((t .>= 2) .& (t .< 6)) .+
           (-t .+ 8) .* (t .>= 6)
end

# ------------------------------------------------------------
# Full augmented ODE model
# x = [x1, x2, x3, x4, x5]
# ------------------------------------------------------------
function sistem!(dx, x, p, t)
    u = signal(t)             # scalar input at time t

    # signals inside the block diagram
    e = u - x[5]
    k = 4*x[3] + x[4]

    # upper nonlinear branch
    dx[1] = x[2]
    dx[2] = 0.5*u + x[1] - x[1]*x[2]

    # lower branch dynamics (2nd order)
    dx[3] = x[4]
    dx[4] = e - 2*x[3] - x[4]

    # extra 1st-order block
    dx[5] = k - (4/5)*x[5]
end

# ------------------------------------------------------------
# Solve ODE
# ------------------------------------------------------------
tspan = (0.0, 8.0)
x0 = [-1.0, 0.5, 0.0, 0.0, 0.0]

prob = ODEProblem(sistem!, x0, tspan)
sol = solve(prob)

# ------------------------------------------------------------
# Sample on a uniform time grid (for plotting)
# ------------------------------------------------------------
t = 0:0.01:8
x_samp = sol.(t)   # vector of state vectors

y  = [xi[1] for xi in x_samp]   # y(t) = x1(t)
x3 = [xi[3] for xi in x_samp]
x4 = [xi[4] for xi in x_samp]

# Static nonlinearity p(y)
p_sig = 3 .* (y .< -3) .+
        (-3/4 .* y .+ 3/4) .* ((y .>= -3) .& (y .< 1))

# k(t) = 4*x3 + x4
k_sig = 4 .* x3 .+ x4

# final output z(t) = p(t) + k(t)
z = p_sig .+ k_sig

plot(t, z, lw=2, label="z(t)", xlabel="t [s]")