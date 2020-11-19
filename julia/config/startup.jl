# The envs below must be set in system env
# JULIA_NUM_THREADS
# JULIA_DEPOT_PATH

ENV["JULIA_CUDA_USE_BINARYBUILDER"] = false
ENV["JULIA_PKG_SERVER"] = "https://mirrors.bfsu.edu.cn/julia"

try
    using Revise
    using InteractiveCodeSearch
    InteractiveCodeSearch.CONFIG.interactive_matcher = `peco`
catch e
    # @warn(e.msg)
end
