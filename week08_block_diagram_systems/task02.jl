using DifferentialEquations
using Plots

# ============================================================
# Task 02: System described by a block diagram (4 states)
#
# States:
#   x = [x1, x2, x3, x4]
#
# Signals from block diagram:
#   e(t) = u(t) - 2*x4
#   q(t) = v(t) + x1
#
# Dynamics:
#   x1' = e - 2*x1
#   x2' = x3
#   x3' = 3*q - x2
#   x4' = 4*x2 - x4
#
# Input u(t): periodic piecewise signal with period 5
# Input v(t): step that activates at t >= 3
# ============================================================

# ------------------------------------------------------------
# Input u(t): periodic piecewise signal (period = 5)
# ------------------------------------------------------------
function u(t)
    tp = rem(t, 5)

    # Piecewise definition:
    # 0 <= tp < 1 : 5*tp
    # 1 <= tp < 4 : 5
    # 4 <= tp < 5 : -5*tp + 25
    if tp < 1
        return 5 * tp
    elseif tp < 4
        return 5.0
    else
        return -5 * tp + 25
    end
end

# ------------------------------------------------------------
# System model
# p is a function v(t)
# ------------------------------------------------------------
function system!(dx, x, p, t)
    v = p                 # v is a function: v(t)
    e = u(t) - 2*x[4]
    q = v(t) + x[1]

    dx[1] = e - 2*x[1]
    dx[2] = x[3]
    dx[3] = 3*q - x[2]
    dx[4] = 4*x[2] - x[4]
end

# ------------------------------------------------------------
# Simulation setup
# ------------------------------------------------------------
tspan = (0.0, 10.0)
x0 = [0.0, 2.0, 1.0, 0.0]

# Step input v(t): 0 for t < 3, 1 for t >= 3
v_step = t -> (t >= 3.0 ? 1.0 : 0.0)

prob = ODEProblem(system!, x0, tspan, v_step)
sol = solve(prob)
    
# ------------------------------------------------------------
# Output y(t) = x4(t)
# ------------------------------------------------------------
y = [xi[4] for xi in sol.u]

plot(sol.t, y, lw=2, label="output y(t) = x4(t)", xlabel="t [s]", ylabel="y(t)")