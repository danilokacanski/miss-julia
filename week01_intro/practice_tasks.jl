# =========================================
# 9.3 Practice tasks
# =========================================

using LinearAlgebra

# ---------------------------------------------------------
# Zadatak 1
# Extract all even-numbered columns from a square matrix A
# ---------------------------------------------------------

function even_columns(A)
    return A[:, 2:2:end]
end

# ----- Test example -----

A = round.(10 * rand(4, 4))      # 4x4 matrix
println(A)
println("Zadatak 1 → even columns:")
println(even_columns(A))


# ---------------------------------------------------------
# Zadatak 2
# Extract all elements divisible by 9 from matrix A
# ---------------------------------------------------------

function divisible_by_9(A)
    mask = rem.(A, 9) .== 0   # logical mask
    return A[mask]
end

# ----- Test example -----
A = round.(20 * randn(6, 6))
println("\nZadatak 2 → elements divisible by 9:")
println(divisible_by_9(A))


# ---------------------------------------------------------
# Zadatak 3
# Extract elements at intersections of:
#   - even rows
#   - even columns
# ---------------------------------------------------------

function even_rowcol(A)
    er = 2:2:size(A, 1)    # even rows
    ec = 2:2:size(A, 2)    # even columns
    return A[er, ec]
end

# ----- Test example -----
A = reshape(1:36, 6, 6)
println(A)
println("\nZadatak 3 → elements at (even row, even column):")
println(even_rowcol(A))