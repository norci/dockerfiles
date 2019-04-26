##
run(`sudo chown devel:users /home/devel/`)
import Pkg
##
try
    import PkgMirrors
catch err
    if isa(err, ArgumentError)
        Pkg.Registry.add(Pkg.RegistrySpec(url="https://mirrors.zju.edu.cn/julia/registries/General.git"))
        Pkg.add(Pkg.PackageSpec(url="https://mirrors.zju.edu.cn/julia/PkgMirrors.jl.git", rev="v1.2.0"))
        import PkgMirrors
        PkgMirrors.setmirror("ZJU")
    else
        throw(err)
    end
end
Pkg.update()
##
Pkg.add("Conda")
import Conda
Conda.add_channel.([
    "https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/",
    "https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/",
    "https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/"
    ])
Conda.add("pip")
run(`pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`)
##
Pkg.add.([
    "BenchmarkTools",
    "CUDAnative",
    "Compose",
    "CSV",
    "CuArrays",
    "DataFrames",
    # "DataVoyager",
    # "Electron",
    "DecisionTree",
    "Flux",
    "GLM",
    "GR",
    "Gadfly",
    "HDF5",
    "IJulia",
    "JuliaDB",
    # "Latexify",
    "MultivariateStats",
    "PackageCompiler",
    "Plots",
    "Queryverse",
    "RDatasets",
    "ScikitLearn",
    "StatsPlots"
    ])
## python
Conda.add([
    "jupyter",
    "jupyterlab",
    "nodejs",
    "nbdime",
    "jupyterlab-git"
    ])
## nodejs
run(`nbdime extensions --enable`)
run(`jupyter labextension install @jupyterlab/git @jupyterlab/github @jupyterlab/toc`)
run(`jupyter serverextension enable --py jupyterlab_git`)
## See: https://github.com/jupyterlab/jupyterlab-github#Installation
run(`pip install -U jupyterlab_github`)
##
exit()
