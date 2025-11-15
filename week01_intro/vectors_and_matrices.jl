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