# =========================================
# 9.2 More complex examples
# =========================================

using Statistics
using LinearAlgebra

# ---------------------------------------------------------
# Primer 1
# Function that returns:
#  - mean of last row
#  - positive elements from main diagonal
# ---------------------------------------------------------

function primer1(A)
    s = mean(A[end, :])        # mean of last row
    gd = diag(A)               # main diagonal
    v = gd[gd .> 0]            # keep positive elements
    return s, v
end

# Example call:
A = round.(20 * randn(10, 10))
sk, vek = primer1(A)
println("Primer 1 → mean last row = $sk, positive diag = $vek")


# ---------------------------------------------------------
# Primer 2
# Find maximum element of matrix and its position
# without using built-in functions
# ---------------------------------------------------------

function maksimalni(A)
    n, m = size(A)
    max_el = A[1, 1]
    vr = 1
    kc = 1

    for i in 1:n
        for j in 1:m
            if A[i, j] > max_el
                max_el = A[i, j]
                vr = i
                kc = j
            end
        end
    end

    return max_el, vr, kc
end

# Example call:
A = round.(20 * randn(5, 5))
max_el, vrsta, kolona = maksimalni(A)
println("Primer 2 → max = $max_el at ($vrsta, $kolona)")


# ---------------------------------------------------------
# Primer 3
# Cumulative sum of a vector (manual implementation)
# ---------------------------------------------------------

function cum_sum(v)
    ret = zeros(Int, length(v))   # output vector
    ret[1] = v[1]

    for i in 2:length(v)
        ret[i] = sum(v[1:i])
    end

    return ret
end

# Example call:
v = [1, 2, 3, 4, 5]
c = cum_sum(v)
println("Primer 3 → cumulative sum = $c")


# ---------------------------------------------------------
# Primer 4
# Table of people → find:
#  - person(s) with max weight
#  - average height + weight
# ---------------------------------------------------------

T = ["Ime" "Pol" "Starost" "Tezina" "Visina";
     "Ana" "z" 20 46 160;
     "Bojan" "m" 24 52 165;
     "Vlada" "m" 24 95 195;
     "Gordana" "z" 30 57 160;
     "Dejan" "m" 36 84 185;
     "Zoran" "m" 22 80 180]

# extract numeric part (skip header)
podaci = T[2:end, 3:end]    

maks_tezina = maximum(podaci[:, 2])     # max weight
poz = findall(podaci[:, 2] .== maks_tezina)

if length(poz) == 1
    # single person
    ime = T[poz[1][1] + 1, 1]
    println("Primer 4 → Osoba sa najvećom težinom: $ime ($maks_tezina kg)")
else
    # multiple people
    println("Primer 4 → Osobe sa težinom $maks_tezina kg:")
    for p in poz
        println(" - ", T[p[1] + 1, 1])
    end
end

prosecna_visina = mean(podaci[:, end])
prosecna_tezina = mean(podaci[:, end-1])

println("   Prosečna visina = $prosecna_visina cm")
println("   Prosečna težina = $prosecna_tezina kg")


# -----------------------------------------
# Primer 5
# Mean of elements above the anti-diagonal (secondary diagonal)
# ---------------------------------------------------------

function primer5(A)
    M = ones(size(A))          # mask of ones
    M = triu(M, 1)             # upper triangle above main diag
    M_rev = reverse(M, dims=2) # flip horizontally → aligns with anti-diagonal
    M_log = convert.(Bool, M_rev)

    el = A[M_log]              # select elements
    return mean(el)
end

# Example call:
K = [1 4 -2 9 6;
     -1 0 0 3 7;
     99 3 -3 4 7;
     5 -6 0 -8 3;
     1 2 3 4 5]

sred = primer5(K)
println("Primer 5 → mean above anti-diagonal = $sred")