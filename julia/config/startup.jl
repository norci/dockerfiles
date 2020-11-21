# The envs below must be set in system env
# JULIA_NUM_THREADS
# JULIA_DEPOT_PATH

# false for nvidia docker.
# ENV["JULIA_CUDA_USE_BINARYBUILDER"] = false

# sometimes github is fast enough. the mirrors are not up to date.
ENV["JULIA_PKG_SERVER"] = "https://mirrors.bfsu.edu.cn/julia"
# ENV["JULIA_PKG_SERVER"] = "https://mirrors.sjtug.sjtu.edu.cn/julia"

if ENV["OS"] == "Windows_NT"
    ENV["CONDA_JL_HOME"] = joinpath(ENV["USERPROFILE"], raw".conda\envs\julia")
end

try
    using Revise
catch e
    # @warn(e.msg)
end
