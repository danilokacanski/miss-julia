# =========================================
# 8. Working with vectors and matrices
# =========================================

# -----------------------------
# 8.1 Creating vectors
# -----------------------------

v1 = [1, 2, 3, 4, 5]      # column vector (1D Vector)
v2 = [1 2 3 4 5]          # row vector (1x5 Matrix)

println(typeof(v1))       # Vector{Int64}
println(typeof(v2))       # Matrix{Int64}

# -----------------------------
# Creating ranges
# -----------------------------

o1 = 0:10                 # step = 1
o2 = 0:0.01:10            # step = 0.01

println(o1)
println(o2)

arr = collect(0:0.5:5)    # convert range to actual array
println(arr)


# -----------------------------
# Creating matrices
# -----------------------------

A = [1 2 3;
     4 5 6;
     7 8 9]
println(A)


# =========================================
# 8.2 Indexing vectors and matrices
# =========================================

# ------------- 1) Linear indexing (column-major order) -------------

A = [4 5 6;
     1 2 3;
     7 8 9]

println(A[6])    # linear index → element 8


# ------------- 2) Two-dimensional indexing -------------

println(A[3, 2])   # row 3, column 2 → 8


# ------------- 3) Logical indexing (Boolean mask) -------------

M = [0 0 0;
     0 0 0;
     0 1 0] .== 1       # boolean mask

println(A[M])          # selects element where mask == true (8)


# -----------------------------
# Indexing using vectors of indices
# -----------------------------
println(A)
println(A[[1, 3], 2])   # elements from rows 1 and 3, column 2

# =========================================
# 8.3 Functions for working with vectors and matrices
# =========================================

using LinearAlgebra        # needed for I, triu, tril
using Statistics           # needed for mean

# -----------------------------------------
# Creating special matrices
# -----------------------------------------

v_ones = ones(5)                 # vector of ones
m_ones = ones(3, 3)              # 3×3 matrix of ones

v_zeros = zeros(4)               # vector of zeros
m_zeros = zeros(3, 5)            # 3×5 matrix of zeros

m_rand = rand(3, 3)              # random values in [0, 1]

println(v_ones)
println(m_ones)
println(m_rand)


# -----------------------------------------
# Identity matrix (operator I)
# -----------------------------------------

m1 = I(5)                        # 5×5 identity matrix
m2 = I + zeros(5, 5)             # identity + zero matrix
m3 = Matrix{Bool}(I, 5, 5)       # Boolean identity matrix

println(m1)
println(m2)
println(m3)


# -----------------------------------------
# Upper and lower triangular matrices
# triu = upper triangle
# tril = lower triangle
# -----------------------------------------

M = [
    1  2  3  4;
    5  6  7  8;
    9 10 11 12;
   13 14 15 16
]

upper0 = triu(M)                 # main diagonal and above
upper1 = triu(M, 1)              # above main diagonal

lower_minus2 = tril(M, -2)       # two diagonals below main

println(upper0)
println(upper1)
println(lower_minus2)


# -----------------------------------------
# Reverse matrix elements
# dims = 1 → reverse rows
# dims = 2 → reverse columns
# -----------------------------------------

rev_rows = reverse(M, dims=1)
rev_cols = reverse(M, dims=2)

println(rev_rows)
println(rev_cols)


# -----------------------------------------
# Aggregate functions: minimum, maximum, sum, mean
# dims = 1 → compute per column
# dims = 2 → compute per row
# -----------------------------------------

M2 = [
    19 16  9 28;
     3 10 15  5;
    25 30 19 16;
     2 13 20 11
]

global_mean = mean(M2)           # average of all elements
max_cols = maximum(M2, dims=1)   # maxima per column
max_rows = maximum(M2, dims=2)   # maxima per row

println(global_mean)
println(max_cols)
println(max_rows)


# -----------------------------------------
# Applying scalar functions to matrices (dot operator)
# round is scalar → use round.( )
# -----------------------------------------

m_random = rand(5, 5) * 30
m_rounded = round.(m_random)     # round each element

println(m_rounded)