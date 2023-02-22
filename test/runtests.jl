using readAeroXFLR
using Test

CL_actual = [0.5292, 0.5765, 0.6479, 0.7014, 0.7553]
alpha_actual = [0.5, 1.0, 1.5, 2.0, 2.5]

M, Re, out = readAero("naca4412XFLR5.dat", true)

@testset "readAero1" begin
    @test isapprox(M, 0.1, atol=1e-6)
    @test isapprox(Re, 1e6, atol=1e-6)
    @test isapprox(out.alpha, alpha_actual, atol=1e-6)
    @test isapprox(out.CL, CL_actual, atol=1e-6)
    @test length(names(out)) == 12
end

M, Re, alpha, CL, CD, CM = readAero("naca4412XFLR5.dat")
@testset "readAero2" begin
    @test isapprox(M, 0.1, atol=1e-6)
    @test isapprox(Re, 1e6, atol=1e-6)
    @test isapprox(alpha, alpha_actual, atol=1e-6)
    @test isapprox(CL, CL_actual, atol=1e-6)
end
