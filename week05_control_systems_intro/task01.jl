using ControlSystems
using Plots

# ------------------------------------------------------------
# Find transfer function G(s) = U2(s)/U1(s) for the given circuit,
# then simulate the response for the first 10 seconds for:
#   a) u1(t) = step(t)
#   b) u1(t) = 10*abs(sin(t))
# Parameters: R = 0.1 kΩ, L = 22 mH, C = 470 nF
# ------------------------------------------------------------

# Build G(s) using impedances (impedance method)
function model_el_kola_tf(R, L, C)
    s = tf("s")

    ZR = R
    ZL = s * L
    ZC = 1 / (s * C)

    # Equivalent impedance of the branch: (ZC + ZR) || ZR
    # Zek = ((ZC + ZR) * ZR) / (ZC + 2*ZR)
    Zek = ((ZC + ZR) * ZR) / (ZC + 2*ZR)

    # Voltage divider: U2 / U1 = Zek / (ZL + Zek)
    G = Zek / (ZL + Zek)

    # Optional: cancel pole-zero pairs (cleaner TF)
    return minreal(G)
end

# Parameters
R = 100.0       # 0.1 kΩ = 100 Ω
L = 22e-3       # 22 mH
C = 470e-9      # 470 nF

G = model_el_kola_tf(R, L, C)
println("Transfer function G(s) = U2(s)/U1(s):")
display(G)

# Time vector (0 to 10 s)
t = 0:0.01:10

# ------------------------------------------------------------
# a) Step response: u1(t) = 1(t)
# ------------------------------------------------------------
y_step, t_step = step(G, t)

# ------------------------------------------------------------
# b) Response to u1(t) = 10*abs(sin(t))
# NOTE: abs(sin(.)) is always non-negative -> waveform looks like rectified sine
# ------------------------------------------------------------
u = 10 .* abs.(sin.(t))
y_sin, t_sin, _ = lsim(G, u', t)

# ------------------------------------------------------------
# Plot: compare both outputs U2(t)
# ------------------------------------------------------------
p1 = plot(t_step, y_step', lw=2, label="U2(t) for step input", xlabel="t [s]", ylabel="U2(t)")
p2 = plot(t_sin,  y_sin',  lw=2, label="U2(t) for 10*abs(sin(t))", xlabel="t [s]", ylabel="U2(t)")

plot(p1, p2, layout=(2, 1), size=(2000, 1000))