# The envs below must be set in system env
# JULIA_NUM_THREADS
# JULIA_DEPOT_PATH

# false for nvidia docker.
# ENV["JULIA_CUDA_USE_BINARYBUILDER"] = false

ENV["JULIA_PKG_SERVER"] = "https://mirrors.sjtug.sjtu.edu.cn/julia"

if ENV["OS"] == "Windows_NT"
    ENV["CONDA_JL_HOME"] = joinpath(ENV["USERPROFILE"], raw".conda\envs\julia")
end

try
    using Revise
catch e
end
