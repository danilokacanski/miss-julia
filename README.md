# Modeling and Simulation of Systems – Julia Exercises

This repository contains all materials used during the laboratory sessions for the course **Modelovanje i simulacija sistema**.  
All examples, simulations, and assignments are implemented in the **Julia programming language** using VS Code.

The goal of this repository is to provide students with clear, reproducible code for:
- modeling linear and nonlinear dynamical systems,
- working with differential equations,
- simulating continuous and discrete-time models,
- analyzing system responses,
- visualizing results,
- comparing numerical methods and model behavior,
- applying control concepts using Julia packages.

---

## 🔧 Requirements

To run the code from this repository, you need:

- **Julia 1.x LTS**
- **VS Code** with the *Julia* extension installed

### Required Julia packages

```julia
using Pkg
Pkg.add("LinearAlgebra")
Pkg.add("Statistics")
Pkg.add("Plots")
Pkg.add("DifferentialEquations")
Pkg.add("ControlSystems")