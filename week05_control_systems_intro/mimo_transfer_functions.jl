using ControlSystems

# --------------------------------------------------
# MIMO transfer function matrix (2 inputs, 2 outputs)
# --------------------------------------------------

println("MIMO transfer function matrix:")

W = [
    tf(1, [2, 3])    tf(1, [1, 0]);
    tf(10, [3, 1])   tf(1, [1, 2, 3])
]