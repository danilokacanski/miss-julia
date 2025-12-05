using Plots

# =========================================
# 1. Simple layout using matrix-of-random-values
# =========================================
# plot(rand(100, 4)) creates 4 signals (each column = one signal)
# layout=4 means "grid of 4 subplots" (2x2 by default)

plot(rand(100, 4),
     layout = 4,
     title = "Layout: 2x2 grid")


# =========================================
# 2. Vertical layout: 4 rows, 1 column
# =========================================

plot(rand(100, 4),
     layout = (4, 1),
     title = "Layout: 4x1 vertical stack")


# =========================================
# 3. Custom subplot placement using individual plots
# =========================================
# Step 1: generate data
t = 0:0.1:4π

y1 = sin.(t)
y2 = cos.(t)
y3 = tan.(t)
y4 = cot.(t)

# Step 2: create separate plot objects
p1 = plot(t, y1,
          label = "sin(t)",
          xticks = 0:π:4π)

p2 = plot(t, y2,
          label = "cos(t)",
          xticks = 0:π:4π)

p3 = plot(t, y3,
          label = "tan(t)",
          xticks = 0:π:4π)

p4 = plot(t, y4,
          label = "cot(t)",
          xticks = 0:π:4π)

# Step 3: combine all subplots in one figure
plot(p1, p2, p3, p4,
     layout = (4, 1),
     title = "Trigonometric Functions (4 stacked plots)")