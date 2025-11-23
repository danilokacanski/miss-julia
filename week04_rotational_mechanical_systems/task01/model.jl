# ============================================
# model.jl  (Rotational Mechanical Systems - Task 1)
# ============================================

using LinearAlgebra

# States:
# x[1] = theta  (angular position)
# x[2] = omega  (angular velocity)
# x[3] = z      (linear position of mass m2)
# x[4] = z_dot  (linear velocity of mass m2)
#
# Parameters:
# p = (m1, m2, c, k1, k2, R, g)
function system!(dx, x, p, t)
    m1, m2, c, k1, k2, R, g = p

    f = sin(t)                 # external force
    J = 0.5 * m1 * R^2         # inertia of disk

    dx[1] = x[2]
    dx[2] = (1 / J) * (k2 * (x[3] - R * x[1]) * R - k1 * x[1] - c * x[2])

    dx[3] = x[4]
    dx[4] = (1 / m2) * (f + m2 * g - k2 * (x[3] - R * x[1]))
end