import Pkg

# https://github.com/sunoru/PkgMirrors.jl
try
    import PkgMirrors
catch err
    if isa(err, ArgumentError)
        Pkg.Registry.add(Pkg.RegistrySpec(url="https://mirrors.zju.edu.cn/julia/registries/General.git"))
        Pkg.add(Pkg.PackageSpec(url="https://mirrors.zju.edu.cn/julia/PkgMirrors.jl.git", rev="v1.3.0"))
        import PkgMirrors
        PkgMirrors.setmirror("ZJU")
    else
        throw(err)
    end
end

Pkg.update()

##
Pkg.add.([
    "CSV",
    "DataFrames",
    "Flux",
    "IJulia",
    "JuliaDB",
    "JuliaDBMeta",
    "Query",
    "OnlineStats",
    "StatsPlots",
    "Gadfly",
    ])
##

exit()
