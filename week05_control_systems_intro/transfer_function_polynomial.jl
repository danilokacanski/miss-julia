using ControlSystems

# --------------------------------------------------
# Transfer function defined by numerator and denominator
# --------------------------------------------------

P = [38.9]              # numerator
Q = [1.0, 5.0, 6.0]     # denominator

println("Transfer function G(s):")
G = tf(P, Q)