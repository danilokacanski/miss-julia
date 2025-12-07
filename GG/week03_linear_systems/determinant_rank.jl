# Determinant and Rank
using LinearAlgebra

println("\n=== Determinant and Rank ===\n")

A1 = [1 2; 3 4]
A2 = [1 2; 2 4]

println("det(A1) = ", det(A1))
println("det(A2) = ", det(A2))

B1 = [1 2 3;
      4 5 6;
      7 8 10]

B2 = [1 2 3;
      2 4 6;
      3 6 9]

println("\nrank(B1) = ", rank(B1))
println("rank(B2) = ", rank(B2))