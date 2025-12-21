using ControlSystems
using Plots

# ------------------------------------------------------------
# RLC circuit model (MIMO)
# States: x = [i1; uc]
# Inputs: u = [u1; u2]
# Outputs: y = [i2; u0]
# ------------------------------------------------------------
function model_el_kola(R, L, C)
    A = [-R/L      -1/L;
          1/C   -1/(R*C)]

    B = [ 1/L      -1/L;
          0     -1/(R*C)]

    # y1 = i2 = (uc + u2)/R  => i2 = (1/R)*uc + (1/R)*u2
    # y2 = u0 = uc + u2      => u0 = 1*uc + 1*u2
    Cmat = [0    1/R;
            0    1]

    Dmat = [0    1/R;
            0    1]

    return ss(A, B, Cmat, Dmat)
end

# Parameters
R = 1_000        # 1 kΩ
L = 22e-3          # 22 mH
C = 470e-9         # 470 nF  = 4.7e-7 F

sys = model_el_kola(R, L, C)

# Simulation
t = 0:0.01:10
u = sin.(t)                  # u1(t) = u2(t) = sin(t)
U = [u u]'                   # 2×N input matrix: [u1; u2]

y, t_out, x = lsim(sys, U, t)

# y has size (ny, N), x has size (nx, N)
i2 = y[1, :]                # output 1
u0 = y[2, :]                 # output 2

i1 = x[1, :]                 # state 1
uc = x[2, :]                 # state 2

# Plot outputs
p1 = plot(t_out, i2, lw=2, label="i2(t)", xlabel="t [s]", ylabel="A")
p2 = plot(t_out, u0, lw=2, label="u0(t)", xlabel="t [s]", ylabel="V")
plot(p1, p2, layout=(2, 1), size=(800, 500))

# (Optional) Plot states too
p3 = plot(t_out, i1, lw=2, label="i1(t)", xlabel="t [s]", ylabel="A")
p4 = plot(t_out, uc, lw=2, label="uc(t)", xlabel="t [s]", ylabel="V")
plot(p3, p4, layout=(2, 1), size=(800, 500))