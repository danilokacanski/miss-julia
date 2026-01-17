using ControlSystems
using Plots

# ============================================================
# Task 02: Series + Inner Feedback + Outer Unity Feedback
# Given:
#   G2 and G3 in series         -> G23
#   feedback around G23 with G4 -> G234
#   then in series with G1      -> G1234
#   then unity negative feedback -> G
# Note:
#   minreal(...) is used to cancel pole-zero pairs and simplify the model.
# ============================================================

# Define transfer functions
G1 = tf(1, [1, 1])   # 1/(s+1)
G2 = tf(1, [1, 2])   # 1/(s+2)
G3 = tf(1, [1, 3])   # 1/(s+3)
G4 = tf(1, [1, 4])   # 1/(s+4)

# Build the block diagram step-by-step
G23    = minreal(series(G2, G3))        # G2*G3
G234   = minreal(feedback(G23, G4))     # negative feedback: G23 / (1 + G23*G4)
G1234  = minreal(series(G1, G234))      # G1*G234
G      = minreal(feedback(G1234, 1))    # unity negative feedback: G1234 / (1 + G1234)