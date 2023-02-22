module readAeroXFLR

using CSV
import DataFrames: DataFrame

export readAero

""" readAero(filename::String, allFields::Bool = false)

    Returns Mach, Re, alpha, CL, CD, CM from XFLR5 output file 
    containing aerodynamic characteristics. alpha is in degrees. 
    Turning on the allFields option returns Mach, Re, data. 
    data is a structure containing all columns of the XFLR5 file.
    The field names of the structure can be displayed 
    using names(data) """
    function readAero(filename::String, allFields::Bool = false)
        # Get Mach and Re numbers
        # Skip 7 lines
        Mach = 0.0
        Re = 0.0
        open(filename) do fh
            for i in 1:7
                readline(fh)
            end

            # Extract Mach and Re value strings
            lineMachRe = split(readline(fh), "Ncrit")[1]
            MachString = split(split(lineMachRe, "Re")[1], "=")[2]
            ReString = split(lineMachRe, "Re =")[2]

            # Remove whitespace inside strings and convert to floats
            Mach = parse(Float64, 
                         filter(x -> !isspace(x), strip(MachString)))
            Re = parse(Float64, 
                       filter(x -> !isspace(x), strip(ReString)))
        end

        # Get aerodynamic data
        out = CSV.read(filename, skipto=12, delim=' ', 
                       ignorerepeated=true, header=10, DataFrame)

        if allFields
            return Mach, Re, out
        else
            return Mach, Re, out.alpha, out.CL, out.CD, out.Cm
        end
    end
end
