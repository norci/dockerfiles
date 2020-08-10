import Pkg
Pkg.update()
Pkg.add.([
    "BenchmarkTools",
    "Conda",
    "CSV",
    "DataFrames",
    "DataFramesMeta",
    "Distributions",
    "Flux",
    "Gadfly",
    "IJulia",
    "InteractiveCodeSearch",
    "JuliaDB",
    "JuliaDBMeta",
    "MultivariateStats",
    "PackageCompiler",
    "PkgTemplates",
    "Plotly",
    "RDatasets",
    "ReinforcementLearning",
    "Revise",
    "ScikitLearn",
    "StatsPlots",
    ])
Pkg.build()
# Pkg.precompile() # too slow
exit()