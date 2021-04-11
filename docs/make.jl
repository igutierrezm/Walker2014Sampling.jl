using Walker2014Sampling
using Documenter

DocMeta.setdocmeta!(Walker2014Sampling, :DocTestSetup, :(using Walker2014Sampling); recursive=true)

makedocs(;
    modules=[Walker2014Sampling],
    authors="Iván Gutiérrez <ivangutierrez1988@gmail.com> and contributors",
    repo="https://github.com/igutierrezm/Walker2014Sampling.jl/blob/{commit}{path}#{line}",
    sitename="Walker2014Sampling.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://igutierrezm.github.io/Walker2014Sampling.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/igutierrezm/Walker2014Sampling.jl",
)
