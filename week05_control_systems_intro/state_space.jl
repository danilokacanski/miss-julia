using ControlSystems

# --------------------------------------------------
# Continuous-time state-space model
# --------------------------------------------------

A = [0 1;
     0 -12.5]

B = [0;
     38.9]

C = [0 1]
D = 0

println("Continuous-time state-space model:")
sys_ct = ss(A, B, C, D)

# --------------------------------------------------
# Discrete-time state-space model
# --------------------------------------------------

Ts = 0.025   # sampling time [s]

E = [1 0.02147;
     0 0.73160]

F = [0.01098;
     0.83520]

C = [0 1]
D = 0

println("Discrete-time state-space model:")
sys_dt = ss(E, F, C, D, Ts)