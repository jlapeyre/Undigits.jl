using Undigits
using Documenter

DocMeta.setdocmeta!(Undigits, :DocTestSetup, :(using Undigits); recursive=true)

makedocs(;
    modules=[Undigits],
    authors="John Lapeyre",
    sitename="Undigits.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
