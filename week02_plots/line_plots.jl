# =========================================
# 1. Basic line plot
# =========================================

# t → x-axis values
# y → random values on y-axis
t = 1:10
y = rand(10)

plot(t, y,
     xticks = 1:10,
     title = "Basic Line Plot",
     label = "random data")

# =========================================
# 2. Line plot of sin(t) with a coarse step
# =========================================

t = 0:10                      # very coarse sampling
y = sin.(t)                   # element-wise sine

plot(t, y,
     xticks = 0:10,
     title = "Sinus with coarse sampling",
     label = "sin(t)")

# Explanation:
# The curve looks jagged because plot() connects only
# the given points with straight lines.


# =========================================
# 3. Smooth plot of sin(t) with fine sampling
#    + customizing plot attributes
# =========================================

t = 0:0.01:10                # fine sampling → 1001 points
y = sin.(t)

plot(t, y,
     title = "Smooth sin(t)",
     label = "sin(t)",
     lw = 3,
     color = :red,
     xticks = 0:1:10)

xlabel!("x-axis")
ylabel!("y-axis")


# =========================================
# 4. Plotting two signals on the same axes
#    (plot! appends to an existing figure)
# =========================================

t1 = 0:0.01:10
t2 = 0:0.01:15

y1 = sin.(t1)
y2 = cos.(t2)

plot(t1, y1,
     title = "Two Signals on the Same Plot",
     label = "sin(t)",
     xticks = 0:1:10)

plot!(t2, y2,
      label = "cos(t)",
      xticks = 0:1:15)

xlabel!("t")
ylabel!("y")


# =========================================
# 5. Piecewise-defined signals
#    Using line equations + logical masks
# =========================================

# Signal defined by two line segments:
#   [0, 1) → y = 5t
#   [1, 2] → y = -5t + 10

t = 0:0.1:2

# First line active only for t < 1
y1 = 5 .* t .* (t .< 1)

# Second line active only for 1 ≤ t ≤ 2
y2 = (-5 .* t .+ 10) .* ((t .>= 1) .& (t .<= 2))

y = y1 + y2

plot(t, y,
     title = "Piecewise Linear Signal",
     label = "triangle",
     lw = 3)

xlabel!("t")
ylabel!("y")