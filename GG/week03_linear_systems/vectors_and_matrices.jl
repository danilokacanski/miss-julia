# Vectors and Matrices — Julia Examples
using LinearAlgebra

println("\n=== Vectors and Matrices ===\n")

A = [1 2 3;
     4 5 6;
     7 8 10]

b1 = [1, 2, 3]        # Vector (interpreted as column)
b2 = [1 2 3]          # Row matrix (1×3)
b3 = [1; 2; 3]        # Vector (same as b1)

println("Matrix A =\n", A)
println("\nb1 (vector) =", b1)
println("b2 (row matrix) =\n", b2)
println("b3 (vector) =", b3)

println("\nA * b1 = ", A * b1)