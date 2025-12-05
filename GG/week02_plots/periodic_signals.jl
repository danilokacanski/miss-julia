using Plots

# =========================================
# 1. Periodic signal using rem() (remainder)
# =========================================
# Idea:
#   Define one period using piecewise line equations.
#   Extend it to multiple periods by using:
#
#       tp = rem.(t, T)
#
#   where T is the period length.
#   Example period: T = 2 seconds.
#   Signal definition for one period:
#
#       [0,1) →  y = 5t
#       [1,2] → y = -5t + 10
#
#   This creates a triangle waveform.

# -----------------------------------------
# Example 1: periodic signal for t ∈ [0, 4]
# -----------------------------------------

t = 0:0.1:4         # signal duration (4 seconds)
T = 2               # period length

tp = rem.(t, T)     # periodic time base

# Piecewise definition of one period
y = 5 .* tp .* (tp .< 1) .+
    (-5 .* tp .+ 10) .* ((tp .>= 1) .& (tp .<= 2))

plot(t, y,
     title = "Periodic Signal – Example 1",
     label = "triangle",
     lw = 3)

xlabel!("t")
ylabel!("y")


# =========================================
# 2. Explanation: how rem() creates periodicity
# =========================================
# For teaching:
#   Choose several points from t and show their tp values.
#
#   Example:
#     t = [0, 0.5, 1, 1.5, 2, 2.5]
#     rem.(t, 2) = [0, 0.5, 1, 1.5, 0, 0.5]
#
#   This confirms that tp repeats every period.


# =========================================
# 3. Longer periodic signal: t ∈ [0, 10]
# =========================================

t = 0:0.1:10
tp = rem.(t, T)

y = 5 .* tp .* (tp .< 1) .+
    (-5 .* tp .+ 10) .* ((tp .>= 1) .& (tp .<= 2))

plot(t, y,
     title = "Periodic Signal – Example 2",
     xticks = 0:1:10,
     lw = 3,
     label = "triangle")

xlabel!("t")
ylabel!("y")