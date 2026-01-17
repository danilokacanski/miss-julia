using ControlSystems
using Plots

# ============================================================
# Week 06 — Transfer Function Algebra (Intro)
# Block diagram reductions:
#   1) Series (cascade)
#   2) Parallel
#   3) Feedback (negative / positive)
# ============================================================

# Helper: pretty print basic info
function show_tf(name, G)
    println("\n--- $name ---")
    display(G)
    println("DC gain: ", dcgain(G))
end

# ------------------------------------------------------------
# 1) Series (cascade): G_eq(s) = G1(s) * G2(s)
# ------------------------------------------------------------
G1 = tf(1, [1, 1])      # 1 / (s + 1)
G2 = tf(1, [1, 2])      # 1 / (s + 2)

G_series = series(G1, G2)   # equivalent to G1*G2
show_tf("Series connection: series(G1, G2)", G_series)

# ------------------------------------------------------------
# 2) Parallel: G_eq(s) = ±G1(s) ± G2(s)
# In ControlSystems.jl: parallel(G1, G2) means G1 + G2
# For subtraction use: parallel(G1, -G2) or G1 - G2
# ------------------------------------------------------------
G_parallel_plus  = parallel(G1, G2)     # G1 + G2
G_parallel_minus = parallel(G1, -G2)    # G1 - G2

show_tf("Parallel (sum): parallel(G1, G2)", G_parallel_plus)
show_tf("Parallel (difference): parallel(G1, -G2)", G_parallel_minus)

# ------------------------------------------------------------
# 3) Feedback:
# Default: negative feedback
#   G_eq = G / (1 + G*H)
# Positive feedback:
#   G_eq = G / (1 - G*H)
#
# In ControlSystems.jl:
#   feedback(G, H)   -> negative feedback (default)
#   feedback(G, -H)  -> positive feedback
# ------------------------------------------------------------
G = tf(1, [1, 1])       # 1/(s+1)
H = tf(1, [1, 2])       # 1/(s+2)

G_fb_negative = feedback(G, H)     # negative feedback
G_fb_positive = feedback(G, -H)    # positive feedback

show_tf("Feedback (negative): feedback(G, H)", G_fb_negative)
show_tf("Feedback (positive): feedback(G, -H)", G_fb_positive)