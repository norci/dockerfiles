import Pkg
Pkg.update()
Pkg.add.([
    "BenchmarkTools",
    "CSV",
    "DataFrames",
    "Flux",
    "JuliaDB",
    "JuliaDBMeta",
    "Query",
    "OnlineStats",
    "Revise",
    "StatsPlots",
    "Gadfly",
    ])
Pkg.precompile()
