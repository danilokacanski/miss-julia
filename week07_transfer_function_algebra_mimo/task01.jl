# ============================================================
# week07_transfer_function_algebra_mimo
# file: mimo_intro_simulation.jl
#
# MIMO idea (2 inputs -> 1 output):
#   y(t) = W11(s)*u1(t) + W12(s)*u2(t)
# ============================================================

using ControlSystems
using Plots

# ------------------------------------------------------------
# Build W11 and W12 transfer functions
# ------------------------------------------------------------
function system_mimo()
    G1 = tf(10, [1, 10])
    G2 = tf([5, 2], [1, 2, 1, 0])
    G3 = tf(5)
    G4 = tf([1, 0.1], [1, 0.05])

    # W11 -> path from U1 to Y
    G34  = minreal(series(G3, G4))
    G234 = minreal(feedback(G2, G34))
    W11  = minreal(parallel(-G1, G234))

    # W12 -> path from U2 to Y
    G24 = minreal(series(-G2, G4))
    W12 = minreal(feedback(G24, -G3))

    return W11, W12
end

# ------------------------------------------------------------
# Simulation
# ------------------------------------------------------------
t = 0:0.01:5
u1 = sin.(t)
u2 = cos.(t)

W11, W12 = system_mimo()

# lsim expects signal as 1×N for SISO, so use u'
y1, _, _ = lsim(W11, u1', t)
y2, _, _ = lsim(W12, u2', t)

# total output
y = y1 .+ y2

# y from lsim is 1×N, so plot y' to get N-vector
plot(t, [y' u1 u2],
     label=["y(t)" "u1(t)" "u2(t)"],
     xlabel="t [s]",
     lw=2)