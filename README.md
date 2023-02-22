# readAeroXFLR.jl
Julia script to read airfoil aerodynamic data output from XFLR5

## Installation
Install in Julia using the package manager.
```julia
using Pkg
Pkg.add("https://github.com/cibinjoseph/readAeroXFLR.jl")
```

Run tests to check if the package works.
```julia
using Pkg
Pkg.test("readAeroXFLR")
```

## Usage
```julia
using readAeroXFLR
Mach, Re, alpha, CL, CD, CM = readAero("naca4412XFLR.dat")
```
