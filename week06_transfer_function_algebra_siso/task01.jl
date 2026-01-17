using ControlSystems
using Plots

# ============================================================
# Task 01: Parallel + Series + Feedback
# Given:
#   G1, G2 in parallel  -> G12
#   then in series with G3 -> G123
#   then feedback with H -> G
# ============================================================

# Define transfer functions
G1 = tf(1, [1, 1])   # 1/(s+1)
G2 = tf(1, [1, 2])   # 1/(s+2)
G3 = tf(1, [1, 3])   # 1/(s+3)
H  = tf(1, [1, 0])   # 1/s  (integrator)

# Build the block diagram step-by-step
G12  = parallel(G1, G2)     # G1 + G2
G123 = series(G12, G3)      # (G1+G2)*G3
G    = feedback(G123, H)    # negative feedback by default