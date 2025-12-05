# =========================================
# 9. Examples with solutions
# =========================================

# Base matrix A
A = [
    1   4  -2   9   6;
   -1   0   0   3   7;
   99   3  -3   4   7;
    5  -6   0  -8   3;
    1   2   3   4   5
]


# -----------------------------------------
# Example 1 – linear indexing
# Select element 99 using 1D indexing
p1 = A[3]
println("Example 1: ", p1)


# -----------------------------------------
# Example 2 – 2D indexing
# Select element 99 using row/column indexing
p2 = A[3, 1]
println("Example 2: ", p2)


# -----------------------------------------
# Example 3 – logical indexing
# Select element 99 using Boolean mask
M = [
    0 0 0 0 0;
    0 0 0 0 0;
    1 0 0 0 0;
    0 0 0 0 0;
    0 0 0 0 0
]

M_bool = convert.(Bool, M)
p3 = A[M_bool]
println("Example 3: ", p3)


# -----------------------------------------
# Example 4 – select first row
row1 = A[1, :]
println("Example 4: ", row1)


# -----------------------------------------
# Example 5 – select last column
last_col = A[:, end]
println("Example 5: ", last_col)


# -----------------------------------------
# Example 6 – select all odd-numbered rows
odd_rows = A[1:2:end, :]
println("Example 6:\n", odd_rows)


# -----------------------------------------
# Example 7 – select all positive elements
positives = A[A .> 0]
println("Example 7: ", positives)


# -----------------------------------------
# Example 8 – elements in interval [-5, 5)
range_elems = A[(A .>= -5) .& (A .< 5)]
println("Example 8: ", range_elems)


# -----------------------------------------
# Example 9 – maximum element of A
max_el = maximum(A)
println("Example 9: ", max_el)


# -----------------------------------------
# Example 10 – extract anti-diagonal ("sporedna dijagonala")
using LinearAlgebra
A_rev = reverse(A, dims = 2)    # reverse columns → flips left/right
anti_diag = diag(A_rev)
println("Example 10: ", anti_diag)

# -----------------------------------------
# Example 11 – select all even elements
evens = A[rem.(A, 2) .== 0]
println("Example 11: ", evens)


# -----------------------------------------
# Example 12 – find row(s) with maximal row sum
row_sums = sum(A, dims = 2)          # column of row sums
max_sum = maximum(row_sums)
rows_with_max = findall(row_sums .== max_sum)

println("Example 12:")
println("Row sums = ", row_sums)
println("Max sum = ", max_sum)
println("Rows with max sum = ", rows_with_max)