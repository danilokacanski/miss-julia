# Least Squares Method
using LinearAlgebra, Plots

println("\n=== Least Squares Fitting ===\n")

t = [0, 1, 2, 3]
y = [1.0, 2.1, 3.0, 4.1]

A = [t  ones(length(t))]

x = A \ y
a, b = x

println("Coefficients: a = $a, b = $b")

# fine grid
t_fine = 0:0.01:3
y_fit = a .* t_fine .+ b

# residuals
r = A*x - y
println("Residuals = ", r)
println("‖r‖₂ = ", norm(r))

# plotting
p1 = scatter(t, y, label="data points", legend=:topleft)
plot!(p1, t_fine, y_fit, label="LS fit", lw=3)

p2 = bar(r, label="residuals")

plot(p1, p2, layout=(2,1), size=(700,600))