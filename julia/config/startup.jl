# The envs below must be set in system env
# JULIA_NUM_THREADS
# JULIA_DEPOT_PATH

ENV["JULIA_PKG_SERVER"] = "https://mirrors.sjtug.sjtu.edu.cn/julia"

if haskey(ENV, "CUDNN_VERSION")
    ENV["JULIA_CUDA_USE_BINARYBUILDER"] = false
end

if haskey(ENV, "OS") && ENV["OS"] == "Windows_NT"
    ENV["CONDA_JL_HOME"] = joinpath(ENV["USERPROFILE"], raw".conda\envs\julia")
elseif haskey(ENV, "OSTYPE") && ENV["OSTYPE"] == "linux-gnu"
end

try
    using Revise
catch e
end
