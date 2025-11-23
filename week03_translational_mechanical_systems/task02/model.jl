# =========================================
# model.jl — Mass–Spring–Damper system with gravity and cosine input
# =========================================

using LinearAlgebra

"""
    system!(dx, x, p, t)

Defines the dynamics of the mass–spring–damper system.

States:
    x[1] = position
    x[2] = velocity

Parameters:
    m  — mass
    c  — damping coefficient
    k  — spring constant
    g  — gravity
External force:
    f(t) = cos(t)
"""
function system!(dx, x, p, t)
    m, c, k, g = p
    f = cos(t)

    dx[1] = x[2]
    dx[2] = (f + m*g - k*x[1] - c*x[2]) / m
end