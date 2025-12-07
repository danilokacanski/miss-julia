# Matrix Inversion
using LinearAlgebra

println("\n=== Matrix Inversion ===\n")

A = [1 2 3;
     0 1 4;
     2 0 1]

A_inv = inv(A)

println("A_inv =\n", A_inv)
println("\nCheck A * A_inv ≈ I → ", A * A_inv ≈ I)