############################################################
# 2.3 Time-domain analysis (behavior of the model)
# ControlSystems.jl
#
# Covered functions:
#   - step(sys, t)
#   - impulse(sys, t)
#   - lsim(sys, u, t; x0=...)
#
# Notes:
#   - If sys is given as a transfer function (tf), the library internally
#     uses a state-space realization to produce states x(t).
#   - y(t) is the output, x(t) are the internal states of that realization.
############################################################

using ControlSystems
using Plots

println("==============================================")
println("2.3 Time-domain analysis: step / impulse / lsim")
println("==============================================")

# Example model (same structure as in your text)
G = tf(38, [1, 5, 6])   # G(s) = 38 / (s^2 + 5s + 6)
println("\nModel G:")
println(G)

# Optional: also show its state-space realization (so students see states come from somewhere)
sys_ss = ss(G)
println("\nState-space realization used internally:")
println(sys_ss)

############################################################
# 1) STEP RESPONSE
############################################################
println("\n----------------------------------------------")
println("1) Step response: step(G, 5)")
println("----------------------------------------------")

# If the second argument is a scalar, it means "simulate up to this final time"
y_step, t_step, x_step = step(G, 5)

println("Sizes:")
println("  length(t_step) = $(length(t_step))")
println("  size(y_step)   = $(size(y_step))   (rows = time samples, cols = outputs)")
println("  size(x_step)   = $(size(x_step))   (rows = time samples, cols = states)")

# Plot output y(t)
p1 = plot(t_step, y_step', lw=2, xlabel="t [s]", ylabel="y(t)",
          title="Step response output", label="y(t)")

# Plot states x(t)  -> x_step is (N x nx), so transpose for one curve per state
p2 = plot(t_step, x_step', lw=2, xlabel="t [s]", ylabel="x(t)",
          title="Step response states", label=["x1(t)" "x2(t)"])

plot(p1, p2, layout=(2,1), size=(700,650))

############################################################
# 2) IMPULSE RESPONSE
############################################################
println("\n----------------------------------------------")
println("2) Impulse response: impulse(G, 5)")
println("----------------------------------------------")

y_imp, t_imp, x_imp = impulse(G, 5)

println("Sizes:")
println("  length(t_imp) = $(length(t_imp))")
println("  size(y_imp)   = $(size(y_imp))")
println("  size(x_imp)   = $(size(x_imp))")

p3 = plot(t_imp, y_imp', lw=2, xlabel="t [s]", ylabel="y(t)",
          title="Impulse response output", label="y(t)")

p4 = plot(t_imp, x_imp', lw=2, xlabel="t [s]", ylabel="x(t)",
          title="Impulse response states", label=["x1(t)" "x2(t)"])

plot(p3, p4, layout=(2,1), size=(700,650))

############################################################
# 3) RESPONSE TO A CUSTOM INPUT: lsim
############################################################
println("\n----------------------------------------------")
println("3) Custom input response: lsim(G, u, t)")
println("----------------------------------------------")

# Define the input signal u(t) = |sin(pi/3 * t)|
signal(t) = abs.(sin.(pi/3 .* t))

t = 0:0.01:12
u = signal(t)

# IMPORTANT:
# - For SISO systems, u should typically be a vector with the same length as t.
# - Some examples transpose u; here we keep it 1D (cleanest) -> u is Vector{Float64}.
y_lsim, t_lsim, x_lsim = lsim(G, u', t)

println("Sizes:")
println("  length(t_lsim) = $(length(t_lsim))")
println("  size(y_lsim)   = $(size(y_lsim))")
println("  size(x_lsim)   = $(size(x_lsim))")

# Plot states and input on same figure (two panels)
p5 = plot(t_lsim, x_lsim', lw=2, xlabel="t [s]", ylabel="x(t)",
          title="lsim: states", label=["x1(t)" "x2(t)"], xticks=0:12)

p6 = plot(t, u, lw=2, xlabel="t [s]", ylabel="u(t)",
          title="Input signal u(t) = |sin(pi/3 t)|", label="u(t)", xticks=0:12)

plot(p5, p6, layout=(2,1), size=(700,650))

############################################################
# 4) lsim with initial conditions (only meaningful for SS models)
############################################################
println("\n----------------------------------------------")
println("4) lsim with initial conditions x0 (SS model)")
println("----------------------------------------------")

# For transfer functions, you can still call lsim, but to teach x0 explicitly,
# it’s best to use the state-space model.
x0 = [0.5, -0.2]  # example initial state (dimension must match number of states)
y_ic, t_ic, x_ic = lsim(sys_ss, u', t; x0=x0)

p7 = plot(t_ic, x_ic', lw=2, xlabel="t [s]", ylabel="x(t)",
          title="lsim with initial conditions (states)", label=["x1(t)" "x2(t)"])

p8 = plot(t_ic, y_ic', lw=2, xlabel="t [s]", ylabel="y(t)",
          title="lsim with initial conditions (output)", label="y(t)")

plot(p7, p8, layout=(2,1), size=(700,650))

println("\nDone. You covered step(), impulse(), and lsim() with plots + dimensions.")