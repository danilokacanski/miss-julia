using LinearAlgebra

function sistem!(dx, x, p, t)
    m, c1, c2, k1, k2, g = p

    f = sin(t)

    dx[1] = x[2]
    dx[2] = (1 / m) * (m * g - k1 * x[1] - k2 * (x[1] - x[3]) - c1 * x[2])
    dx[3] = (k2 * (x[1] - x[3]) - 3 * f) / (9 * c2)
end