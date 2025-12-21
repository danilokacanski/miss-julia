using ControlSystems

# --------------------------------------------------
# Transfer function using the Laplace operator s
# --------------------------------------------------

s = tf("s")

println("Transfer function using s:")
G = 38.9 / (s^2 + 5*s + 6)