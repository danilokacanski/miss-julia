# ============================================================
# Task 02: Parameterized MIMO transfer functions + simulation
# Goal:
#   Build W11(s) and W12(s) (2 inputs -> 1 output) depending on k1, k2
#   Simulate:
#       y(t) = W11(s)*u1(t) + W12(s)*u2(t)
#   for multiple (k1, k2) combinations and plot all outputs
# ============================================================

using ControlSystems
using Plots

# ------------------------------------------------------------
# Build transfer functions W11 and W12 for given k1, k2
# ------------------------------------------------------------
function system_mimo(k1, k2)
    G1 = tf(2, [0.2, 1])
    G2 = tf([1.2, 1], [1, 2, 0.1])
    G3 = tf(4, [1, 3, 2])
    G4 = tf(1, [0.1, 1])

    K1 = tf(k1)
    K2 = tf(k2)

    # -------------------------
    # W11 -> path from U1 to Y
    # -------------------------
    G12   = minreal(series(G1, G2))
    G32   = minreal(feedback(G3, K2))
    G324  = minreal(series(G32, G4))
    G3241 = minreal(series(K1, -G324))          # K1 * (-G324)
    Gp    = minreal(parallel(tf(1), -G3241))    # 1 - (K1 * (-G324)) = 1 + K1*G324 (algebra kept as in pdf)
    W11   = minreal(series(G12, Gp))

    # -------------------------
    # W12 -> path from U2 to Y
    # -------------------------
    G32 = minreal(feedback(G3, K2))     # (recomputed for clarity)
    W12 = minreal(series(G32, -G4))

    return W11, W12
end

# ------------------------------------------------------------
# Simulate for multiple k1 and k2 values
# Returns:
#   y_vals  -> Vector of vectors (each is y(t) for one (k1,k2))
#   labels  -> matching labels for legend
# ------------------------------------------------------------
function simulate_grid(k1_vals, k2_vals, u1, u2, t)
    y_vals = Vector{Vector{Float64}}()
    labels = String[]

    for k1 in k1_vals
        for k2 in k2_vals
            W11, W12 = system_mimo(k1, k2)

            y1, _, _ = lsim(W11, u1', t)   # 1×N
            y2, _, _ = lsim(W12, u2', t)   # 1×N

            y = y1 .+ y2                   # 1×N
            push!(y_vals, vec(y'))         # store as N-vector for plotting
            push!(labels, "k1=$(k1), k2=$(k2)")
        end
    end

    return y_vals, labels
end

# ------------------------------------------------------------
# Run example (same as in the material)
# ------------------------------------------------------------
t  = 0:0.01:10
u1 = sin.(t)
u2 = cos.(t)

k1_vals = [0.1, 0.3, 0.7]
k2_vals = [0.2, 0.5]

y_vals, labels = simulate_grid(k1_vals, k2_vals, u1, u2, t)

plot(t, y_vals,
     lw=2,
     xticks=0:2:10,
     xlabel="t [s]",
     ylabel="y(t)",
     legend=:right)