# Undigits

[![Build Status](https://github.com/jlapeyre/Undigits.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/jlapeyre/Undigits.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/jlapeyre/Undigits.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/jlapeyre/Undigits.jl)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)


This package provides `undigits`, the reverse of `digits`. 

```julia
julia> undigits([2, 4])
42

julia> undigits([2, 4]; rev=true)
24
```

julia> undigits(UInt8, [1, 0, 1, 1]; base=2)
0x0d
```
