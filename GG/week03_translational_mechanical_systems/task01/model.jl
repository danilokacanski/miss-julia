using LinearAlgebra

# Mass–spring–damper system
# x[1] = position
# x[2] = velocity
# p = (m, c1, c2, k)
function system!(dx, x, p, t)
    m, c1, c2, k = p
    f = sin(t)              # external force

    dx[1] = x[2]            # ẋ = v
    dx[2] = (f - k*x[1] - (c1 + c2)*x[2]) / m
end