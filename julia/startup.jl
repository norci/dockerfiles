ENV["JULIA_NUM_THREADS"] = Base.Sys.CPU_THREADS
ENV["JULIA_CUDA_USE_BINARYBUILDER"] = false

try
    using Revise
catch e
    @warn(e.msg)
end

try
    # if ENV["OS"] != "Windows_NT"
    using InteractiveCodeSearch
    InteractiveCodeSearch.CONFIG.interactive_matcher = `peco`
    # end
catch e
    @warn(e.msg)
end
