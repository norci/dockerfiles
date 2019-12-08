##
run(`sudo chown devel:users /home/devel/`)
import Pkg
##
# try
#     import PkgMirrors
# catch err
#     if isa(err, ArgumentError)
#         Pkg.Registry.add(Pkg.RegistrySpec(url="https://mirrors.zju.edu.cn/julia/registries/General.git"))
#         Pkg.add(Pkg.PackageSpec(url="https://mirrors.zju.edu.cn/julia/PkgMirrors.jl.git", rev="v1.2.0"))
#         import PkgMirrors
#         PkgMirrors.setmirror("ZJU")
#     else
#         throw(err)
#     end
# end
Pkg.update()
##
Pkg.add.([
    "BenchmarkTools",
    "CSV",
    "Conda",
    "DataFrames",
    "DataFramesMeta",
    "DecisionTree",
    "Distributions",
    "Flux",
    "GLM",
    "IJulia",
    "JuliaDB",
    "JuliaDBMeta",
    "MultivariateStats",
    "PackageCompiler",
    "Plotly",
    "RDatasets",
    "ScikitLearn",
    "StatsPlots",
    "Gadfly",
    "Fontconfig"
    ])
## cuda
try
    run(`nvidia-smi`)
    Pkg.add.([
        "CUDAnative",
        "CuArrays"
    ])
catch err
    if !isa(err,Base.IOError)
        throw(err)
    end
end
##
import Conda
Conda.add_channel("conda-forge")
Conda.add([
    "jupyter",
    "jupyterlab",
    "nodejs",
    "nbdime",
    "jupyterlab-git",
    "pip"
    ])
##
ENV["NODE_MIRROR"]="https://mirrors.huaweicloud.com/nodejs/"
ENV["PATH"] *= ":" * ENV["HOME"] * "/.julia/conda/3/bin/"
ENV["NODE_OPTIONS"]="--max-old-space-size=4096"
##
run(`pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple`)
run(`nbdime extensions --enable`)
run(`jupyter labextension install --no-build \
@jupyter-widgets/jupyterlab-manager \
@jupyterlab/git \
@jupyterlab/toc \
jupyterlab-plotly\
plotlywidget \
&& jupyter lab build`)
## See: https://github.com/jupyterlab/jupyterlab-github#Installation
run(`jupyter serverextension enable --py jupyterlab_git`)
##
exit()
