using ControlSystems
using Plots

# ============================================================
# Task 03: Positive feedback + Parallel feedback branch + Final positive unity feedback
# Given (as in the task statement):
#   1) G12  = feedback(G1, -G2)           -> POSITIVE feedback (because of -G2)
#   2) G56  = parallel(G5, G6)            -> parallel sum
#   3) G123 = series(G12, G3)             -> series connection
#   4) G12356 = feedback(G123, G56)       -> NEGATIVE feedback (default)
#   5) G123456 = series(G12356, G4)       -> series with G4
#   6) G = feedback(G123456, -1)          -> POSITIVE unity feedback
#
# Notes:
# - In ControlSystems.jl, feedback(P, Q) is negative feedback by default:
#       P / (1 + P*Q)
#   So using -Q gives positive feedback:
#       P / (1 - P*Q)
# - minreal(...) simplifies by canceling pole-zero pairs.
# ============================================================

# Define transfer functions (G5 and G6 were missing in your snippet, so we define them here)
G1 = tf(1, [1, 1])   # 1/(s+1)
G2 = tf(1, [1, 2])   # 1/(s+2)
G3 = tf(1, [1, 3])   # 1/(s+3)
G4 = tf(1, [1, 4])   # 1/(s+4)

G5 = tf(1, [1, 5])   # 1/(s+5)  (assumption: typical pattern for this task set)
G6 = tf(1, [1, 6])   # 1/(s+6)

# Build the block diagram step-by-step
G12      = minreal(feedback(G1, -G2))        # positive feedback: G1 / (1 - G1*G2)
G56      = minreal(parallel(G5, G6))         # G5 + G6
G123     = minreal(series(G12, G3))          # G12*G3
G12356   = minreal(feedback(G123, G56))      # negative feedback: G123 / (1 + G123*G56)
G123456  = minreal(series(G12356, G4))       # G12356*G4
G        = minreal(feedback(G123456, -1))    # positive unity feedback: G123456 / (1 - G123456)