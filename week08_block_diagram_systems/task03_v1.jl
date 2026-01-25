using DifferentialEquations
using ControlSystems
using Plots

# ============================================================
# Task 03 (Method 1): Upper branch = nonlinear ODE
#                     Lower branch = LTI (transfer function)
#                     Output: z(t) = p(t) + k(t)
# ============================================================

# ------------------------------------------------------------
# Input signal u(t): piecewise (vectorized for arrays)
# ------------------------------------------------------------
function signal(t)
    # Works for scalar t OR array t (broadcasted)
    return t .* (t .< 2) .+
           2 .* ((t .>= 2) .& (t .< 6)) .+
           (-t .+ 8) .* (t .>= 6)
end

# ------------------------------------------------------------
# Upper branch: nonlinear ODE
# x = [x1; x2]
# x1' = x2
# x2' = 0.5*u + x1 - x1*x2
# ------------------------------------------------------------
function upper_branch!(dx, x, p, t)
    u = signal(t)          # scalar here
    dx[1] = x[2]
    dx[2] = 0.5*u + x[1] - x[1]*x[2]
end

# Solve upper branch ODE
tspan = (0.0, 8.0)
x0 = [-1.0, 0.5]
prob = ODEProblem(upper_branch!, x0, tspan)
sol = solve(prob)

# ------------------------------------------------------------
# Lower branch: transfer function with feedback
# ------------------------------------------------------------
function lower_branch()
    G = tf([1, 4], [1, 1, 2])
    H = tf(5, [5, 4])
    return minreal(feedback(G, H))   # negative feedback by default
end

# ------------------------------------------------------------
# Common time vector for simulation + interpolation
# ------------------------------------------------------------
t = 0:0.01:8

# Input u(t) on grid
u_sig = signal(t)

# ------------------------------------------------------------
# Interpolate ODE solution on the same time grid
# y(t) = x1(t) from the ODE solution
# ------------------------------------------------------------
y = [sol(ti)[1] for ti in t]   # x1(t) sampled at times in t

# ------------------------------------------------------------
# Nonlinear static block: p(y)
# p = 3                      if y < -3
# p = (-3/4)*y + 3/4         if -3 <= y < 1
# (for y >= 1, expression is NOT specified in your snippet;
#  here we keep the same second branch for y >= 1 as well,
#  to avoid undefined values)
# ------------------------------------------------------------
p = 3 .* (y .< -3) .+
    (-3/4 .* y .+ 3/4) .* ((y .>= -3) .& (y .< 1))

# ------------------------------------------------------------
# LTI response: k(t) = lsim(G, u(t))
# ------------------------------------------------------------
G = lower_branch()

yout, tout, xout = lsim(G, u_sig', t)     # u' makes it 1×N
k = vec(yout)                         # make it a 1D vector

# ------------------------------------------------------------
# Final output: z(t) = p(t) + k(t)
# ------------------------------------------------------------
z = p .+ k

plot(t, z, lw=2, label="z(t)", xticks=0:1:8, xlabel="t [s]")