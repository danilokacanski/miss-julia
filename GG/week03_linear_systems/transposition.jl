# Transposition Examples
using LinearAlgebra

println("\n=== Transposition ===\n")

A = [1 2; 3 4]
B = [1+2im  3-im;
     2im    4-3im]

AT = transpose(A)
AH = A'

BT = transpose(B)
BH = B'

println("A =\n", A)
println("\ntranspose(A) =\n", AT)
println("conjugate transpose A' =\n", AH)

println("\nB =\n", B)
println("\ntranspose(B) =\n", BT)
println("conjugate transpose B' =\n", BH)