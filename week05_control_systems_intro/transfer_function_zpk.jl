using ControlSystems

# --------------------------------------------------
# Transfer function defined by zeros, poles, and gain
# --------------------------------------------------

zeros_G = []           # no zeros
poles_G = [-2, -3]     # poles
gain_G  = 38.9

println("Transfer function in ZPK form:")
G = zpk(zeros_G, poles_G, gain_G)

using ControlSystems

# --------------------------------------------------
# Extract zeros, poles, and gain from a transfer function
# --------------------------------------------------

G = tf([1, 1], [1, 3, 2])   # (s + 1) / (s^2 + 3s + 2)

z, p, k = zpkdata(G)

println("Zeros:")
println(z)

println("Poles:")
println(p)

println("Gain:")
println(k)