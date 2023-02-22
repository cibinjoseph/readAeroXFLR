# readAeroXFLR.jl
Julia script to read airfoil aerodynamic data output from XFLR5

## Installation
Install in Julia using the package manager.
```julia
using Pkg
Pkg.add(url="https://github.com/cibinjoseph/readAeroXFLR.jl")
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

## Documentation
```julia
using readAeroXFLR
?readAero

  readAero(filename, allFields = false)
  Returns Mach, Re, alpha, CL, CD, CM from XFLR5 output file containing
  aerodynamic characteristics. alpha is in degrees. Turning on the
  allFields option returns Mach, Re, data data is a structure containing
  all columns of the XFLR5 file. The field names of the structure can be
  displayed using fieldnames()

```
