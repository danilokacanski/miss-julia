# ============================================
# model.jl  (Task 4)
# ============================================

using LinearAlgebra

# ODE system model for two masses with gravity + springs + damper
function system!(dx, x, p, t)
    m1, m2, c, k1, k2, k3, g = p

    dx[1] = x[2]
    dx[2] = (m1 * g + k2 * x[3] - (k1 + k2) * x[1]) / m1

    dx[3] = x[4]
    dx[4] = (k2 * x[1] - m2 * g - c * x[4] - (k2 + k3) * x[3]) / m2
end