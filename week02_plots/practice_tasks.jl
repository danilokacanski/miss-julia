# =========================================
# Zadatak 1
# Periodic broken-line signal
# =========================================

t = 0:0.1:10
tp = rem.(t, 5)   # period = 5

y = 4 .* (tp .< 2) .* (tp ./ 2) .+
    2 .* ((tp .>= 2) .& (tp .< 4)) .+
    (tp .== 4) .* 0 .+
    (tp .>= 4) .* (-2 .* tp .+ 10)

plot(t, y, lw=2, label="y1", xlabel="t", ylabel="y")


# =========================================
# Zadatak 2
# Staircase signal compared to sin(t)
# =========================================

t = 0:0.01:2π
tp = rem.(t, 2)
sinus = sin.(t)

y = sinus .* (tp .< 1)

plot(t, sinus, color=:red, ls=:dash, label="sin(t)")
plot!(t, step, color=:blue, lw=2, label="y(t)", xlabel="t", ylabel="y")


# =========================================
# Zadatak 3
# Sawtooth + under-limit curve
# =========================================

t = 0:0.1:10
tp = rem.(t, 2)

base = tp
limit = 4 .- abs.(t .- 5)

plot(t, limit, color=:red, ls=:dash, label="y1")
plot!(t, base, lw=2, label="y", xlabel="t", ylabel="y")


# =========================================
# Zadatak 4
# Periodic flat-top waveform + scatter(sin)
# =========================================

t = 0:0.1:9
tp = rem.(t, 3)

y = 0 .* (tp .< 1) .+
    1 .* ((tp .>= 1) .& (tp .< 2)) .+
    0 .* (tp .>= 2)

# sin samples at integer points
ts = 0:1:9
ys = sin.(ts)

scatter(ts, ys, color=:blue, label="sin")
plot!(t, y, lw=2, color=:orangered, label="y", xlabel="t", ylabel="y")


# =========================================
# Zadatak 5
# Parabolas: x^2+1 and -x^2+1
# =========================================

t = -3:0.01:3

plot(t, t.^2 .+ 1, lw=2, label="x^2 + 1")
plot!(t, -t.^2 .+ 1, lw=2, label="-x^2 + 1", xlabel="t", ylabel="y")


# =========================================
# Zadatak 6
# Triangular periodic signal with amplitude 3
# =========================================

t = 0:0.1:15

tp = rem.(t, 3)      # period = 3 sec
y = 3 .* tp .* (tp .< 1.5) .+
    3 .* (3 .- tp) .* (tp .>= 1.5)

plot(t, y, lw=2, label="y1", xlabel="t", ylabel="y")


# =========================================
# Zadatak 7
# Upper semicircle of radius 1, center (1,0)
# =========================================

t = 0:0.01:2

y = sqrt.(1 .- (t .- 1).^2)
plot(t, y, lw=2, label="kružnica", xlabel="t", ylabel="y")


# =========================================
# Zadatak 8
# Combine semicircle + triangle, take minimum
# =========================================

t = 0:0.01:4
tp = rem.(t, 2)   # period = 2

# Semicircle radius 1, centered at (1,0)
circle = sqrt.(1 .- (tp .- 1).^2)

# Triangle from 0→2 amplitude 2
triangle = 2 .* abs.(tp .- 1)

# Composite = min(circle, triangle)
y = min.(circle, triangle)

plot(t, circle, ls=:dash, color=:blue, label="kružnica")
plot!(t, triangle, ls=:dash, color=:red, label="trougao")
plot!(t, y, lw=3, color=:green, label="y", xlabel="t", ylabel="y")