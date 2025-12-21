############################################################
# Model Conversions in ControlSystems.jl
# Week 05 – Control Systems
#
# This file demonstrates:
#  - Creation of LTI models (tf, zpk, ss)
#  - Conversions between tf, zpk, and ss
#  - Equivalence of different model representations
############################################################

using ControlSystems

println("==============================================")
println("1) Transfer Function (TF) model")
println("==============================================")

# Define a transfer function using polynomial coefficients
G_tf = tf(1, [1, 2, 1])   # G(s) = 1 / (s^2 + 2s + 1)

println("Transfer function G_tf:")
println(G_tf)


println("\n==============================================")
println("2) TF → Zero-Pole-Gain (ZPK)")
println("==============================================")

# Convert TF to ZPK
G_zpk = zpk(G_tf)

println("Zero-Pole-Gain representation:")
println(G_zpk)


println("\n==============================================")
println("3) TF → State-Space (SS)")
println("==============================================")

# Convert TF to State Space
G_ss = ss(G_tf)

println("State-space representation:")
println(G_ss)


println("\n==============================================")
println("4) ZPK → Transfer Function")
println("==============================================")

# Convert ZPK back to TF
G_tf_from_zpk = tf(G_zpk)

println("Transfer function obtained from ZPK:")
println(G_tf_from_zpk)


println("\n==============================================")
println("5) ZPK → State-Space")
println("==============================================")

# Convert ZPK to State Space
G_ss_from_zpk = ss(G_zpk)

println("State-space obtained from ZPK:")
println(G_ss_from_zpk)


println("\n==============================================")
println("6) State-Space → Transfer Function")
println("==============================================")

# Convert SS back to TF
G_tf_from_ss = tf(G_ss)

println("Transfer function obtained from SS:")
println(G_tf_from_ss)


println("\n==============================================")
println("7) Manual ZPK definition")
println("==============================================")

# Define system explicitly using zeros, poles, and gain
zeros = []                 # no zeros
poles = [-1, -1]           # double pole at -1
gain  = 1.0

G_manual_zpk = zpk(zeros, poles, gain)

println("Manually defined ZPK model:")
println(G_manual_zpk)

println("\nEquivalent TF:")
println(tf(G_manual_zpk))


println("\n==============================================")
println("8) Key takeaway")
println("==============================================")

println("""
- tf, zpk, and ss describe the SAME LTI system
- Conversions do NOT change system behavior
- Only the mathematical representation changes
- ControlSystems.jl handles all conversions automatically
""")