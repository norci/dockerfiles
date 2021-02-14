using Pkg
Pkg.add.(
    [
        "BenchmarkTools"
        "Conda"
        "Debugger"
        "InteractiveCodeSearch"
        "JuliaFormatter"
        "PackageCompiler"
        "PkgTemplates"
        "ProfileView"
        "Revise"
    ],
)
Pkg.precompile()
