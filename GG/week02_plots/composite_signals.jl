using Plots

# =========================================
# 1. Composite signal using min()
# =========================================
# A composite signal is formed by combining simpler components.
# Here the components are:
#
#   y1(t) = |sin( (π/3) * t )|
#   y2(t) = 0.75      (constant upper bound)
#
# The final signal takes the minimum value at each point:
#
#       y(t) = min( y1(t), 0.75 )
#
# This "clips" the sine envelope from above.

t = 0:0.1:6

ys = abs.(sin.(π/3 .* t))   # first component
y  = min.(ys, 0.75)         # clipped composite signal

# Plot components
scatter(t, ys,
        markershape = :o,
        markerstrokecolor = :green,
        color = :yellow,
        label = "abs(sin)")

plot!(t, y,
      lw = 2,
      color = :blue,
      xlabel = "t",
      ylabel = "|sin|",
      label = "composite")


# =========================================
# 2. Composite signal with a line: p = (1/6)t
# =========================================
# Components:
#   ys(t) = |sin( (π/3) * t )|
#   p(t)  = (1/6)t
#
# Final signal: y(t) = min(ys(t), p(t))

t = 0:0.1:6

ys = abs.(sin.(π/3 .* t))
p  = (1/6) .* t
y  = min.(ys, p)

scatter(t, ys,
        markershape = :o,
        markerstrokecolor = :green,
        color = :yellow,
        label = "ys")

plot!(t, y,
      lw = 2,
      xlabel = "t",
      ylabel = "|sin|",
      color = :blue,
      label = "composite")


# =========================================
# 3. Composite signal with a periodic ramp
# =========================================
# Components:
#   ys(t) = |sin( (π/3) * t )|
#
#   Periodic ramp:
#       tp = rem(t, 3)     → sawtooth time base (period = 3)
#       p(t) = (1/3) * tp
#
# Final signal: y(t) = min(ys(t), p(t))

t = 0:0.1:6

ys = abs.(sin.(π/3 .* t))
tp = rem.(t, 3)            # repeating period every 3 seconds
p  = (1/3) .* tp
y  = min.(ys, p)

scatter(t, ys,
        markershape = :o,
        markerstrokecolor = :green,
        color = :yellow,
        label = "ys")

plot!(t, y,
      lw = 2,
      xlabel = "t",
      ylabel = "|sin|",
      color = :blue,
      label = "composite")