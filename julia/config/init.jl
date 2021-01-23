using Pkg
Pkg.add.(
    [
        "BenchmarkTools"
        "Conda"
        "Debugger"
        "JuliaFormatter"
        "PackageCompiler"
        "PkgTemplates"
        "ProfileView"
        "Revise"
    ],
)
Pkg.precompile()
