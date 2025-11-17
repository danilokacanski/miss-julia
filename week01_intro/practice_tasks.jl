# =========================================
# 9.3 Practice tasks
# =========================================

using LinearAlgebra
using Statistics

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

# ---------------------------------------------------------
# Zadatak 4
# Sum elements A[i,j] where index sum (i+j) is even
# ---------------------------------------------------------

function sum_even_indexsum(A)
    m, n = size(A)
    s = 0
    for i in 1:m
        for j in 1:n
            if iseven(i + j)
                s += A[i, j]
            end
        end
    end
    return s
end

# ----- Test example -----
A = reshape(1:16, 4, 4)
println("\nZadatak 4 → sum of elements where (i+j) is even:")
println(sum_even_indexsum(A))


# ---------------------------------------------------------
# Zadatak 5
# For square matrix A:
#   - m: elements from main diagonal
#   - s: mean of elements above main diagonal
# ---------------------------------------------------------

function zadatak5(A)
    gd = diag(A)
    M = ones(size(A))
    upper = triu(M, 1) .== 1
    s = mean(A[upper])
    return gd, s
end

# ----- Test example -----
A = round.(10 * rand(5, 5))
println("\nZadatak 5 → diag elements + mean above main diag:")
println(zadatak5(A))


# ---------------------------------------------------------
# Zadatak 6
# For square matrices A and B:
#   - m: elements below main diag of A that are positive & divisible by 3
#   - s: mean of anti-diagonal of B greater than mean(diag(A))
# ---------------------------------------------------------

function zadatak6(A, B)
    n = size(A, 1)
    gdA = diag(A)
    meanA = mean(gdA)

    # mask for below main diagonal
    lower_mask = tril(ones(n, n), -1) .== 1
    candidates = A[lower_mask]
    m = candidates[(candidates .> 0) .& (rem.(candidates, 3) .== 0)]

    # anti-diagonal of B
    Brev = reverse(B, dims=2)
    sdB = diag(Brev)
    s = mean(sdB[sdB .> meanA])

    return m, s
end

# ----- Test example -----
A = round.(20 * randn(5, 5))
B = round.(20 * randn(5, 5))
println("\nZadatak 6 → elements below diag & mean of anti-diag:")
println(zadatak6(A, B))


# ---------------------------------------------------------
# Zadatak 7
# Work with table T (same as in complex examples)
# ---------------------------------------------------------

function zadatak7(T)
    podaci = T[2:end, :]   # without header

    # extract indices
    pol = podaci[:, 2]
    visine = Int.(podaci[:, 5])
    tezine = Int.(podaci[:, 4])
    starosti = Int.(podaci[:, 3])

    # female / male
    z_idx = findall(pol .== "z")
    m_idx = findall(pol .== "m")

    z_imena = podaci[z_idx, 1]
    m_imena = podaci[m_idx, 1]

    # averages
    avg_vis_z = mean(visine[z_idx])
    avg_tez_z = mean(tezine[z_idx])

    avg_vis_m = mean(visine[m_idx])
    avg_tez_m = mean(tezine[m_idx])

    # youngest / oldest
    max_age = maximum(starosti)
    min_age = minimum(starosti)

    najstariji = podaci[findall(starosti .== max_age), 1]
    najmladji = podaci[findall(starosti .== min_age), 1]

    # std dev of height
    std_vis = std(visine)

    return (
        z_imena,
        m_imena,
        avg_vis_z,
        avg_tez_z,
        avg_vis_m,
        avg_tez_m,
        najstariji,
        najmladji,
        std_vis
    )
end

# ----- Test example -----
T = ["Ime" "Pol" "Starost" "Tezina" "Visina";
     "Ana" "z" 20 46 160;
     "Bojan" "m" 24 52 165;
     "Vlada" "m" 24 95 195;
     "Gordana" "z" 30 57 160;
     "Dejan" "m" 36 84 185;
     "Zoran" "m" 22 80 180]

println("\nZadatak 7 → table statistics:")
println(zadatak7(T))


# ---------------------------------------------------------
# Zadatak 8
# Find positions of all non-zero elements WITHOUT findall
# ---------------------------------------------------------

function nonzero_positions(A)
    pos = []
    m, n = size(A)
    for i in 1:m
        for j in 1:n
            if A[i, j] != 0
                push!(pos, (i, j))   # tuple (row, col)
            end
        end
    end
    return pos
end

# ----- Test example -----
A = [0 5 0; 3 0 7; 0 0 2]
println("\nZadatak 8 → positions of non-zero elements:")
println(nonzero_positions(A))


# ---------------------------------------------------------
# Zadatak 9
# Custom product of all elements in a vector (like prod)
# ---------------------------------------------------------

function myprod(v)
    p = 1
    for el in v
        p *= el
    end
    return p
end

# ----- Test example -----
println("\nZadatak 9 → custom product:")
println(myprod([2, 3, 4]))   # → 24


# ---------------------------------------------------------
# Zadatak 10
# Custom sum for a matrix:
#   mode = :all      → sum all elements
#   mode = :rows     → sum per row
#   mode = :cols     → sum per column
# ---------------------------------------------------------

function mysum(A; mode=:all)
    if mode == :all
        return sum(A)
    elseif mode == :rows
        return sum(A, dims=2)
    elseif mode == :cols
        return sum(A, dims=1)
    else
        error("Invalid mode: use :all, :rows, or :cols")
    end
end

# ----- Test example -----
A = reshape(1:9, 3, 3)
println("\nZadatak 10 → custom sums:")
println("All: ", mysum(A))
println("Rows: ", mysum(A, mode=:rows))
println("Cols: ", mysum(A, mode=:cols))