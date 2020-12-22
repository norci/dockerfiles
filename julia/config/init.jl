using Pkg
Pkg.add.([
    "BenchmarkTools"
    "Conda"
    "Debugger"
    "JuliaFormatter"
    "Makie"
    "PackageCompiler"
    "PkgTemplates"
    "ProfileView"
    "Revise"
])
Pkg.precompile()
