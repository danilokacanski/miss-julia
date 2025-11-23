# ============================================
# model.jl  (Rotational Mechanical System - Task 2)
# ============================================

using LinearAlgebra

# --------------------------------------------------------
# Periodic input signal
# --------------------------------------------------------
function input_signal(t)
    tp = rem.(t, 3)
    y = (-1//3 * t .+ 5) .* (tp .< 2)
    return y
end

# --------------------------------------------------------
# Rotational mechanical system model
# --------------------------------------------------------
function system!(dx, x, p, t)
    m1, m2, c, k1, k2, R, g = p

    J = 1//2 * m1 * R^2     # rotational inertia
    f = input_signal(t)

    θ  = x[1]               # angular displacement
    ω  = x[2]               # angular velocity
    x2 = x[3]               # linear displacement
    v  = x[4]               # linear velocity

    dx[1] = ω
    dx[2] = (-1 / J) * (k2 * (x2 + R*θ) * R + c * R^2 * ω)
    dx[3] = v
    dx[4] = (1 / m2) * (m2 * g - f - k1 * x2 - k2 * (x2 + R*θ))
end