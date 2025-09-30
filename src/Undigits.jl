module Undigits

export undigits

@inline _bitsizeof(::Type{T}) where T = 8 * sizeof(T)

# This is only an optimization. Tests are highly variable for unknown reasons.
# So, I am not sure how much is saved here.
# This will fail for BigInt
function _undigits_base_2(::Type{IntT}, A, rev::Bool) where IntT <: Unsigned
    _bitsizeof(IntT) < length(A) && throw(OverflowError("Output data type is too small for input data"))
    n = zero(IntT)
    inds = rev ? eachindex(A) : reverse(eachindex(A))
    @inbounds for i = inds
        n = IntT(2) * n + IntT(A[i])
    end
    return n
end

"""
    undigits([IntT=Int], A; base=10, rev=false)::IntT

The inverse of `digits`. That is `undigits(digits(n; base); base) == n`.
The number returned is of type `IntT` provided that the type is stable
under `+` and `*`, and that each element of `A` can be converted to `IntT`.

# Exceptions
* `OverflowError` if `A` represents a number larger than `typemax(IntT)`. For
   `Unsigned` types the check is more strict in that `length(A)` must not be
    greater than the number of bits in `IntT`, even if there are leading zeros.


# Examples
```jldoctest
julia> undigits([2, 4])
42

julia> undigits([2, 4]; rev=true)
24
```

julia> undigits(UInt8, [1, 0, 1, 1]; base=2)
0x0d
"""
undigits(A; base=10, rev=false) = undigits(Int, A; base, rev)

function undigits(::Type{IntT}, A; base=10, rev=false) where IntT
    base == 2 && IntT <: Unsigned && return _undigits_base_2(IntT, A, rev)
    n = zero(IntT)
    baset = IntT(base)
    inds = rev ? eachindex(A) : reverse(eachindex(A))
    @inbounds for i in inds
        n = Base.checked_add(Base.checked_mul(baset, n), IntT(A[i]))
    end
    return n
end

end # module Undigits
