###############################################################
#  Solutions for All Tasks (1–6)
#  Linear Systems, Determinant, Rank, Least Squares, etc.
###############################################################

using LinearAlgebra, Plots

println("\n==================== TASK 1 ====================\n")
# Task 1:
# Matrix:
A1 = [
    1 2 3;
    4 5 6;
    7 8 10
]

println("Matrix A1 =\n", A1)

# a) Transpose and Hermitian
println("\nA1ᵀ =\n", transpose(A1))
println("\nA1* =\n", A1')

# b) Rank
println("\nrank(A1) = ", rank(A1))

# c) Determinant
println("det(A1) = ", det(A1))

# d) Eigenvalues
println("Eigenvalues(A1) = ", eigvals(A1))


println("\n==================== TASK 2 ====================\n")
# Task 2:
A2 = [
    2 -1;
    5  3
]

b2 = [1, 14]

println("A2 =\n", A2)
println("b2 =", b2)

# a) Solve system
x2 = A2 \ b2
println("\nx = ", x2)

# b) Residual vector
r2 = A2 * x2 - b2
println("Residual r = ", r2)

# c) Norm of residual
println("‖r‖₂ = ", norm(r2))


println("\n==================== TASK 3 ====================\n")
# Task 3:
A3 = [
    1 1;
    1 2;
    1 3
]

b3 = [1, 2, 2.1]

println("A3 =\n", A3)
println("b3 =", b3)

println("\nSystem has m > n → overdetermined → LS solution expected.")

x3 = A3 \ b3
println("\nLeast-squares solution x = ", x3)

# residual
r3 = A3 * x3 - b3
println("Residual r = ", r3)
println("‖r‖₂ = ", norm(r3))


println("\n==================== TASK 4 ====================\n")
# Task 4:
A4 = [
    1 2 3;
    2 4 6;
    1 1 1
]

println("A4 =\n", A4)

# a) Rank
rA4 = rank(A4)
println("\nrank(A4) = ", rA4)

# b) Singular?
println("det(A4) = ", det(A4), " → matrix is singular")

# c) Implication
println("\nSince rank < n, system Ax=b does NOT have a unique solution.")


println("\n==================== TASK 5 ====================\n")
# Task 5: Least Squares with noisy linear data

t5 = 0:9
ε = 0.2 .* randn(length(t5))
y5 = 3 .* t5 .+ 5 .+ ε

A5 = [t5 ones(length(t5))]

x5 = A5 \ y5
a5, b5 = x5

println("LS coefficients: a = $a5, b = $b5")

# residuals
r5 = A5 * x5 - y5
println("\nResidual vector r = ", r5)
println("‖r‖₂ = ", norm(r5))

# plot (optional)
t_fine = 0:0.01:9
y_fit5 = a5 .* t_fine .+ b5

p1 = scatter(t5, y5, label="Measurements", legend=:topleft)
plot!(p1, t_fine, y_fit5, lw=3, label="LS fit", xlabel="t", ylabel="y")

p2 = bar(r5, label="Residuals", xlabel="Index", ylabel="Error")

plot(p1, p2, layout=(2,1), size=(750,600))


println("\n==================== TASK 6 ====================\n")
# Task 6: Underdetermined system (minimal-norm solution)

A6 = [1 2 3]
b6 = [10]

println("A6 =", A6)
println("b6 =", b6)

# minimal norm solution
x6 = A6 \ b6

println("\nMinimal-norm solution x = ", x6)
println("‖x‖₂ = ", norm(x6))

println("\nJulia returns the solution with the smallest Euclidean norm because the system is underdetermined (m < n).")

println("\n============== END OF ALL SOLUTIONS ==============\n")