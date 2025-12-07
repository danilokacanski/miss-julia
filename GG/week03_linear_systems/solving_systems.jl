# Solving Linear Systems
using LinearAlgebra

println("\n=== Solving Linear Systems ===\n")

A = [3 2 -1;
     2 -2 4;
    -1 0.5 -1]

b = [1, -2, 0]

x = A \ b
println("Solution x = ", x)

println("Check A*x ≈ b → ", A*x ≈ b)
println("Residual r = ", A*x - b)
println("‖r‖₂ = ", norm(A*x - b))