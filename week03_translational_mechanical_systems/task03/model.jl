# ============================================
# model.jl  (Task 3)
# ============================================

using LinearAlgebra

# Periodic excitation function
function excitation(t)
    tp = rem.(t, 5)
    y = (4 * tp) .* (tp .< 1) + 4 .* ((tp .>= 1) .& (tp .< 2)) +
    (-2 * tp .+ 8) .* ((tp .>= 2) .& (tp .< 3)) + 2 .* ((tp .>= 3) .& (tp .< 4)) +
    (-2 * tp .+ 10) .* (tp .>= 4)
end

# ODE system model
function system!(dx, x, p, t)
    m1, m2, c1, c2, c3, k1, k2 = p
    f = excitation(t)
    dx[1] = x[2]
    dx[2] = 1 / m1 * (f + c1 * (x[4] - x[2]) - k1 * x[1])
    dx[3] = x[4]
    dx[4] = - 1 / m2 * (c1 * (x[4] - x[2]) + (c2 + c3) * x[4] + k2 * x[3])
end