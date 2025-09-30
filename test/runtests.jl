using Undigits
using Test

@testset "Undigits.jl" begin
    n = 12345
    @test undigits(digits(n)) == n
    @test undigits(digits(n, base=2), base=2) == n
    @test undigits(digits(n, base=2), base=10) != n

    @test_throws OverflowError undigits(UInt, fill(1, 1000))

    for n in (12345,)
        for T in (Int, UInt, Int32, UInt32, Int16, UInt16, Int128, BigInt)
            for base in (2, 10, 3, 16)
                nt = T(n)
                _digits = digits(nt; base=base)
                n1 = undigits(T, nt; base=base)
                @test n1 == nt
                @test typeof(n1) == typeof(nt)
                if ! (T <: BigInt)
                    @test n1 === nt
                end
            end
        end
    end
end
